## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
$installChocolateyPackageParams = @{
    PackageName    = 'Citrix-Workspace';
    FileType       = 'EXE';
    SilentArgs     = '/noreboot /silent';
    Url            = 'https://downloadplugins.citrix.com/Windows/CitrixWorkspaceApp.exe';
    ValidExitCodes = @(0,3010);
    Checksum       = '35D83B904F0A5A3542FC25EC404C28458D966FB9CEA2019E29F3BB7F969189A2';
    ChecksumType   = 'sha256';
}
Install-ChocolateyPackage @installChocolateyPackageParams;
