## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
$installChocolateyPackageParams = @{
    PackageName    = 'Citrix-Receiver';
    FileType       = 'EXE';
    SilentArgs     = '/noreboot /silent';
    Url            = 'http://downloadplugins.citrix.com/Windows/CitrixReceiver.exe';
    ValidExitCodes = @(0,3010);
    Checksum       = 'F7A05C9ECA4710667FE388715506E2B39DBE6A1EB7D11071CC00B5FDBBCF4AE4';
    ChecksumType   = 'sha256';
}
Install-ChocolateyPackage @installChocolateyPackageParams;
