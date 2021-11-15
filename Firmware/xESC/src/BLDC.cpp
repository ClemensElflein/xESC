#include "BLDC.h"

bool tmc6100_found = false;
uint32_t bldc_ticks = 0;

ISR(PCINT1_vect) // handle pin change interrupt for all hall phases.
{
    if (REGISTER[REG_DRIVER_STATUS])
    {
        PORTD = 0b00000000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        return;
    }
    switch (PINC & 0b111)
    {
    case 0b001:
        //FLOAT_A();
        //LOW_C();
        //PWM_B();

        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b01010000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR0A |= 0b00100000;

        break;
    case 0b011:
        //FLOAT_B();
        //LOW_C();
        //PWM_A();

        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b01000100;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR2A |= 0b00100000;

        break;
    case 0b010:
        // FLOAT_C();
        // LOW_B();
        // PWM_A();
        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b00100100;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR2A |= 0b00100000;
        break;
    case 0b110:
        // FLOAT_A();
        // LOW_B();
        // PWM_C();
        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b10100000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR0A |= 0b10000000;
        break;
    case 0b100:
        // FLOAT_B();
        // LOW_A();
        // PWM_C();
        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b10001000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR0A |= 0b10000000;
        break;
    case 0b101:
        // FLOAT_C();
        // LOW_A();
        // PWM_B();
        // DIRC, ENC, ENB, DIRB, ENA, DIRA, 0, 0
        PORTD = 0b00011000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        TCCR0A |= 0b00100000;
        break;
    default:
        PORTD = 0b00000000;
        TCCR0A &= 0b00001111;
        TCCR2A &= 0b11001111;
        break;
    }
    PORTB ^= 0b100;
    bldc_ticks++;
}

void init_bldc()
{
    tmc6100_found = false;
    REGISTER[REG_DRIVER_STATUS] = 0;
    // Set driver enable pin as output
    DDRC |= 0b00010000;
    /* Set SS pin as output */
    DDRC |= 0b100000;

    set_driver_enabled(false);
    set_driver_ss(false);

    // Enable Pin Change Interrupts on A0..A2 for hall sensors
    PCIFR |= 0b10;
    PCICR |= 0b10;
    PCMSK1 = 0b111;

    // Setup timers. We need synchronized phase correct PWM
    // halt all timers
    GTCCR = (1 << TSM) | (1 << PSRASY) | (1 << PSRSYNC);

    //Setup timer 0
    TCCR0A = 0b00000001;
    TCCR0B = 0b00000001;

    //Setup Timer 2
    TCCR2A = 0b00000001;
    TCCR2B = 0b00000001;

    TCNT2 = TCNT0 = 0;

    // release all timers
    GTCCR = 0;

    // Configure PWM pins as outputs
    PORTD = 0;
    DDRD |= 0b11111100;

    // Call ISR once to initialize hall sensors
    PCINT1_vect();

    // Get version number and enable driver if it matches
    int ic_version = (tmc6100_readInt(0, TMC6100_IOIN_OUTPUT) & TMC6100_VERSION_MASK) >> TMC6100_VERSION_SHIFT;
    tmc6100_found = ic_version == 0x10;

    reset_driver();
}

void reset_driver()
{
    if (!tmc6100_found)
        return;
    set_driver_enabled(false);
    _delay_ms(1);

    // Driver comms OK, configure TMC6100
    tmc6100_writeInt(0, TMC6100_GCONF,
                     (0UL << TMC6100_DISABLE_SHIFT) |
                         (1UL << TMC6100_SINGLELINE_SHIFT) |
                         (1UL << TMC6100_FAULTDIRECT_SHIFT) |
                         // datasheet tells us to set this bit for reduced power consumption
                         (1L << 6));

    tmc6100_writeInt(0, TMC6100_SHORT_CONF,
                     (1UL << TMC6100_PROTECT_PARALLEL_SHIFT) |
                         (3UL << TMC6100_RETRY_SHIFT) |
                         (2UL << TMC6100_SHORTFILTER_SHIFT) |
                         (12UL << TMC6100_S2GND_LEVEL_SHIFT) |
                         (12UL << TMC6100_S2VS_LEVEL_SHIFT));
    set_driver_enabled(true);
    // clear the reset flag
    tmc6100_writeInt(0, TMC6100_GSTAT, 0b1);
    update_driver_status();
}

void update_driver_status()
{
    if (!tmc6100_found)
    {
        REGISTER[REG_DRIVER_STATUS] = (1UL << 15);
        return;
    }

    REGISTER[REG_DRIVER_STATUS] = tmc6100_readInt(0, TMC6100_GSTAT) & 0x7FFF;
    if (REGISTER[REG_DRIVER_STATUS])
    {
        PCINT1_vect();
    }
}

void set_driver_enabled(bool enabled)
{
    if (enabled)
    {
        PORTC |= 0b00010000;
    }
    else
    {
        PORTC &= 0b11101111;
    }
}

void set_driver_ss(bool selected)
{
    if (selected)
    {
        PORTC &= 0b11011111;
    }
    else
    {
        PORTC |= 0b00100000;
    }
}

uint8_t tmc6100_readwriteByte(uint8_t motor, uint8_t data, uint8_t lastTransfer)
{
    set_driver_ss(true);
    /* Start transmission */
    SPDR = data;
    /* Wait for transmission complete */
    while (!(SPSR & (1 << SPIF)))
        ;

    if (lastTransfer)
    {
        set_driver_ss(false);
    }
    return SPDR;
}