#include <avr/io.h>
#include <avr/interrupt.h>
#include "BLDC.h"
#include "SPI.h"
#include "USART.h"
#include "Registers.h"

ISR(ADC_vect)
{
  //OCR2B = OCR0A = OCR0B = ADCH;
}

volatile float ticks_per_second_setpoint = 0.0f;
volatile float kP = 0.0;
volatile float kI = 0;
volatile uint32_t last_bldc_ticks;
volatile float ticks_per_second_filtered = 0.0f;
volatile float error_i = 0.0f;
volatile float filter = 0.5;

void speed_control()
{
  uint32_t ticks = bldc_ticks;
  uint32_t diff = ticks - last_bldc_ticks;
  float ticks_per_second = (float)diff / 0.01f;
  ticks_per_second_filtered = filter * ticks_per_second_filtered + (1.0 - filter) * ticks_per_second;
  float error = ticks_per_second_setpoint - ticks_per_second_filtered;

  //usart_send(error);

  float p_value = error * kP;
  float setpoint = p_value + error_i * kI;

  if (fabsf(p_value) < 255.0)
  {
    error_i += error * 0.01;
  }

  if (setpoint > 255.0f)
  {
    setpoint = 255.0f;
  }
  else if (setpoint < 0.0f)
  {
    setpoint = 0.0f;
  }
  OCR2B = OCR0A = OCR0B = setpoint;

  last_bldc_ticks = ticks;
}

// Called with 100Hz
ISR(TIMER1_COMPA_vect)
{
  switch (REGISTER[REG_CONTROL_MODE])
  {
  case CONTROL_MODE_SPEED_CTL:
    speed_control();
    break;
  case CONTROL_MODE_TORQUE_CTL:
    OCR2B = OCR0A = OCR0B = (REGISTER[REG_SETPOINT] >> 8);
    break;
  default:
    OCR2B = OCR0A = OCR0B = 0;
    break;
  }

  update_driver_status();
}


int main()
{
  init_usart();
  init_spi_master();
  init_bldc();

  // Setup Timer1 for periodic tasks.
  // Frequency = 100 Hz
  TCCR1A = 0b00000000;
  TCCR1B = 0b00001100;
  OCR1AH = 0x02;
  OCR1AL = 0x70;
  TIMSK1 = 0b10;

  // Enable ADC
  ADCSRA = 0b11111111;
  ADMUX = 0b01100011;

  while (1)
    ;
}
