/* #####
# Direct flash command
 ~\.platformio\packages\tool-openocd\bin\openocd.exe -d2 -s ~\.platformio\packages\tool-openocd/scripts -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f4x.cfg -c "program {.pio\build\genericSTM32F405RG\firmware.elf}  verify reset; shutdown;"


~\.platformio\packages\tool-openocd\bin\openocd.exe -d2 -s ~\.platformio\packages\tool-openocd/scripts -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f4x.cfg -c "init; halt; stm32f2x mass_erase 0; stm32f2x mass_erase 1; program Bootloader.bin verify 0x08000000; program Firmware_with_Drive_config.bin 0x08008000 verify reset; shutdown;"

~\.platformio\packages\tool-openocd\bin\openocd.exe -d2 -s ~\.platformio\packages\tool-openocd/scripts -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32f4x.cfg -c "init; halt; stm32f2x mass_erase 0; stm32f2x mass_erase 1; program Bootloader.bin verify 0x08000000; program Firmware_with_Mower_config.bin 0x08008000 verify reset; shutdown;"
 #### */

#include <Arduino.h>

extern "C"
{
#include <tmc/ic/TMC6200/TMC6200.h>
}

#define V_REG 3.3
#define VIN_R1 22000.0
#define VIN_R2 1500.0
#define ADC_VOLTS(ch) ((float)analogRead(ch) / 1024.0 * V_REG)
#define GET_INPUT_VOLTAGE() (ADC_VOLTS(PC3) * ((VIN_R1 + VIN_R2) / VIN_R2))
#define GET_PHASE_VOLTAGE(ch) (ADC_VOLTS(ch) * ((VIN_R1 + VIN_R2) / VIN_R2))
#define GET_PHASE_CURRENT(ch) ((zeroCurrentValue[ch - PC0] - (float)analogRead(ch)) * ((I_R1+I_R2)/I_R2) / R_SHUNT * V_REG/1024.0 / TMC_DEFAULT_GAIN)

#define I_R1 1.5
#define I_R2 2.2
#define R_SHUNT 0.033
#define TMC_DEFAULT_GAIN 5.0

#define PIN_TMC_MISO PB3
#define PIN_TMC_MOSI PB4
#define PIN_TMC_SCK PC10
#define PIN_TMC_NCS PC9
#define PIN_TMC_ENABLE PB5

#define PIN_UH PA10
#define PIN_VH PA9
#define PIN_WH PA8
#define PIN_UL PB15
#define PIN_VL PB14
#define PIN_WL PB13

// Motor NTC beta value
#define PCB_NTC_BETA 3380.0
#define MOTOR_NTC_BETA 3380.0

// NTC Thermistors
#define NTC_RES(adc_val) ((1024.0 * 10000.0) / adc_val - 10000.0)
#define NTC_TEMP(adc_val) (1.0 / ((logf(NTC_RES(adc_val) / 10000.0) / PCB_NTC_BETA) + (1.0 / 298.15)) - 273.15)

#define NTC_RES_MOTOR(adc_val) (10000.0 / ((1024.0 / (float)adc_val) - 1.0)) // Motor temp sensor on low side
#define NTC_TEMP_MOTOR(adc_val) (1.0 / ((logf(NTC_RES_MOTOR(adc_val) / 10000.0) / MOTOR_NTC_BETA) + (1.0 / 298.15)) - 273.15)
#define PIN_TEMP_PCB PA3
#define PIN_TEMP_MOTOR PC4

#define PIN_FAULT_ON_HIGH PB7

#define PIN_VOLTS_U PA2
#define PIN_VOLTS_V PA1
#define PIN_VOLTS_W PA0

#define PIN_CURRENT_U PC2
#define PIN_CURRENT_V PC1
#define PIN_CURRENT_W PC0

uint32_t zeroCurrentValue[3];

void setup() {
    SerialUSB.begin();
    delay(1000);

    pinMode(PIN_UH, OUTPUT);
    pinMode(PIN_VH, OUTPUT);
    pinMode(PIN_WH, OUTPUT);
    pinMode(PIN_UL, OUTPUT);
    pinMode(PIN_VL, OUTPUT);
    pinMode(PIN_WL, OUTPUT);

    digitalWrite(PIN_UH, LOW);
    digitalWrite(PIN_VH, LOW);
    digitalWrite(PIN_WH, LOW);
    digitalWrite(PIN_UL, LOW);
    digitalWrite(PIN_VL, LOW);
    digitalWrite(PIN_WL, LOW);

    pinMode(PIN_TMC_MOSI, OUTPUT);
    pinMode(PIN_TMC_SCK, OUTPUT);
    pinMode(PIN_TMC_NCS, OUTPUT);
    pinMode(PIN_TMC_ENABLE, OUTPUT);
    digitalWrite(PIN_TMC_ENABLE, HIGH);

    digitalWrite(PIN_TMC_SCK, HIGH);
    digitalWrite(PIN_TMC_NCS, HIGH);

    pinMode(PB0, OUTPUT);

    for (int i = 0; i < 10; i++) {
        digitalWrite(PB0, HIGH);
        delay(100);
        digitalWrite(PB0, LOW);
        delay(100);
    }
}

float readMotorTemp() {
    return NTC_TEMP_MOTOR((float) analogRead(PIN_TEMP_MOTOR));
}

float readPcbTemp() {
    return NTC_TEMP((float) analogRead(PIN_TEMP_PCB));
}

void spiDelay() {
    delay(1);
}

uint8_t transfer(uint8_t value) {
    uint8_t readValue = 0;

    for (uint8_t i = 0; i < 8; ++i) {
        digitalWrite(PIN_TMC_MOSI, (bool) (value >> 7));

        value <<= 1;

        digitalWrite(PIN_TMC_SCK, LOW);

        spiDelay();

        digitalWrite(PIN_TMC_SCK, HIGH);
        readValue <<= 1;
        if (digitalRead(PIN_TMC_MISO)) {
            digitalWrite(PB0, HIGH);
            readValue |= 1;
        } else {
            digitalWrite(PB0, LOW);
        }
        spiDelay();
    }
    return readValue;
}

void waitForEnter(bool dots = false) {
    SerialUSB.println("Press enter to continue");
    while (1) {
        if (dots) {
            SerialUSB.print(".");
        }
        unsigned long started = millis();
        while (millis() - started < 1000 && !SerialUSB.available()) {
        }
        if (SerialUSB.available()) {
            while (SerialUSB.available()) {
                SerialUSB.read();
            }
            break;
        }
    }
}

void displayResultAndStopOnError(bool result) {
    if (result) {
        SerialUSB.println("--> OK");
    } else {
        SerialUSB.println("--> NOT OK!!!");
        waitForEnter();
    }
}

bool testPhase(uint32_t pin_h, uint32_t pin_l, uint32_t pin_volts) {
    digitalWrite(pin_h, LOW);
    digitalWrite(pin_l, HIGH);
    delay(100);

    {
        // read and print phases @tmc
        uint32_t input_state = tmc6200_readInt(0, TMC6200_IOIN_OUTPUT) & 0b111111;

        SerialUSB.print("TMC input state: 0b");
        SerialUSB.println(input_state, BIN);
    }

    float voltage = GET_PHASE_VOLTAGE(pin_volts);
    SerialUSB.print("Phase set low,  voltage: ");
    SerialUSB.print(voltage);
    SerialUSB.println("V.");
    digitalWrite(pin_l, LOW);
    digitalWrite(pin_h, HIGH);
    delay(100);
    {
        // read and print phases @tmc
        uint32_t input_state = tmc6200_readInt(0, TMC6200_IOIN_OUTPUT) & 0b111111;

        SerialUSB.print("TMC input state: 0b");
        SerialUSB.println(input_state, BIN);
    }

    float voltage2 = GET_PHASE_VOLTAGE(pin_volts);
    SerialUSB.print("Phase set high, voltage: ");
    SerialUSB.print(voltage2);
    SerialUSB.println("V.");

    digitalWrite(pin_l, LOW);
    digitalWrite(pin_h, LOW);
    delay(100);
    {
        // read and print phases @tmc
        uint32_t input_state = tmc6200_readInt(0, TMC6200_IOIN_OUTPUT) & 0b111111;

        SerialUSB.print("TMC input state: 0b");
        SerialUSB.println(input_state, BIN);
    }

    // digitalWrite(PIN_TMC_ENABLE, LOW);
    return voltage < 0.5 && voltage2 > 9;
}

bool test_current(uint32_t pin_source_h, uint32_t pin_source_l, uint32_t pin_sink_h, uint32_t pin_sink_l, uint32_t pin_current_source, uint32_t pin_current_sink) {
    float no_current_value_p1 = GET_PHASE_CURRENT(pin_current_source);
    float no_current_value_p2 = GET_PHASE_CURRENT(pin_current_sink);

    // enable current
    digitalWrite(pin_source_h, HIGH);
    digitalWrite(pin_source_l, LOW);
    digitalWrite(pin_sink_h, LOW);
    digitalWrite(pin_sink_l, HIGH);

    delay(5);
    float current_value_p1 = GET_PHASE_CURRENT(pin_current_source);
    float current_value_p2 = GET_PHASE_CURRENT(pin_current_sink);

    // disable current
    digitalWrite(pin_source_h, LOW);
    digitalWrite(pin_source_l, LOW);
    digitalWrite(pin_sink_h, LOW);
    digitalWrite(pin_sink_l, LOW);

    SerialUSB.print("CURRENT_SOURCE: ");
    SerialUSB.print(no_current_value_p1);
    SerialUSB.print("A,\t");
    SerialUSB.print(current_value_p1);
    SerialUSB.println("A");
    SerialUSB.print("CURRENT_SINK: ");
    SerialUSB.print(no_current_value_p2);
    SerialUSB.print("A,\t");
    SerialUSB.print(current_value_p2);
    SerialUSB.println("A");

    bool result = true;

    if (abs(no_current_value_p1) > 0.1 || abs(no_current_value_p2) > 0.1) {
        result = false;
        SerialUSB.println("NOT OK. Inactive current should be close to zero.");
        waitForEnter();
    };

    if (current_value_p1 < 0 || current_value_p2 > 0) {
        result = false;
        SerialUSB.println("NOT OK. Current(s) flow in incorrect direction");
        waitForEnter();
    };

    if (current_value_p1 < 3) {
        result = false;
        SerialUSB.println("NOT_OK. We expect source current to be at least 3A. Maybe PSU limits the current?");
        waitForEnter();
    };

    // Allow 10% deviation
    if (abs(current_value_p1 + current_value_p2) > (current_value_p1 * 0.1)) {
        result = false;
        SerialUSB.println("NOT_OK. Source current should be almost equal to sink current");
        waitForEnter();
    }

    if (digitalRead(PIN_FAULT_ON_HIGH)) {
        SerialUSB.println("Fault pin is HIGH. Something went wrong.");
        waitForEnter();
    }

    return result;
}

void loop() {
    // disable phases to be sure
    digitalWrite(PIN_UH, LOW);
    digitalWrite(PIN_VH, LOW);
    digitalWrite(PIN_WH, LOW);
    digitalWrite(PIN_UL, LOW);
    digitalWrite(PIN_VL, LOW);
    digitalWrite(PIN_WL, LOW);

    SerialUSB.println("TEST LOOP STARTED");
    waitForEnter(true);

    SerialUSB.println("Reading input voltage");

    float vin = GET_INPUT_VOLTAGE();
    SerialUSB.print("VIN = ");
    SerialUSB.print(vin);
    SerialUSB.println(" V.");
    if (vin > 10.0) {
        SerialUSB.println("--> OK (> 10.0V)");
    } else {
        SerialUSB.println("--> NOT OK!!! (<= 10.0V)");
        waitForEnter();
        return;
    }
    delay(100);

    SerialUSB.println("Trying to connect to TMC6200");

    digitalWrite(PIN_TMC_SCK, HIGH);
    spiDelay();
    digitalWrite(PIN_TMC_NCS, LOW);
    spiDelay();

    // delayMicroseconds(100);
    uint32_t request = TMC6200_IOIN_OUTPUT;
    uint32_t ic_version = (tmc6200_readInt(0, request) & TMC6200_VERSION_MASK) >> TMC6200_VERSION_SHIFT;
    SerialUSB.print("IC version: 0x");
    SerialUSB.println(ic_version, HEX);
    SerialUSB.println("(expected value = 0x10)");
    if (ic_version == 0x10) {
        SerialUSB.println("--> OK");
    } else {
        SerialUSB.println("--> NOT OK!!!");
        waitForEnter();
        return;
    }

    // we have the TMC, configure it to single line mode
    // Driver comms OK, configure TMC6200

    tmc6200_writeInt(0, TMC6200_GCONF,
                     (0UL << TMC6200_DISABLE_SHIFT) |
                     (0UL << TMC6200_SINGLELINE_SHIFT) |
                     (1UL << TMC6200_FAULTDIRECT_SHIFT));
    tmc6200_writeInt(0, TMC6200_GSTAT, 0xFFFF);
    tmc6200_writeInt(0, TMC6200_SHORT_CONF, (1UL << TMC6200_DISABLE_S2G_SHIFT) | (1UL << TMC6200_DISABLE_S2VS_SHIFT));

    SerialUSB.println();
    SerialUSB.print("-- TESTING PCB/MOTOR TEMPERATURES: ");
    float t_pcb = readPcbTemp();
    float t_motor = readMotorTemp();
    SerialUSB.print(t_pcb);
    SerialUSB.print("\t");
    SerialUSB.print(t_motor);
    displayResultAndStopOnError(t_pcb > 22 && t_pcb < 80 && t_motor > 22 && t_motor < 80);

    SerialUSB.println();
    SerialUSB.println("-- TESTING PHASES");

    SerialUSB.print("TESTING PHASE U: ");
    displayResultAndStopOnError(
            testPhase(PIN_UH, PIN_UL, PIN_VOLTS_U)
    );

    SerialUSB.print("TESTING PHASE V: ");
    displayResultAndStopOnError(
            testPhase(PIN_VH, PIN_VL, PIN_VOLTS_V)
    );

    SerialUSB.print("TESTING PHASE W: ");
    displayResultAndStopOnError(
            testPhase(PIN_WH, PIN_WL, PIN_VOLTS_W)
    );

    SerialUSB.println("-- SAVING ZERO CURRENT OFFSETS");
    zeroCurrentValue[PIN_CURRENT_U - PC0] = analogRead(PIN_CURRENT_U);
    zeroCurrentValue[PIN_CURRENT_V - PC0] = analogRead(PIN_CURRENT_V);
    zeroCurrentValue[PIN_CURRENT_W - PC0] = analogRead(PIN_CURRENT_W);

    SerialUSB.print(zeroCurrentValue[0]);
    SerialUSB.print("\t");
    SerialUSB.print(zeroCurrentValue[1]);
    SerialUSB.print("\t");
    SerialUSB.println(zeroCurrentValue[2]);

    SerialUSB.println("-- TESTING CURRENTS");

    SerialUSB.print("TESTING CURRENT U->V: ");
    displayResultAndStopOnError(
            test_current(PIN_UH, PIN_UL,
                         PIN_VH, PIN_VL,
                         PIN_CURRENT_U, PIN_CURRENT_V)
    );
    delay(1000);
    SerialUSB.print("TESTING CURRENT V->W: ");
    displayResultAndStopOnError(
            test_current(PIN_VH, PIN_VL,
                         PIN_WH, PIN_WL,
                         PIN_CURRENT_V, PIN_CURRENT_W)
    );
    delay(1000);
    SerialUSB.print("TESTING CURRENT W->U: ");
    displayResultAndStopOnError(
            test_current(PIN_WH, PIN_WL,
                         PIN_UH, PIN_UL,
                         PIN_CURRENT_W, PIN_CURRENT_U)
    );

    delay(1000);
    SerialUSB.print("TESTING CURRENT V->U: ");
    displayResultAndStopOnError(
            test_current(PIN_VH, PIN_VL,
                         PIN_UH, PIN_UL,
                         PIN_CURRENT_V, PIN_CURRENT_U)
    );
    delay(1000);
    SerialUSB.print("TESTING CURRENT W->V: ");
    displayResultAndStopOnError(
            test_current(PIN_WH, PIN_WL,
                         PIN_VH, PIN_VL,
                         PIN_CURRENT_W, PIN_CURRENT_V)
    );
    delay(1000);
    SerialUSB.print("TESTING CURRENT U->W: ");
    displayResultAndStopOnError(
            test_current(PIN_UH, PIN_UL,
                         PIN_WH, PIN_WL,
                         PIN_CURRENT_U, PIN_CURRENT_W)
    );
}

extern "C" {
uint8_t tmc6200_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer) {
    digitalWrite(PIN_TMC_NCS, LOW);
    spiDelay();
    uint8_t rx = transfer(data);

    if (lastTransfer) {
        digitalWrite(PIN_TMC_NCS, HIGH);
    }
    return rx;
}
}
