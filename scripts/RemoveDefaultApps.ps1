Write-Host "# RemoveDefaultApps" -ForegroundColor "Yellow"

#Referenced to build script
# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1

function removeApp
{
    Param ([string]$appName)
    Write-Output "Trying to remove $appName"
    Get-AppxPackage $appName -AllUsers | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like $appName | Remove-AppxProvisionedPackage -Online
}

$applicationList = @(
    "*.AdobePhotoshopExpress"
    "*.Duolingo-LearnLanguagesforFree"
    "*.EclipseManager"
    "*Autodesk*"
    "*BubbleWitch*"
    "*DisneyMagicKingdom*"
    "*Dropbox*"
    "*Facebook*"
    "*Keeper*"
    "*MarchofEmpires*"
    "*Minecraft*"
    "*Netflix*"
    "*Plex*"
    "*Solitaire*"
    "*Twitter*"
    "ActiproSoftwareLLC.562882FEEB491" # Code Writer
    "G5*"
    "king.com*"
    "Microsoft.3DBuilder"
    "Microsoft.Bing*"
    "Microsoft.CommsPhone"
    "Microsoft.FreshPaint"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.Xbox*"
    "Microsoft.Zune*"
);

foreach ($app in $applicationList)
{
    removeApp $app
}
