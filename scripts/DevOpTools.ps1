Write-Host "# DevOpsTools" -ForegroundColor "Yellow"

Write-Host "## DevOpsTools | choco" -ForegroundColor "Yellow"

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
choco install -y rsat
choco install -y TelnetClient -source windowsfeatures
choco install -y vim
choco install -y vscode
choco install -y winscp

Write-Host "## DevOpsTools | vscode extensions" -ForegroundColor "Yellow"

code --install-extension shan.code-settings-sync

# Copy (Windows)PowerShell Profil

$ProfileFile = '{0}\profile.ps1' -f $HOME
Invoke-WebRequest -Uri https://gist.github.com/falkheiland/d221d84a7b2a383854747c127a612a89 -OutFile $ProfileFile -UseBasicParsing
@(
  ('{0}\Documents\Powershell\Microsoft.PowerShell_profile.ps1' -f $HOME),
  ('{0}\Documents\Powershell\Microsoft.VSCode_profile.ps1' -f $HOME),
  ('{0}\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1' -f $HOME)
  ('{0}\Documents\WindowsPowershell\Microsoft.VSCode_profile.ps1' -f $HOME)
) | ForEach-Object {
  Copy-Item -Path $ProfileFile -Destination $_
}

# Copy Windows Terminal settings.json

$SettingsFile = '{0}\settings.json' -f $HOME
$SettingsDestination = '{0}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\' -f $HOME
Invoke-WebRequest -Uri https://gist.github.com/falkheiland/a227aeb50dfb380b66a6f4e9c983acff -OutFile $SettingsFile -UseBasicParsing
Copy-Item -Path $SettingsFile -Destination ('{0}{1}' -f $SettingsDestination, $SettingsFile)