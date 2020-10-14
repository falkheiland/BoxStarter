Write-Host "# WSL" -ForegroundColor "Yellow"

Write-Host "## WSL | Feature install" -ForegroundColor "Yellow"

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
RefreshEnv

#wsl --set-default-version 2
#https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
#choco install wsl-ubuntu-1804
Write-Host "## WSL | Ubuntu download" -ForegroundColor "Yellow"

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx

Write-Host "## WSL | Ubuntu install" -ForegroundColor "Yellow"

# run the distro once and have it install locally with root user, unset password
RefreshEnv
Ubuntu1804 install --root
Ubuntu1804 run apt update
Ubuntu1804 run apt upgrade -y
