# About
Various scripts for different utilities made for various different system.

## bash
 - report1: Outputs a basic report for the linux user running the script.
 - report2: Runs a report with an interactive menu.
 - report3: Runs a report using command line paramters to specify different options.

## ducky
These scripts are written for making a Ducky using a digispark attiny85 USB device programmed with Arduino. These scripts will run automatically after the digispark USB is
plugged in. So far, all of these Ducky scripts have been written for Windows 10 and 11.
 - reverseDucky: Uses powershell to connect to a netcat listener and start a reverse shell.
      - Issues: Currently needs to be properly tested, may not be fully functional.
### Instructions for Creating a Ducky
  1. Install Arduino IDE at https://www.arduino.cc/en/software
  2. Open up Arduino IDE and select File > Preferences.
  3. Under the Additional Boards Manager URLs, past the following URL: http://digistump.com/package_digistump_index.json.
  4. Select Tools > Board > Boards Manager
  5. In the menu that appears, select Contributed and look for the Digistump AVR Boards and install it.
  6. Download the Digistump drivers found here: https://github.com/digistump/DigistumpArduino/releases/download/1.6.7/Digistump.Drivers.zip.
  7. With the desired script open in Arduino, select Tools > Board and choose Digispark (Default – 16.5mhz) as your default board.
  8. Click verify and then upload. Plug your Attiny85 into your computer to program the rubber ducky.
  9. Your ducky should now be ready and should run when you plug it into a computer.

## powershell
 - ClamFileScan.ps1: automates updating ClamAv's definitions and running a scan on a file or directory using ClamAV.
 - adfsLockout.ps1: checks a given user's lockout status on ADFS and then gives the option to unlock the account based on Familiar and Unfamiliar location lockout (must be run with admin privileges on an ADFS server).
