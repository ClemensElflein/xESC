#include "SPI.h"

void init_spi_master()
{
    /* Set MOSI and SCK and SS_EXT output */
    DDRB |= 0b101100;

    // Pull SS_EXT high in case some sensor is attached
    PORTB |= 0b100;

    /**
     * Enable SPI Master
     * Data Order MSB first
     * SPI Mode 3
     * SPI freq = Fosc / 32
     */
    SPCR = 0b01011110;
    SPSR |= 1;
}