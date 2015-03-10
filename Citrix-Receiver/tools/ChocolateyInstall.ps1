## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
Install-ChocolateyPackage -PackageName 'Citrix-Receiver' -FileType 'EXE' -SilentArgs '/noreboot /silent' -Url 'http://downloadplugins.citrix.com/Windows/CitrixReceiver.exe' -ValidExitCodes @(0);
