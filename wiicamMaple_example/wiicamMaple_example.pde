// Simple modificaiton by Jamie Zigelbaum to port Arduino library to Maple
// based on Steve Hobley's code to interface with the WiiMote/Pixart sensor
// http://www.stephenhobley.com/blog/2009/03/01/pixartwiimote-sensor-library-for-arduino/

// No Contour - www.nocontour.com

#include <Wire.h>
#include <PVision.h>

PVision ircam;
byte result;

void setup()
{
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
