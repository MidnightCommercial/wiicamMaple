// Simple modificaiton by Jamie Zigelbaum to port Arduino library to Maple
// based on Steve Hobley's code to interface with the WiiMote/Pixart sensor
// http://www.stephenhobley.com/blog/2009/03/01/pixartwiimote-sensor-library-for-arduino/

// No Contour - www.nocontour.com

#include <Wire.h>
#include <PVision.h>

PVision ircam;
byte result;
int toggle = 0;

HardwareTimer timer1(1);
HardwareTimer timer2(1);

void setup()
{
  // The Pixart sensor needs a 16–25MHz clock signal
  // We generate one with a timer that toggles pin 11
  pinMode(11, OUTPUT);

  
  
  timer2.setMode(TIMER_CH1, TIMER_OUTPUT_COMPARE);
  timer3.setMode(TIMER_CH1, TIMER_OUTPUT_COMPARE);
  timer2.pause();
  timer3.pause();
  timer2.setCount(0);
  timer3.setCount(0);
  timer2.setPrescaleFactor(1);
  timer3.setPrescaleFactor(1);
  timer2.setOverflow(2000);
  timer3.setOverflow(655);
  
  timer3.setCompare(TIMER_CH1, 1);
  timer3.attachInterrupt(2, clockOut);

  timer2.resume();
  timer3.resume();
  
  Serial1.begin(9600);
  ircam.init();
}

void loop()
{
   
  result = ircam.read();
  
  if (result & BLOB1)
  {
    Serial1.print("BLOB1 detected. X:");
    Serial1.print(ircam.Blob1.X);
    Serial1.print(" Y:");
    Serial1.print(ircam.Blob1.Y);
    Serial1.print(" Size:");
    Serial1.println(ircam.Blob1.Size);
  }
  
  if (result & BLOB2)
  {
    Serial1.print("BLOB2 detected. X:");
    Serial1.print(ircam.Blob2.X);
    Serial1.print(" Y:");
    Serial1.print(ircam.Blob2.Y);
    Serial1.print(" Size:");
    Serial1.println(ircam.Blob2.Size);
  }
  if (result & BLOB3)
  {
    Serial1.print("BLOB3 detected. X:");
    Serial1.print(ircam.Blob3.X);
    Serial1.print(" Y:");
    Serial1.print(ircam.Blob3.Y);
    Serial1.print(" Size:");
    Serial1.println(ircam.Blob3.Size);
  }
  if (result & BLOB4)
  {
    Serial1.print("BLOB4 detected. X:");
    Serial1.print(ircam.Blob4.X);
    Serial1.print(" Y:");
    Serial1.print(ircam.Blob4.Y);
    Serial1.print(" Size:");
    Serial1.println(ircam.Blob4.Size);
  }

  // Short delay...
  delay(100);
  
}

void clockOut(void) {
  toggle ^= 1;
  digitalWrite(11, toggle);
}
