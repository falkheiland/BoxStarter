Write-Host "# PersonalProjects" -ForegroundColor "Yellow"

New-Item -Path C:\ -Name Github -ItemType Directory | Set-Location

git.exe clone https://github.com/IGEL-Community/PSIGEL