#pragma once
#include <stdint.h>

#define NUM_CONFIG 7

#define REG_ACTIONS 0x00
#define REG_CONTROL_MODE 0x01
#define REG_SPEED_CONTROL_KP 0x02
#define REG_SPEED_CONTROL_KI 0x03
#define REG_SETPOINT 0x04
#define REG_DRIVER_STATUS 0x05
#define REG_BLDC_TICKS 0x06

#define CONTROL_MODE_SPEED_CTL 1
#define CONTROL_MODE_TORQUE_CTL 2




#pragma pack(push, 1)

struct registers {
    uint16_t actions;
    uint16_t control_mode;
    uint16_t speed_control_kp;
    uint16_t speed_control_ki;
    uint16_t setpoint;
    uint16_t driver_status;
    uint16_t bldc_ticks;
} __attribute__((packed));

extern volatile struct registers registers;

#pragma pack(pop)
