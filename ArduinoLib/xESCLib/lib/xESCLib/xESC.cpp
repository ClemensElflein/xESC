#include "xESC.h"

xESC::xESC(HardwareSerial *serial, uint8_t esc_address)
{
    this->serial = serial;
    this->esc_address = esc_address;
}

xESC::~xESC()
{
}

void xESC::begin()
{
    writeRegister(0x00, 1);
}

uint16_t xESC::readRegister(uint8_t address)
{
    serial->begin(38400);
    while (serial->available())
        serial->read();

    buffer[0] = this->esc_address | 0b10000000;
    buffer[1] = address;
    buffer[2] = CRC8.maxim(buffer, 2);

    for (uint8_t i = 0; i < 3; i++)
    {
        serial->write(buffer[i]);
        delayMicroseconds(100);
        serial->flush();
    }

    uint16_t result = waitAndRead();
    serial->end();
    return result;
}

bool xESC::writeRegister(uint8_t address, uint16_t value)
{
    serial->begin(38400);
    while (serial->available())
        serial->read();

    buffer[0] = this->esc_address | 0x80;
    buffer[1] = address | 0x80;
    buffer[2] = value >> 8;
    buffer[3] = value & 0xFF;
    buffer[4] = CRC8.maxim(buffer, 4);

    for (uint8_t i = 0; i < 5; i++)
    {
        serial->write(buffer[i]);
        delayMicroseconds(100);
        serial->flush();
    }
    bool result = waitForOK();
    serial->end();
    return result;
}

bool xESC::waitForOK()
{
    unsigned long started = micros();

    // Wait for reply
    while (serial->available() == 0 && micros() - started < timeout_micros)
        ;

    if (serial->available() > 0)
    {
        uint8_t result = serial->read();
        return result == 1;
    }

    return false;
}

uint16_t xESC::waitAndRead()
{
    unsigned long started = micros();

    // Wait for reply
    while (serial->available() < 2 && micros() - started < timeout_micros)
        ;

    if (serial->available() >= 2)
    {
        uint16_t result = serial->read();
        result <<= 8;
        result |= serial->read();
        return result;
    }

    return -1;
}