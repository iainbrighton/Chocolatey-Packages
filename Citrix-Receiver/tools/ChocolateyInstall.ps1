## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
$installChocolateyPackageParams = @{
    PackageName    = 'Citrix-Receiver';
    FileType       = 'EXE';
    SilentArgs     = '/noreboot /silent';
    Url            = 'http://downloadplugins.citrix.com/Windows/CitrixReceiver.exe';
    ValidExitCodes = @(0,3010);
    Checksum       = 'D474E1157E3EED67D5360189E85A318044375B563E9229D68A7D522AB17E3F1A';
    ChecksumType   = 'sha256';
}
Install-ChocolateyPackage @installChocolateyPackageParams;
