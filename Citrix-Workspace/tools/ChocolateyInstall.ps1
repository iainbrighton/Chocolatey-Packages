## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$citrixReleaseWebPage = "https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows/workspace-app-for-windows-1903.html"

$webPageResponse = $response = Invoke-WebRequest $citrixReleaseWebPage
$relLink = $response.Links | Where-Object { $_.href -eq "#ctx-dl-eula" } | Select rel
$downloadLink = "http:" + $relLink.rel

$installChocolateyPackageParams = @{
    PackageName    = 'Citrix-Workspace';
    FileType       = 'EXE';
    SilentArgs     = '/noreboot /silent';
    Url            = '$downloadLink';
    ValidExitCodes = @(0,3010);
    Checksum       = 'A189E74841E97D776520880C1D1CF5EEB52E536826D1AEA5E42C7163B2468140'; # Update manually
    ChecksumType   = 'sha256';
}
Install-ChocolateyPackage @installChocolateyPackageParams;
