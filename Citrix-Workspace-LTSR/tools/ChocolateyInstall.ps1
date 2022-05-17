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

If (Test-ChocolateyPackageInstalled -Package "citrix-workspace")
{
    throw "Citrix Workspace CR already installed. Aborting Citrix Workspace LTSR install"
}
<#! PRE-INSTALL-TASKS !#>

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace-LTSR";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp22.3.1.41.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "628e7bd071987637e43ebae95b6009059859226443059fa1baf9aab57ae2f611";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
