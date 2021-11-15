#pragma once

#include <avr/io.h>
#include <avr/interrupt.h>
extern "C"
{
#include "tmc/ic/TMC6100/TMC6100.h"
}
#include "USART.h"
#include <avr/delay.h>
#include "Registers.h"

extern bool tmc6100_found;
extern uint32_t bldc_ticks;

void init_bldc();

void set_driver_enabled(bool);
void set_driver_ss(bool);
void update_driver_status();
void reset_driver();
extern "C"
{
    uint8_t tmc6100_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer);
}
