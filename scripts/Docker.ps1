Write-Host "# Docker" -ForegroundColor "Yellow"

choco install -y Containers -source windowsfeatures
choco install -y Containers-DisposableClientVM -source windowsfeatures
choco install -y docker-desktop
choco install -y docker-toolbox
choco install -y vscode-docker
