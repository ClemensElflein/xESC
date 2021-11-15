#pragma once
#include <stdint.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include "Registers.h"

void init_usart();

void usart_send(uint32_t i);
void send_register(uint8_t address);