## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

<#! PRE-INSTALL-TASKS !#>

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp21.12.1.4030.exe";
    ValidExitCodes = @(0,3010);
    Checksum       = "0f8670eb588009e149a2b9dbd4a1f2a934df13fdde0901f999de1d38a591f6be";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
