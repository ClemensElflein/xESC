#include "USART.h"

static volatile uint8_t uart_tx_buffer[255];
static volatile uint8_t *uart_tx_begin = uart_tx_buffer;
static volatile uint8_t *uart_tx_end = uart_tx_buffer;
static volatile uint8_t read_state;
static volatile uint8_t rw_register_address;
static volatile uint16_t read_temp;

ISR(USART_UDRE_vect)
{
    if (uart_tx_begin >= uart_tx_end)
    {
        // we're done, disable send interrupt
        UCSR0B &= ~(1 << UDRIE0);
        // also disable transmitter
        UCSR0B |= ~(1 << TXEN0);
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
        if ((c & 0b10000000) == 0)
        {
            // not an address, ignore packet
            return;
        }
        // TODO: check if it was our address
        read_state++;
        break;
    case 1:
        // This byte is the register address to read/write
        rw_register_address = (c & 0b01111111);
        // check if register is valid
        if (rw_register_address >= NUM_CONFIG)
        {
            // invalid address, reset read_state
            read_state = 0;
            return;
        }
        if ((c & 0b10000000) == 0)
        {
            send_register(rw_register_address);

            read_state = 0;
            return;
        }
        else
        {
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
        REGISTER[rw_register_address] = read_temp;
        send_register(rw_register_address);
        read_state = 0;
        break;
    default:
        // invalid state, wait for address
        read_state = 0;
        break;
    }
}

void send_register(uint8_t address)
{
    // enable transmitter
    UCSR0B |= (1 << TXEN0);
    // It's a read operation, just copy the register and send it out
    uint16_t data = REGISTER[address];
    uart_tx_buffer[0] = data >> 8;
    uart_tx_buffer[1] = data & 0xFF;

    uart_tx_begin = uart_tx_buffer;
    uart_tx_end = uart_tx_buffer + 2;

    // start transmitting
    UCSR0B |= (1 << UDRIE0);
}


void init_usart()
{
    read_state = 0;
    // Define first and then include, don't change it.
#define BAUD 250000
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