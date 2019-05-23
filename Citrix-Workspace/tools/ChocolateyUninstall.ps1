## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for EXE installations

<#! PRE-UNINSTALL-TASKS !#>

Uninstall-ChocolateyPackage -PackageName 'Citrix-Workspace' -FileType 'EXE' -SilentArgs '/silent /uninstall /cleanup' -File "$env:ALLUSERSPROFILE\Citrix\Citrix Workspace 1904\TrolleyExpress.exe" -ValidExitCodes @(0,3010);

<#! POST-UNINSTALL-TASKS !#>
