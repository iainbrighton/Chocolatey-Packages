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
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp22.4.0.55.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "2a01f353033d3f9970625910782048ff3fbee5d40cafee1cb91ea58b0672aa2a";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
