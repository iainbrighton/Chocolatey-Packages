## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for EXE installations
Uninstall-ChocolateyPackage -PackageName 'Citrix-Receiver' -FileType 'EXE' -SilentArgs '/silent /uninstall /cleanup' -File "$env:ALLUSERSPROFILE\Citrix\Citrix Receiver\TrolleyExpress.exe" -ValidExitCodes @(0); 
