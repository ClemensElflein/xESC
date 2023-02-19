#include <Arduino.h>
// #include <SoftwareSpiMaster.h>
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

#define PIN_VOLTS_U PA2
#define PIN_VOLTS_V PA1
#define PIN_VOLTS_W PA0

#define PIN_CURRENT_U PC2
#define PIN_CURRENT_V PC1
#define PIN_CURRENT_W PC0


void setup()
{
    SerialUSB.begin();

    delay(2000);

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

    for (int i = 0; i < 10; i++)
    {
        digitalWrite(PB0, HIGH);
        delay(100);
        digitalWrite(PB0, LOW);
        delay(100);
    }

    // spi.begin(PIN_TMC_SCK, PIN_TMC_MOSI, PIN_TMC_MISO);
}

void spiDelay()
{
    delay(1);
}

uint8_t transfer(uint8_t value)
{
    uint8_t readValue = 0;

    for (uint8_t i = 0; i < 8; ++i)
    {
        digitalWrite(PIN_TMC_MOSI, (bool)(value >> 7));

        value <<= 1;

        digitalWrite(PIN_TMC_SCK, LOW);

        spiDelay();

        digitalWrite(PIN_TMC_SCK, HIGH);
        readValue <<= 1;
        if (digitalRead(PIN_TMC_MISO))
        {
            digitalWrite(PB0, HIGH);
            readValue |= 1;
        }
        else
        {
            digitalWrite(PB0, LOW);
        }
        spiDelay();
    }
    return readValue;
}

void waitForEnter(bool dots = false)
{
    SerialUSB.println("Press enter to continue");
    while (1)
    {
        if (dots)
        {
            SerialUSB.print(".");
        }
        unsigned long started = millis();
        while (millis() - started < 1000 && !SerialUSB.available())
        {
        }
        if (SerialUSB.available())
        {
            while (SerialUSB.available())
            {
                SerialUSB.read();
            }
            break;
        }
    }
}

bool testPhase(uint32_t pin_h, uint32_t pin_l, uint32_t pin_volts)
{
    // digitalWrite(PIN_TMC_ENABLE, HIGH);

    SerialUSB.println("setting phase low");
    digitalWrite(pin_h, LOW);
    digitalWrite(pin_l, HIGH);
    unsigned long start = millis();
    delay(100);

    {
        // read and print phases @tmc
        uint32_t input_state = tmc6200_readInt(0, TMC6200_IOIN_OUTPUT) & 0b111111;

        SerialUSB.print("TMC input state: 0b");
        SerialUSB.println(input_state, BIN);
    }

    float voltage = GET_PHASE_VOLTAGE(pin_volts);
    SerialUSB.print("Phase voltage: ");
    SerialUSB.print(voltage);
    SerialUSB.println("V.");
    SerialUSB.println("setting phase high");
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
    SerialUSB.print("Phase voltage: ");
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

bool test_current(uint32_t pin_p1_h,uint32_t pin_p1_l,uint32_t pin_p2_h,uint32_t pin_p2_l, uint32_t pin_current_p1, uint32_t pin_current_p2) {
    uint32_t no_current_value_p1 = analogRead(pin_current_p1);
    uint32_t no_current_value_p2 = analogRead(pin_current_p2);
    
    // enable current
    digitalWrite(pin_p1_h, HIGH);
    digitalWrite(pin_p1_l, LOW);
    digitalWrite(pin_p2_h, LOW);
    digitalWrite(pin_p2_l, HIGH);

    delay(100);
    uint32_t current_value_p1 = analogRead(pin_current_p1);
    uint32_t current_value_p2 = analogRead(pin_current_p2);

    // disable current
    digitalWrite(pin_p1_h, LOW);
    digitalWrite(pin_p1_l, LOW);
    digitalWrite(pin_p2_h, LOW);
    digitalWrite(pin_p2_l, LOW);

    Serial.print("CURRENT_PHASE1:");
    Serial.print(no_current_value_p1);
    Serial.print(",\t");
    Serial.println(current_value_p1);
    Serial.print("CURRENT_PHASE2:");
    Serial.print(no_current_value_p2);
    Serial.print(",\t");
    Serial.println(current_value_p2);
    
    return true;
}

void loop()
{
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
    if (vin > 10.0)
    {
        SerialUSB.println("--> OK (> 10.0V)");
    }
    else
    {
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
    if (ic_version == 0x10)
    {
        SerialUSB.println("--> OK");
    }
    else
    {
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
    SerialUSB.println();
    SerialUSB.println("TESTING PHASES");
    SerialUSB.println();
    SerialUSB.println();

    test_current(PIN_UH, PIN_UL, PIN_VH, PIN_VL, PIN_CURRENT_U, PIN_CURRENT_V);

    return;

    SerialUSB.println("TESTING PHASE U:");
    if (testPhase(PIN_UH, PIN_UL, PIN_VOLTS_U))
    {
        SerialUSB.println("--> OK");
    }
    else
    {
        SerialUSB.println("--> NOT OK!!!");
    }

    SerialUSB.println("TESTING PHASE V:");
    if (testPhase(PIN_VH, PIN_VL, PIN_VOLTS_V))
    {
        SerialUSB.println("--> OK");
    }
    else
    {
        SerialUSB.println("--> NOT OK!!!");
    }

    SerialUSB.println("TESTING PHASE W:");

    if (testPhase(PIN_WH, PIN_WL, PIN_VOLTS_W))
    {
        SerialUSB.println("--> OK");
    }
    else
    {
        SerialUSB.println("--> NOT OK!!!");
    }
}

extern "C"
{
    uint8_t tmc6200_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer)
    {
        digitalWrite(PIN_TMC_NCS, LOW);
        spiDelay();
        uint8_t rx = transfer(data);

        if (lastTransfer)
        {
            digitalWrite(PIN_TMC_NCS, HIGH);
        }
        return rx;
    }
}