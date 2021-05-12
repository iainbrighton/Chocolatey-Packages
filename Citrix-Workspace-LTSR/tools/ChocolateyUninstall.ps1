## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for EXE installations

<#! PRE-UNINSTALL-TASKS !#>

Uninstall-ChocolateyPackage -PackageName 'Citrix-Workspace-LTSR' -FileType 'EXE' -SilentArgs '/silent /uninstall /cleanup' -File "$((${env:ProgramFiles(x86)}, $env:ProgramFiles -ne $null)[0])\Citrix\Citrix Workspace 1912\TrolleyExpress.exe" -ValidExitCodes @(0,3010);

<#! POST-UNINSTALL-TASKS !#>
