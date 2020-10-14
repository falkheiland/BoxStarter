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
executeScript "DevOpTools.ps1";
executeScript "WindowsTools.ps1";

executeScript "HyperV.ps1";
RefreshEnv
executeScript "WSL.ps1";
RefreshEnv
executeScript "Docker.ps1";

#--- Get personal projects ---
executeScript "PersonalProjects.ps1";

Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
Enable-UAC