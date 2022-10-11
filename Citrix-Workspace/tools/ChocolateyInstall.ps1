## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

<#! PRE-INSTALL-TASKS !#>

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp22.10.0.21.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "99e6a31531de099059569da344bed0960da0ecb92cbe091cb998ccbdb66dc66c";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
