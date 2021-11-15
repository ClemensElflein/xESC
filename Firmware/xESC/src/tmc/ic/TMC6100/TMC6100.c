/*
 * TMC6100.c
 *
 *  Created on: 13.11.2019
 *      Author: ED
 */

#include "TMC6100.h"

// => SPI wrapper
extern uint8_t tmc6100_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer);
// <= SPI wrapper

// spi access
uint32_t tmc6100_readInt(uint8_t motor, uint8_t address)
{
	// clear write bit
	address = TMC_ADDRESS(address);

	// write address
	tmc6100_readwriteByte(motor, address, false);

	// read data
	uint32_t value = tmc6100_readwriteByte(motor, 0, false);
	value <<= 8;
	value |= tmc6100_readwriteByte(motor, 0, false);
	value <<= 8;
	value |= tmc6100_readwriteByte(motor, 0, false);
	value <<= 8;
	value |= tmc6100_readwriteByte(motor, 0, true);

	return value;
}

void tmc6100_writeInt(uint8_t motor, uint8_t address, uint32_t value)
{
	// write address
	tmc6100_readwriteByte(motor, address | TMC6100_WRITE_BIT, false);

	// write value
	tmc6100_readwriteByte(motor, 0xFF & (value>>24), false);
	tmc6100_readwriteByte(motor, 0xFF & (value>>16), false);
	tmc6100_readwriteByte(motor, 0xFF & (value>>8), false);
	tmc6100_readwriteByte(motor, 0xFF & (value>>0), true);
}
