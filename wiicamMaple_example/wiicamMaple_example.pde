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
  
  ircam.init();
}

void loop()
{
   
  result = ircam.read();
  
  prnt();
  

//  
//  if (result & BLOB1)
//  {
//    Serial1.print("BLOB1 detected. X:");
//    Serial1.print(ircam.Blob1.X);
//    Serial1.print(" Y:");
//    Serial1.print(ircam.Blob1.Y);
//    Serial1.print(" Size:");
//    Serial1.println(ircam.Blob1.Size);
//  }
//  
//  if (result & BLOB2)
//  {
//    Serial1.print("BLOB2 detected. X:");
//    Serial1.print(ircam.Blob2.X);
//    Serial1.print(" Y:");
//    Serial1.print(ircam.Blob2.Y);
//    Serial1.print(" Size:");
//    Serial1.println(ircam.Blob2.Size);
//  }
//  if (result & BLOB3)
//  {
//    Serial1.print("BLOB3 detected. X:");
//    Serial1.print(ircam.Blob3.X);
//    Serial1.print(" Y:");
//    Serial1.print(ircam.Blob3.Y);
//    Serial1.print(" Size:");
//    Serial1.println(ircam.Blob3.Size);
//  }
//  if (result & BLOB4)
//  {
//    Serial1.print("BLOB4 detected. X:");
//    Serial1.print(ircam.Blob4.X);
//    Serial1.print(" Y:");
//    Serial1.print(ircam.Blob4.Y);
//    Serial1.print(" Size:");
//    Serial1.println(ircam.Blob4.Size);
//  }
//
//  // Short delay...
//  delay(100);
  
}

void prnt() {
    if(SerialUSB.isConnected() && (SerialUSB.getDTR() || SerialUSB.getRTS())) {
        for(int i = 0; i < 10; i++) {
           SerialUSB.println(msg);
        }
    }
}
