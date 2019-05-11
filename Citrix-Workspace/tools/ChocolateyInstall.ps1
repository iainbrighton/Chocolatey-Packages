## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$releaseUri = 'https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows/workspace-app-for-windows-1903.html'
$downloadLink = 'https:{0}' -f ((Invoke-WebRequest -Uri $releaseUri).Links | Where-Object { $_.href -eq '#ctx-dl-eula' } | Select-Object -ExpandProperty 'rel')

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent";
    Url            = "$downloadUri";
    ValidExitCodes = @(0,3010);
    Checksum       = "086DBE728BFBA427D1DF28C3A7ADEB072CD3878758084A547879759EE36064B5";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
