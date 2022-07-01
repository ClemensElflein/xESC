#pragma once

#define PACKET_SERIAL Serial

#define STATUS_UPDATE_MILLIS 20

#define WATCHDOG_TIMEOUT_MILLIS 500

// Time to keep motor controller in fault once a fault occurs
#define MIN_FAULT_TIME_MILLIS 2000

// Hall Table
/*const uint8_t HALL_TABLE[] = {
    255,
    // 0b001
    3,
    // 0b010
    1,
    // 0b011
    2,
    // 0b100
    5,
    // 0b101
    4,
    // 0b110
    6,
    255
};*/

// Hall table drive motor
/*
const uint8_t HALL_TABLE[] = {
    255,
    // 0b001
    2,
    // 0b010
    6,
    // 0b011
    1,
    // 0b100
    4,
    // 0b101
    3,
    // 0b110
    5,
    255
};
*/


// Motor NTC beta value
#define PCB_NTC_BETA 3380.0
#define MOTOR_NTC_BETA 3380.0


// Hardware limits before going into fault
#define HW_LIMIT_PCB_TEMP 80.0
#define HW_LIMIT_MOTOR_TEMP 80.0


// Max amps before shutting down
#define HW_LIMIT_CURRENT 1.5

// P and I values for the current control
#define CURRENT_P 5.0f
#define CURRENT_I 15.1f


// Hardware limit for undervoltage and overvoltage.
#define HW_LIMIT_VLOW 12.0
#define HW_LIMIT_VHIGH 40.0


// Values for the voltage sensing resistor divider
#define VIN_R1 22000.0f
#define VIN_R2 1500.0f

// Value for the shunt resistor
#define R_SHUNT 0.003f

// Gain for the current sense amplifier
#define CURRENT_SENSE_GAIN 200.0f

// Max duty cycle to allow. This can't be 1, because the gate driver doesn't allow that for some reason.
#define MAX_DUTY_CYCLE 0.95f

