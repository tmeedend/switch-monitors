switch-monitors
===============

This is a small and easy shell script to switch between HDMI and DVI monitors.

I have a TV on my left and my standard monitor on the right. This simple script can rotate between these to monitors with the argument switch. It can also force the use of one the two monitors with the options dvi-only or hdmi-only.

The script is quiet simple and small, so it's easy for you if you need to change to your monitors configuration.

Usage
===============
* first, make the file executable with the command line chmod +x 
* then, just call the script with the argument "status" to see the possible arguments


Known bugs
===============
When your session starts, you need to launch this script to force to one monitor. Otherwise, the switch function can be wrong the first time you use it (because it does not know the first status of the monitors when your session starts).
