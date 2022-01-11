## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

<#! PRE-INSTALL-TASKS !#>

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp21.12.1.4030.exe";
    ValidExitCodes = @(0,3010);
    Checksum       = "0F8670EB588009E149A2B9DBD4A1F2A934DF13FDDE0901F999DE1D38A591F6BE";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
