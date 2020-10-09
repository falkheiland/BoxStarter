#Enable-WindowsOptionalFeature -Online -FeatureName containers -All
#RefreshEnv

choco install -y Containers --source="'windowsFeatures'"
choco install -y Containers-DisposableClientVM --source="'windowsFeatures'"
choco install -y docker-desktop
choco install -y docker-docker-toolbox
choco install -y vscode-docker
