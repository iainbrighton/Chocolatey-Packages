## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for EXE installations

<#! PRE-UNINSTALL-TASKS !#>
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module $ScriptDir\CitrixConfig.psm1

Uninstall-ChocolateyPackage -PackageName 'Citrix-Workspace' -FileType 'EXE' -SilentArgs '/silent /uninstall /cleanup' -File "$env:ALLUSERSPROFILE\Citrix\Citrix Workspace $(Get-CitrixVersion)\TrolleyExpress.exe" -ValidExitCodes @(0,3010);

<#! POST-UNINSTALL-TASKS !#>
