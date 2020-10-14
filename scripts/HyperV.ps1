Write-Host "# HyperV" -ForegroundColor "Yellow"

Write-Host "## HyperV - Feature install" -ForegroundColor "Yellow"

choco install -y Microsoft-Hyper-V-All -source windowsfeatures
