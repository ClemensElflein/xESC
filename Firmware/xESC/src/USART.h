#pragma once
#include <stdint.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include "Registers.h"
#include <util/crc16.h>

void init_usart();

void send_ok();
void usart_send(uint32_t i);
void send_register(uint8_t address);