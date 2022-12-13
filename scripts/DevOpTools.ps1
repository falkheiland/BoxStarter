Write-Host "# DevOpsTools" -ForegroundColor "Yellow"

Write-Host "## DevOpsTools - choco" -ForegroundColor "Yellow"

choco install -y chocolatey
choco install -y chocolatey-core.extension
choco install -y chocolatey-dotnetfx.extension
choco install -y chocolatey-fastanswers.extension
choco install -y chocolatey-misc-helpers.extension
choco install -y chocolatey-windowsupdate.extension
choco install -y chocolateygui
choco install -y filezilla
choco install -y gh
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y github-desktop
choco install -y graphviz
choco install -y hackfont
choco install -y mc
choco install -y microsoft-windows-terminal
choco install -y mRemoteNG
choco install -y notepadplusplus
choco install -y openssh
choco install -y peco
choco install -y pester
choco install -y plantuml
choco install -y poshgit
choco install -y postman
choco install -y pwsh
choco install -y rsat --params '"/AD"'
choco install -y TelnetClient -source windowsfeatures
choco install -y vim
choco install -y vscode
choco install -y winscp

# Copy (Windows)PowerShell Profil

$DocumentPath = ('{0}\documents\PowerShell' -f $HOME)
New-Item -ItemType Directory -Path $DocumentPath -ErrorAction SilentlyContinue
$ProfileFile = '{0}\documents\profile.ps1' -f $HOME
$PsUri = 'https://gist.githubusercontent.com/falkheiland/d221d84a7b2a383854747c127a612a89/raw/409d24311da6171c4ca5156e61d226d4aa2a449e/WindowsPowerShell%2520Microsoft.PowerShell_profile.ps1'
Invoke-WebRequest -Uri $PsUri -OutFile $ProfileFile -UseBasicParsing
@(
  ('{0}\documents\Powershell\Microsoft.PowerShell_profile.ps1' -f $HOME),
  ('{0}\documents\Powershell\Microsoft.PowerShell_profile.ps1' -f $HOME),
  ('{0}\documents\Powershell\Microsoft.VSCode_profile.ps1' -f $HOME),
  ('{0}\documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1' -f $HOME)
  ('{0}\documents\WindowsPowershell\Microsoft.VSCode_profile.ps1' -f $HOME)
) | ForEach-Object {
  Copy-Item -Path $ProfileFile -Destination $_
}
Remove-Item -Path $ProfileFile

# Copy Windows Terminal settings.json

$SettingsFile = '{0}\documents\settings.json' -f $HOME
$SettingsDestination = '{0}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\' -f $HOME
$WtUri = 'https://gist.githubusercontent.com/falkheiland/a227aeb50dfb380b66a6f4e9c983acff/raw/54bdc68468ee8aba8687b09ca8e39a294c22b46b/Windows%2520Terminal%2520settings.json'
Invoke-WebRequest -Uri $WtUri -OutFile $SettingsFile -UseBasicParsing
Copy-Item -Path $SettingsFile -Destination ('{0}{1}' -f $SettingsDestination, 'settings.json')
Remove-Item -Path $SettingsFile