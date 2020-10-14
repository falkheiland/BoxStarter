Write-Host "# Powershell" -ForegroundColor "Yellow"

Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart
Get-PackageProvider -Name Nuget -ForceBootstrap
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
