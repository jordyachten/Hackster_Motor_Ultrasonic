# MiniZed and Vitis for Motor Control with added HC-SR04
Extension of 'Mini But Mighty, the MiniZed and Vitis for Motor Control' project by Adam Taylor with HC-SR04 to control the speed.

##Introduction
After following the 'Mini but Mighty: Motor Control Live Build with the MiniZed' by Adam Taylor, I started thinking about a useful upgrade to this project. When I searched through my sensors, I stumbled upon the well known HC_SR04 ultrasonic distance sensor. The distance sensor would be a useful upgrade if we would for example use the motor to move a toy car. When the sensor detects an object it can make the motor go slower and slower as it comes closer to the object, until it eventually stops.

If we want to make an application in Vitis for the HC_SR04, we need to be able to drive the hardware. For this purpose we have to design a component in VHDL code first. We will then make a custom AXI IP we can add in a block design and connect to the ZYNQ processor. When all this is done, we can export the hardware design and start making an application in Vitis and run it on the MiniZed.

To get the full discription of the project, you can visit my project on Hackster.io.
https://www.hackster.io/jordy-achten/minized-and-vitis-for-motor-control-with-added-hc-sr04-0e82cb
