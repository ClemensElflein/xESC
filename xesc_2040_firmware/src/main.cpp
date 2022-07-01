// Created by Clemens Elflein on 06/28/22.
// Copyright (c) 2022 Clemens Elflein. All rights reserved.
//
// This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
//
// Feel free to use the design in your private/educational projects, but don't try to sell the design or products based on it without getting my consent first.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//

#include <Arduino.h>
#include "hardware/pwm.h"
#include "hardware/dma.h"
#include "hardware/adc.h"
#include "hardware/watchdog.h"
#include <PacketSerial.h>
#include "xesc_2040_datatypes.h"
#include <FastCRC.h>
#include "pins.h"
#include "config.h"

#define WRAP 3299


#define FAULT_UNINITIALIZED 0b10
#define FAULT_WATCHDOG 0b10
#define FAULT_UNDERVOLTAGE 0b100
#define FAULT_OVERVOLTAGE 0b1000
#define FAULT_OVERCURRENT 0b10000
#define FAULT_OVERTEMP_MOTOR 0b100000
#define FAULT_OVERTEMP_PCB 0b1000000
#define FAULT_INVALID_HALL 0b10000000

// NTC Termistors
#define NTC_RES(adc_val) ((4095.0 * 10000.0) / adc_val - 10000.0)
#define NTC_TEMP(adc_val) (1.0 / ((logf(NTC_RES(adc_val) / 10000.0) / PCB_NTC_BETA) + (1.0 / 298.15)) - 273.15)

#define NTC_RES_MOTOR(adc_val) (10000.0 / ((4095.0 / (float)adc_val) - 1.0)) // Motor temp sensor on low side
#define NTC_TEMP_MOTOR(adc_val) (1.0 / ((logf(NTC_RES_MOTOR(adc_val) / 10000.0) / MOTOR_NTC_BETA) + (1.0 / 298.15)) - 273.15)

void setupPWM();

// The current duty for the motor (-1.0 - 1.0)
volatile float duty = 0.0;
// The absolute value to cap the requested duty to stay within current limits (0.0 - 1.0)
volatile float current_limit_duty = 0.0;
// The requested duty
volatile float duty_setpoint = 0.0;
// The ramped duty. This will ramp to avoid current spikes
volatile float duty_setpoint_ramped = 0.0;

// init with invalid hall so we have to update
volatile uint last_hall = 0xFF;
// init with out of range duty, so we have to update
volatile float last_duty = 1000.0f;

Xesc2040StatusPacket status = {0};
Xesc2040SettingsPacket settings = {0};
bool settings_valid = false;

bool invalid_hall = false;
float error_i = 0;

unsigned long last_current_control_micros = 0;
unsigned long invalid_hall_start = 0;
unsigned long last_ramp_update_millis = 0;
unsigned long last_status_millis = 0;
unsigned long last_watchdog_millis = 0;
unsigned long last_fault_millis = 0;


uint8_t analog_round_robin = 0;

PacketSerial packetSerial;
FastCRC16 CRC16;

void onPacketReceived(const uint8_t *buffer, size_t size);

void sendMessage(void *message, size_t size)
{
  // packages need to be at least 1 byte of type, 1 byte of data and 2 bytes of CRC
  if (size < 4)
  {
    return;
  }
  uint8_t *data_pointer = (uint8_t *)message;

  // calculate the CRC
  uint16_t crc = CRC16.ccitt((uint8_t *)message, size - 2);
  data_pointer[size - 1] = (crc >> 8) & 0xFF;
  data_pointer[size - 2] = crc & 0xFF;

  packetSerial.send((uint8_t *)message, size);
}

void setCommutation(uint8_t step)
{
  switch (step)
  {
  case 1:
    // Phase 1
    // U = L
    // V = PWM
    // W = Z
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_UH, 0);
    pwm_set_gpio_level(PIN_WH, 0);
    pwm_set_gpio_level(PIN_VH, WRAP * duty);
    // gpio_set_mask(0b001 << 8);
    gpio_put_masked(0b111 << 8, 0b001 << 8);
    break;
  case 2:
    // Phase 2
    // U = L
    // V = Z
    // W = PWM
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_UH, 0);
    pwm_set_gpio_level(PIN_VH, 0);
    pwm_set_gpio_level(PIN_WH, WRAP * duty);
    // gpio_set_mask(0b001 << 8);
    gpio_put_masked(0b111 << 8, 0b001 << 8);
    break;
  case 3:
    // Phase 3
    // U = Z
    // V = L
    // W = PWM
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_UH, 0);
    pwm_set_gpio_level(PIN_VH, 0);
    pwm_set_gpio_level(PIN_WH, WRAP * duty);
    // gpio_set_mask(0b010 << 8);
    gpio_put_masked(0b111 << 8, 0b010 << 8);
    break;
  case 4:
    // Phase 4
    // U = PWM
    // V = L
    // W = Z
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_VH, 0);
    pwm_set_gpio_level(PIN_WH, 0);
    pwm_set_gpio_level(PIN_UH, WRAP * duty);
    // gpio_set_mask(0b010 << 8);

    gpio_put_masked(0b111 << 8, 0b010 << 8);
    break;
  case 5:
    // Phase 5
    // U = PWM
    // V = Z
    // W = L
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_VH, 0);
    pwm_set_gpio_level(PIN_WH, 0);
    pwm_set_gpio_level(PIN_UH, WRAP * duty);
    // gpio_set_mask(0b100 << 8);

    gpio_put_masked(0b111 << 8, 0b100 << 8);
    break;
  case 6:
    // Phase 6
    // U = Z
    // V = PWM
    // W = L
    // gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_UH, 0);
    pwm_set_gpio_level(PIN_WH, 0);
    pwm_set_gpio_level(PIN_VH, WRAP * duty);
    // gpio_set_mask(0b100 << 8);

    gpio_put_masked(0b111 << 8, 0b100 << 8);
    break;
  default:
    gpio_put_masked(0b111 << 8, 0);
    pwm_set_gpio_level(PIN_UH, 0);
    pwm_set_gpio_level(PIN_VH, 0);
    pwm_set_gpio_level(PIN_WH, 0);
    break;
  }
}

void updateCommutation()
{
  // If fault, turn off motor
  if (status.fault_code || !settings_valid)
  {
    setCommutation(255);
    return;
  }
  uint8_t hall_sensors = (gpio_get_all() >> 22) & 0b111;
  uint8_t commutation = settings.hall_table[hall_sensors];
  if (commutation < 1 || commutation > 6)
  {
    // Invalid hall table
    if (!invalid_hall)
    {
      // New invalid hall state, note time
      invalid_hall_start = millis();
      invalid_hall = true;
    }
    return;
  }
  invalid_hall = false;
  if (last_duty == duty && last_hall == hall_sensors)
    return;
  last_hall = hall_sensors;
  last_duty = duty;

  setCommutation(commutation);
}

float readCurrent()
{
  return (float)analogRead(PIN_CURRENT_SENSE) * (3.3f / 4096.0f) / (CURRENT_SENSE_GAIN * R_SHUNT);
}

void setup()
{
  rp2040.idleOtherCore();

  status.message_type = XESC2040_MSG_TYPE_STATUS;
  status.fw_version_major = 0;
  status.fw_version_minor = 9;

  settings_valid = false;

  // Setup Pin directions
  pinMode(PIN_UH, OUTPUT);
  pinMode(PIN_VH, OUTPUT);
  pinMode(PIN_WH, OUTPUT);

  pinMode(PIN_UL, OUTPUT);
  pinMode(PIN_VL, OUTPUT);
  pinMode(PIN_WL, OUTPUT);
  pinMode(PIN_LED_RED, OUTPUT);
  pinMode(PIN_LED_GREEN, OUTPUT);

  digitalWrite(PIN_LED_RED, HIGH);
  digitalWrite(PIN_LED_GREEN, HIGH);

  digitalWrite(PIN_UH, LOW);
  digitalWrite(PIN_VH, LOW);
  digitalWrite(PIN_WH, LOW);
  digitalWrite(PIN_UL, LOW);
  digitalWrite(PIN_VL, LOW);
  digitalWrite(PIN_WL, LOW);

  setupPWM();

  analogReadResolution(12);

  PACKET_SERIAL.begin(115200);
  packetSerial.setStream(&PACKET_SERIAL);
  packetSerial.setPacketHandler(&onPacketReceived);

  rp2040.restartCore1();
}

void setup1()
{
}

void loop1()
{
  if (duty_setpoint_ramped > current_limit_duty)
  {

    digitalWrite(PIN_LED_GREEN, HIGH);
    duty = current_limit_duty;
  }
  else if (duty_setpoint_ramped < -current_limit_duty)
  {

    digitalWrite(PIN_LED_GREEN, HIGH);
    duty = -current_limit_duty;
  }
  else
  {
    digitalWrite(PIN_LED_GREEN, LOW);
    duty = duty_setpoint_ramped;
  }

  unsigned long now = micros();
  if (now - last_current_control_micros > 500)
  {

    float dt = (now - last_current_control_micros) / 1000000.0f;

    float error = settings.motor_current_limit - status.current_input;
    if (duty_setpoint_ramped == 0.0f)
    {
      error_i = 0.0f;
    }
    else if (abs(current_limit_duty) < duty_setpoint_ramped)
    {
      error_i += error * dt;
    }
    current_limit_duty = CURRENT_P * error + CURRENT_I * error_i;
    current_limit_duty = constrain(current_limit_duty, 0.0f, MAX_DUTY_CYCLE);

    last_current_control_micros = now;
  }
  updateCommutation();
}

void setupPWM(uint pin)
{
  uint slice = pwm_gpio_to_slice_num(pin);
  uint channel = pwm_gpio_to_channel(pin);
  pwm_set_counter(slice, 0);
  pwm_set_phase_correct(slice, true);
  pwm_set_enabled(slice, false);
  pwm_set_clkdiv(slice, 1);
  pwm_set_wrap(slice, WRAP);
  pwm_set_chan_level(slice, channel, 0);
  gpio_set_function(pin, GPIO_FUNC_PWM);
}

void setupPWM()
{
  setupPWM(PIN_UH);
  setupPWM(PIN_VH);
  setupPWM(PIN_WH);
  pwm_set_mask_enabled(0b11000000);
}

float readVIN()
{
  return (float)analogRead(PIN_VIN) * (3.3f / 4096.0f) * ((VIN_R1 + VIN_R2) / VIN_R2);
}

float readMotorTemp()
{
  return NTC_TEMP_MOTOR((float)analogRead(PIN_TEMP_MOTOR));
}

float readPcbTemp()
{
  return NTC_TEMP((float)analogRead(PIN_TEMP_PCB));
}

void onPacketReceived(const uint8_t *buffer, size_t size)
{
  // Check, if the packet is valid (1 type byte + 1 data byte + 2 bytes min)
  if (size < 3)
  {
    return;
  }

  // check the CRC
  uint16_t crc = CRC16.ccitt(buffer, size - 2);

  if (buffer[size - 1] != ((crc >> 8) & 0xFF) ||
      buffer[size - 2] != (crc & 0xFF))
  {
    return;
  }

  // TODO set heartbeat
  switch (buffer[0])
  {
  case XESC2040_MSG_TYPE_CONTROL:
  {
    if (size != sizeof(struct Xesc2040ControlPacket))
    {
      return;
    }
    // Got control packet
    last_watchdog_millis = millis();
    Xesc2040ControlPacket *packet = (Xesc2040ControlPacket *)buffer;
    duty_setpoint = constrain(packet->duty_cycle, -1.0, 1.0);
  }
  break;

  default:
    // Wrong packet ID
    break;
  }
}

void updateFaults()
{
  uint32_t faults = 0;

  // FAULT_UNINITIALIZED
  if(!settings_valid) {
    faults |= FAULT_UNINITIALIZED;
  }

  // FAULT_WATCHDOG
  if(millis() - last_watchdog_millis > WATCHDOG_TIMEOUT_MILLIS) {
    faults |= FAULT_WATCHDOG;
  }
  
  // FAULT_UNDERVOLTAGE
  if(status.voltage_input < HW_LIMIT_VLOW) {
    faults |= FAULT_UNDERVOLTAGE;
  }

  // FAULT_OVERVOLTAGE
  if(status.voltage_input > HW_LIMIT_VHIGH) {
    faults |= FAULT_OVERVOLTAGE;
  }
  
  // FAULT_OVERCURRENT
  if(status.current_input > HW_LIMIT_CURRENT) {
    faults |= FAULT_OVERCURRENT;
  }

  // FAULT_OVERTEMP_MOTOR
  if(settings.has_motor_temp && status.temperature_motor > min(HW_LIMIT_MOTOR_TEMP, settings.max_motor_temp)) {
    faults |= FAULT_OVERTEMP_MOTOR;
  }
  // FAULT_OVERTEMP_PCB
  if(status.temperature_pcb > min(HW_LIMIT_PCB_TEMP, settings.max_pcb_temp)) {
    faults |= FAULT_OVERTEMP_MOTOR;
  }

  // FAULT_INVALID_HALL
  if (invalid_hall && millis() - invalid_hall_start > 100)
  {
    // it's already invalid, check if it was invalid for some time and set fault
    faults |= FAULT_INVALID_HALL;
  }


  if(faults) {
    // We have faults, set them in the status
    digitalWrite(PIN_LED_RED, HIGH);
    status.fault_code = faults;
    last_fault_millis = millis();
  } else if(faults == 0 && status.fault_code != 0) {
    // We want to reset faults. Only reset if MIN_FAULT_TIME_MILLIS has passed
    if(millis() - last_fault_millis > MIN_FAULT_TIME_MILLIS) {
      digitalWrite(PIN_LED_RED, LOW);
      status.fault_code = 0;
    }
  }
}

void loop()
{
  if (millis() - last_status_millis > STATUS_UPDATE_MILLIS)
  {
    status.seq++;
    updateFaults();
    sendMessage(&status, sizeof(status));

    last_status_millis = millis();
  }

  // We need to ramp the duty cycle
  if (millis() - last_ramp_update_millis > 10)
  {
    float dt = (float)(millis() - last_ramp_update_millis) / 1000.0f;
    last_ramp_update_millis = millis();
    if (duty_setpoint != duty_setpoint_ramped)
    {
      if (duty_setpoint > duty_setpoint_ramped)
      {
        duty_setpoint_ramped = min(duty_setpoint, duty_setpoint_ramped + settings.acceleration * dt);
      }
      else
      {
        duty_setpoint_ramped = max(duty_setpoint, duty_setpoint_ramped - settings.acceleration * dt);
      }
    }
  }

  switch (analog_round_robin)
  {
  case 0:
    status.current_input = readCurrent() * 0.001 + status.current_input * 0.999;
    break;
  case 1:
    status.voltage_input = readVIN() * 0.001 + status.voltage_input * 0.999;
    break;
  case 2:
    status.temperature_motor = readMotorTemp() * 0.001 + status.temperature_motor * 0.999;
    break;
  case 3:
    status.temperature_pcb = readPcbTemp() * 0.001 + status.temperature_pcb * 0.999;
    break;

  default:
    break;
  }

  analog_round_robin = (analog_round_robin + 1) % 4;

  packetSerial.update();
}