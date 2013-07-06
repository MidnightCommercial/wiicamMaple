wiicamMaple
===========

Maple library for interfacing with the WiiMote/Pixart IR sensor directly


Introduction
------------
wiicamMaple allows you to read from the wiiMote camera directly through the Maple microcontroller board. IT is a port of Arduino code writen by Steve Hobley's derivation of Koko's work.

http://www.stephenhobley.com
http://www.kako.com/neta/2007-001/2007-001.html

The advantage to using the Maple is that the camera can be used with no externals, it should plug directly into the Maple and that's it. This is because the Maple runs at 3.3V and can generate a 24Mhz clock signal via PWM.

Additional details, including the Arduino based circuit diagram, are here: http://www.stephenhobley.com/blog/2009/03/01/pixartwiimote-sensor-library-for-arduino/


Licence
-------
The code in this repository is available under the [MIT License](https://secure.wikimedia.org/wikipedia/en/wiki/Mit_license).  
Copyright (c) 2013 No Contour, [www.nocontour.com](http://www.nocontour.com)


Installation
------------
Copy the wiicamMaple directory and all its contents to MapleIDE.app/Contents/Resources/Java/libraries/


Dependencies
------------
none

Compatibility
------------
[Maple IDE v0.0.12](http://leaflabs.com/docs/maple-ide-install.html#maple-ide-install)


Known issues
------------
This initial version has not yet been tested with the WiiMote camera and we have not yet implemented the 24Mhz clock signal.

Version history
------------