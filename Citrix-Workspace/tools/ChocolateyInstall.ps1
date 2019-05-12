## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$releaseUri = "https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows/workspace-app-for-windows-1903.html"
$checksum = "086DBE728BFBA427D1DF28C3A7ADEB072CD3878758084A547879759EE36064B5"

$READYSTATE_READY = 4

Write-Host "Starting IE"
$ie = New-Object -comobject InternetExplorer.Application

Write-Host "Navigating"
$ie.Navigate2($releaseUri) 
$ie.Visible = $false

while($ie.ReadyState -ne $READYSTATE_READY) {
    Write-Host "Not ready yet, Waiting"
    start-sleep -Seconds 2
}

Write-Host "Done Processing Web Site"
$link = $ie.Document.getElementsByTagName("a") | Where-Object { $_.href -like "*.html#ctx-dl-eula" } | select -First 1 

$downloadUri = "https:" + $link.rel

Write-Host "Link is $downloadUri"

$ie.quit()

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent";
    Url            = "$downloadUri";
    ValidExitCodes = @(0,3010);
    Checksum       = "$checksum";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
