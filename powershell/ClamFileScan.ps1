# Clam File Scan
# Initiates a clam scan on the entered file. The script must be run in the directory where the ClamAV
# files are located or you must change the path to the exe files.
# Created: 5/29/24
# Updated: 5/30/24
# Created by calicojack1720

#Set-Location <uncomment this line and put the path to your ClamAV folder here

Write-Output "Welcome to ClamFileScan, an automated method for scanning directories and files with ClamAV!"
Write-Output "This script must be placed within the folder containing your ClamAV files in order to work correctly."
Write-Output "It is recommended that you run this script with administrator permissions to ensure that ClamAV is"
Write-Output "able to function properly."

Start-Process -NoNewWindow .\clamd.exe

Wait-Job -Name "clamd.exe"

$Update = Read-Host "Would you like to update ClamAV's definitions? (y/n)"

if ($Update -eq "y") {
    Start-Process -NoNewWindow .\freshclam.exe
    Wait-Job -Name "ClamAv - freshclam"
}

$FilePath = Read-Host "Enter the absolute file path to the file you want to scan"

.\clamdscan.exe $FilePath