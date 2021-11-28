#include <Arduino.h>
#include <xESC.h>

xESC xesc(&Serial1, 0);

void setup()
{
  //while(!Serial);
  Serial.begin(100000);
  Serial.println("setup");
  xesc.begin();
  xesc.writeRegister(0x01, 2);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(2, OUTPUT);
}

float speed = 0;

void loop()
{
  delay(10);
  uint16_t ticks = xesc.readRegister(0x06);
  uint16_t error = xesc.readRegister(0x05);
  digitalWrite(LED_BUILTIN, error > 0);
  // Serial.print("ticks: ");
  // Serial.println(ticks);
   speed += 1.0;
  //speed = 200.0f;
  if (speed > 255.0f)
    speed = 0.0f;
        digitalWrite(2, HIGH);

  bool success = xesc.writeRegister(0x04, (uint16_t)speed << 8);
    digitalWrite(2, LOW);
  if (!success)
  {

    uint16_t v = xesc.readRegister(0x04);
    Serial.print("value was: ");
    Serial.print(v >> 8);
    Serial.print(", but should be: ");
    Serial.println(speed);
    delay(10);
  }
  // Serial.print("success:");

  // put your main code here, to run repeatedly:
}