Write-Host '# WSL' -ForegroundColor 'Yellow'

Write-Host '## WSL - install' -ForegroundColor 'Yellow'

wsl.exe --install

Write-Host '## WSL - Ubuntu updatel' -ForegroundColor 'Yellow'

RefreshEnv
ubuntu.exe run apt update -y && apt upgrade -y
