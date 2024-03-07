## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

function Test-ChocolateyPackageInstalled
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Package
    )
    process
    {
        if ((-not [System.String]::IsNullOrEmpty($env:ChocolateyInstall)) -and (Test-Path -Path $env:ChocolateyInstall))
        {
            $isPackageInstalled = Test-Path -Path "$env:ChocolateyInstall\lib\$Package"
        }
        else
        {
            throw 'Can''t find a chocolatey install directory...'
        }
        return $isPackageInstalled
    }
}

if (Test-ChocolateyPackageInstalled -Package 'citrix-workspace')
{
    throw 'Package ''Citrix-Workspace'' (Current Release) is already installed. Aborting ''Citrix-Workspace-LTSR'' package installation.'
}

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace-LTSR";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent /AutoUpdateCheck=disabled";
    Url            = "https://downloadplugins.citrix.com/ReceiverUpdates/Prod/Receiver/Win/CitrixWorkspaceApp22.3.6001.6113.exe";
    ValidExitCodes = @(0,3010,40008);
    Checksum       = "881AB4380B0AA43AF704B845712B01564B72EEA20F25850A31B0BB6CD6DDFA01";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
