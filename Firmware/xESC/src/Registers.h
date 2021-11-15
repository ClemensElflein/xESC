#pragma once
#include <stdint.h>

#define NUM_CONFIG 5

#define REG_CONTROL_MODE 0x00
#define REG_SPEED_CONTROL_KP 0x01
#define REG_SPEED_CONTROL_KI 0x02
#define REG_SETPOINT 0x03
#define REG_DRIVER_STATUS 0x04

#define CONTROL_MODE_SPEED_CTL 1
#define CONTROL_MODE_TORQUE_CTL 2

extern volatile uint16_t REGISTER[NUM_CONFIG];