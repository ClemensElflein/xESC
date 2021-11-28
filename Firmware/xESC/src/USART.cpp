#include "USART.h"

static volatile uint8_t uart_tx_buffer[255];
static volatile uint8_t *uart_tx_begin = uart_tx_buffer;
static volatile uint8_t *uart_tx_end = uart_tx_buffer;
static volatile uint8_t read_state;
static volatile uint8_t rw_register_address;
static volatile uint16_t read_temp;
static volatile uint8_t crc;

ISR(USART_UDRE_vect)
{
    if (uart_tx_begin >= uart_tx_end)
    {
        // we're done, disable send interrupt and transmitter
        UCSR0B &= ~((1 << UDRIE0) | (1 << TXEN0));

        return;
    }
    UDR0 = *uart_tx_begin;
    uart_tx_begin++;
}

ISR(USART_RX_vect)
{
    // read the char
    char c = UDR0;

    switch (read_state)
    {
    case 0:
        // Check, if it is an address and if it is our address. If so, proceed
        if ((c & 0x80) == 0)
        {
            // not an address, ignore packet
            return;
        }
        // TODO: check if it was our address
        read_state++;

        // Reset CRC calculation for this call
        crc = 0;
        break;
    case 1:
        // This byte is the register address to read/write
        rw_register_address = (c & 0x7F);
        // check if register is valid, if not we can quit now (probably the address byte was nonsense)
        if (rw_register_address >= NUM_CONFIG)
        {
            // invalid address, reset read_state
            read_state = 0;
            return;
        }

        if ((c & 0x80) == 0)
        {
            // read mode, wait for CRC byte and then send the register value
            read_state = 0xFF;
        }
        else
        {
            // write mode, wait for data
            read_state++;
        }
        break;
    case 2:
        // write operation, first data byte
        read_temp = c;
        read_state++;
        break;
    case 3:
        // write operation, second data byte
        read_temp <<= 8;
        read_temp |= c;
        read_state++;
        break;
    case 4:
        // If we're here, we were addressed and received a write operation. Check the CRC and store the data
        if (crc == c)
        {
            // send_ok();
            ((uint16_t volatile *)&registers)[rw_register_address] = read_temp;

            // enable transmitter
            UCSR0B |= (1 << TXEN0);
            // It's a read operation, just copy the register and send it out
            uart_tx_buffer[0] = c;
            uart_tx_buffer[1] = crc;

            uart_tx_begin = uart_tx_buffer;
            uart_tx_end = uart_tx_buffer + 2;

            // start transmitting
            UCSR0B |= (1 << UDRIE0);
        }

        // wait for new command
        read_state = 0;
        return;
    case 0xFF:
        // If we're here, we were addressed and received a read operation. Check the CRC and send the contents if it matches
        if (crc == c)
        {
            send_register(rw_register_address);
        }

        // wait for new command
        read_state = 0;
        return;
    default:
        // invalid state, wait for address
        read_state = 0;
        return;
    }
    crc = _crc_ibutton_update(crc, c);
}

void send_register(uint8_t address)
{
    // enable transmitter
    UCSR0B |= (1 << TXEN0);
    // It's a read operation, just copy the register and send it out
    uint16_t data = ((volatile uint16_t *)&registers)[address];

    uart_tx_buffer[0] = data >> 8;
    uart_tx_buffer[1] = data & 0xFF;

    uart_tx_begin = uart_tx_buffer;
    uart_tx_end = uart_tx_buffer + 2;

    // start transmitting
    UCSR0B |= (1 << UDRIE0);
}

void send_ok()
{
    // enable transmitter
    UCSR0B |= (1 << TXEN0);
    // It's a read operation, just copy the register and send it out
    uart_tx_buffer[0] = crc;

    uart_tx_begin = uart_tx_buffer;
    uart_tx_end = uart_tx_buffer + 1;

    // start transmitting
    UCSR0B |= (1 << UDRIE0);
}

void init_usart()
{
    read_state = 0;
    // Define first and then include, don't change it.
#define BAUD 38400
#include <util/setbaud.h>
    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;
#if USE_2X
    UCSR0A |= (1 << U2X0);
#else
    UCSR0A &= ~(1 << U2X0);
#endif

    /* Enable receiver and  receive interrupt */
    UCSR0B = (1 << RXEN0) | (1 << RXCIE0);
    /* Set frame format: 8data, 2stop bit */
    UCSR0C = (1 << USBS0) | (3 << UCSZ00);
}