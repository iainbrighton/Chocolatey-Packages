## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
$installChocolateyPackageParams = @{
    PackageName    = 'Citrix-Workspace';
    FileType       = 'EXE';
    SilentArgs     = '/noreboot /silent';
    Url            = 'https://downloadplugins.citrix.com/Windows/CitrixWorkspaceApp.exe';
    ValidExitCodes = @(0,3010);
    Checksum       = 'A189E74841E97D776520880C1D1CF5EEB52E536826D1AEA5E42C7163B2468140';
    ChecksumType   = 'sha256';
}
Install-ChocolateyPackage @installChocolateyPackageParams;
