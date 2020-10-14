Write-Host "# DevOpsTools" -ForegroundColor "Yellow"

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
choco install -y sharex
choco install -y sharex
choco install -y TelnetClient -source windowsfeatures
choco install -y vim
choco install -y vscode
choco install -y winscp