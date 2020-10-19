Write-Host "# Start" -ForegroundColor "Yellow"

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
Write-Host "helper script base URI is $helperUri"

# General boxstarter settings
$Boxstarter.RebootOk = $true # Allow reboots?
$Boxstarter.NoPassword = $false # Is this a machine with no login password?
$Boxstarter.AutoLogin = $true # Save my password securely and auto-login after a reboot

function executeScript
{
    Param ([string]$script)
    Write-Host "executing $helperUri/$script ..."
    Invoke-Expression ((New-Object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "Powershell.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "WindowsTools.ps1";

Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
Enable-UAC