## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations
function Test-ChocolateyPackageInstalled {
    Param (
        [ValidateNotNullOrEmpty()]
        [string]
        $Package
    )

    Process {
        if (Test-Path -Path $env:ChocolateyInstall) {
            $packageInstalled = Test-Path -Path $env:ChocolateyInstall\lib\$Package
        }
        else {
            throw "Can't find a chocolatey install directory..."
        }

        return $packageInstalled
    }
}

If (Test-ChocolateyPackageInstalled -Package "citrix-workspace-ltsr")
{
    throw "Citrix Workspace LTSR already installed. Aborting Citrix Workspace CR install"
}
<#! PRE-INSTALL-TASKS !#>

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp22.9.0.28.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "bf3504d0e81e1809c6b47e13923a8592b4c3fc72fdc00a2c8b216461931dafef";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
