#include "Arduino.h"
#include <FastCRC.h>
class xESC
{
private:
    FastCRC8 CRC8;
    uint8_t buffer[5];
    HardwareSerial *serial;
    unsigned long timeout_micros = 1000;
    uint8_t esc_address;

    uint16_t waitAndRead();
    bool waitForOK();

public:
    xESC(HardwareSerial *serial, uint8_t address);
    ~xESC();

    void begin();

    uint16_t readRegister(uint8_t address);
    bool writeRegister(uint8_t address, uint16_t value);
};
