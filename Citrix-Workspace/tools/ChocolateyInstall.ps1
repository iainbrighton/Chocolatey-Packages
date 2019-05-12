## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$releaseUri = 'https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows/workspace-app-for-windows-1903.html'
## Kindly borrowed from https://github.com/chocolatey-community/chocolatey-coreteampackages/blob/master/automatic/wps-office-free/update_helper.ps1
$READYSTATE_READY = 4
$internetExplorer = New-Object -ComObject InternetExplorer.Application
$internetExplorer.Navigate2($releaseUri) 
$internetExplorer.Visible = $false
while ($internetExplorer.ReadyState -ne $READYSTATE_READY) {
    Start-Sleep -Seconds 1
}
$link = $internetExplorer.Document.getElementsByTagName('a') | Where-Object { $_.href -match '.html#ctx-dl-eula$' } | Select-Object -First 1 
$downloadUri = 'https:{0}' -f $link.rel
$internetExplorer.Quit()

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
