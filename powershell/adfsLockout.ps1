# adfsLockout.ps1
# Automates commands for checking account status and resetting lockout in ADFS
# Created by calicojack1720
# Created: 9/11/24
# Updated: 9/13/24

cls


DO{
cls
Write-Host "ADFS Lockout Check"
Write-Host " "
Write-Host " "
$FullEmail = Read-Host -Prompt 'Enter the username of the account you want to check'

Write-Host " "
Write-Host " "

# Account Display
Try {
    Write-Host "Displaying Account Information... (if no error shown, successful)"
    Write-Host " "
    invoke-command -ComputerName localhost -ConfigurationName "AccountActivityAdministration" -ArgumentList $FullEmail -ScriptBlock {
        param($FullEmail)
        Get-AdfsAccountActivity -Identity $FullEmail
    }
    # invoke-command is a non-terminating error and will not trigger the catch statement, so we need to check if it succeeded and throw a terminating error if it did not
    if (-not $?) {
        throw $error[0].Exception
    }
}
Catch {
    Write-Host " "
    Write-Host " "
    Write-Host "ERROR: Unable to display account!" -ForegroundColor Red
}

Write-Host " "
Write-Host " "

# Unfamiliar Location
$ResetUnknown = Read-Host -Prompt 'Do you want to reset the Unknown Location? [y/N]'
if (($ResetUnknown.Equals("y")) -or ($ResetUnknown.Equals("Y"))) {
    Write-Host "Resetting Unknown Location..."
    Write-Host " "
    Try {
        invoke-command -ComputerName localhost -ConfigurationName "AccountActivityAdministration" -ArgumentList $FullEmail -ScriptBlock {
            param($FullEmail)
            reset-adfsaccountlockout -Location unknown -userprincipalname $FullEmail
        }
        if (-not $?) {
            throw $error[0].Exception
        }
        cls
        Write-Host " "
        Write-Host " "
        Write-Host "Completed!" -ForegroundColor Green
    }
    Catch {
        cls
        Write-Host " "
        Write-Host " "
        Write-Host "ERROR: Unable to reset the Unknown Location" -ForegroundColor Red
    }

    # Display account info again
    Try {
        Write-Host "Displaying Account Information... (if no error shown, successful)"
        Write-Host " "
        invoke-command -ComputerName localhost -ConfigurationName "AccountActivityAdministration" -ArgumentList $FullEmail -ScriptBlock {
            param($FullEmail)
            Get-AdfsAccountActivity -Identity $FullEmail
        }
        if (-not $?) {
            throw $error[0].Exception
        }
    }
    Catch {
        Write-Host " "
        Write-Host " "
        Write-Host "ERROR: Unable to display account!" -ForegroundColor Red
    }
}
Write-Host " "
Write-Host " "

# Familiar Location
$ResetFamiliar = Read-Host -Prompt 'Do you want to reset the Familiar Location? [y/N]'
if (($ResetFamiliar.Equals("y")) -or ($ResetFamiliar.Equals("Y"))) {
    Try {
        Write-Host "Resetting Familiar Location..."
        Write-Host " "
        invoke-command -ComputerName localhost -ConfigurationName "AccountActivityAdministration" -ArgumentList $FullEmail -ScriptBlock {
            param($FullEmail)
            reset-adfsaccountlockout -Location familiar -userprincipalname $FullEmail
        }
        if (-not $?) {
            throw $error[0].Exception
        }

        cls
        Write-Host " "
        Write-Host " "
        Write-Host "Completed!" -ForegroundColor Green
    }
    Catch {
        cls
        Write-Host " "
        Write-Host " "
        Write-Host "ERROR: unable to reset Familiar Location" -ForegroundColor Red
    }

    # Display account info again
    Try {
        Write-Host "Displaying Account Information... (if no error shown, successful)"
        Write-Host " "
        invoke-command -ComputerName localhost -ConfigurationName "AccountActivityAdministration" -ArgumentList $FullEmail -ScriptBlock {
            param($FullEmail)
            Get-AdfsAccountActivity -Identity $FullEmail
        }
        if (-not $?) {
            throw $error[0].Exception
        }
        
        Write-Host " "
        Write-Host " "
        
    }
    Catch {
        
        Write-Host " "
        Write-Host " "
        Write-Host "ERROR: Email not found!" -ForegroundColor Red
    }
}
Write-Host " "
Write-Host " "

$Loop = Read-Host -Prompt "Would you like to look at another account? [y/N]"

Write-Host " "
Write-Host " "

} While (($Loop.Equals("y")) -or ($Loop.Equals("Y")))

Write-Host " "
Write-Host " "
pause