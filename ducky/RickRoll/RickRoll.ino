// Automates the rick-rolling process

#include "DigiKeyboard.h"
void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);
  DigiKeyboard.print("powershell \"start msedge https://www.youtube.com/watch?v=dQw4w9WgXcQ;\"");
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  
  for (;;) {
    /*Stops the digispark from running the scipt again*/
  }
}
