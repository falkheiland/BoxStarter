Write-Host '# WSL' -ForegroundColor 'Yellow'

Write-Host '## WSL - install' -ForegroundColor 'Yellow'

wsl --install

Write-Host '## WSL - Ubuntu updatel' -ForegroundColor 'Yellow'

RefreshEnv
ubuntu run apt update
ubuntu run apt apt upgrade -y
