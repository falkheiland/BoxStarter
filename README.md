This project aimes to quickly setup a newly installed Windows 10.
It si leveraging [Boxstarter](http://boxstarter.org) and [Chocolatey](http://chocolatey.org) to quickly install most of the tools I use.

# Installing from the web

Run the following command from PowerShell:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://boxstarter.org/bootstrapper.ps1')); Get-Boxstarter -Force
```

# References 
I havely borrowed from [Laurent Kempe](https://laurentkempe.com/2018/06/01/Automating-development-machine-installation/).

Some script part were taken from [Microsoft/windows-dev-box-setup-scripts](https://github.com/Microsoft/windows-dev-box-setup-scripts)

# Execution from the web

[<a href='http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/falkheiland/BoxStarter/main/Dev.ps1'>Dev</a>]

[<a href='http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/falkheiland/BoxStarter/main/Priv.ps1'>Priv</a>]
