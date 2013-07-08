// Simple modificaiton by Jamie Zigelbaum to port Arduino library to Maple
// based on Steve Hobley's code to interface with the WiiMote/Pixart sensor
// http://www.stephenhobley.com/blog/2009/03/01/pixartwiimote-sensor-library-for-arduino/

// No Contour - www.nocontour.com

#include <Wire.h>
#include <PVision.h>


PVision ircam;
byte result;
int toggle = 0;
char msg[] = "start";

// using timer 3 channel 2 to toggle pin 11
HardwareTimer timer(3);

void setup()
{
  // The Pixart sensor needs a 16–25MHz clock signal
  // We generate a 24MHz signal using a hardware timer
  pinMode(11,PWM);
  timer.setPrescaleFactor(1);
  timer.setOverflow(2);
  timer.setMode(2, TIMER_PWM);
  timer.setCompare(2,1);
  
  // make #reset HIGH
  pinMode(14, OUTPUT);
  digitalWrite(14, HIGH);
  
  ircam.init();
}

void loop()
{
   
  result = ircam.read();
  
  if (canPrint()) {
    SerialUSB.println("IN LOOP");
  }

  

  
  if (result & BLOB1)
  {
    SerialUSB.print("BLOB1 detected. X:");
    SerialUSB.print(ircam.Blob1.X);
    SerialUSB.print(" Y:");
    SerialUSB.print(ircam.Blob1.Y);
    SerialUSB.print(" Size:");
    SerialUSB.println(ircam.Blob1.Size);
  }
  
  if (result & BLOB2)
  {
    SerialUSB.print("BLOB2 detected. X:");
    SerialUSB.print(ircam.Blob2.X);
    SerialUSB.print(" Y:");
    SerialUSB.print(ircam.Blob2.Y);
    SerialUSB.print(" Size:");
    SerialUSB.println(ircam.Blob2.Size);
  }
  if (result & BLOB3)
  {
    SerialUSB.print("BLOB3 detected. X:");
    SerialUSB.print(ircam.Blob3.X);
    SerialUSB.print(" Y:");
    SerialUSB.print(ircam.Blob3.Y);
    SerialUSB.print(" Size:");
    SerialUSB.println(ircam.Blob3.Size);
  }
  if (result & BLOB4)
  {
    SerialUSB.print("BLOB4 detected. X:");
    SerialUSB.print(ircam.Blob4.X);
    SerialUSB.print(" Y:");
    SerialUSB.print(ircam.Blob4.Y);
    SerialUSB.print(" Size:");
    SerialUSB.println(ircam.Blob4.Size);
  }

  // Short delay...
  delay(100);
  
}

bool canPrint() {
    if(SerialUSB.isConnected() && (SerialUSB.getDTR() || SerialUSB.getRTS())) {
       return true;
    } else {
      return false;
    }
}
