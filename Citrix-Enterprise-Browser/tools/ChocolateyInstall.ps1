## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

#region version variables
$version = "120"
$Checksum = "E118B29214D57CD6DD65F6854ADCDA1A8C905F824EE21B653D91F8F47666A45E";
$ChecksumType = "sha256";
#endregion version variables

#Get download page for specific version
$sourcePrime = "https://www.citrix.com/downloads/workspace-app/citrix-enterprise-browser-for-windows/"
$responsePrime = Invoke-WebRequest $sourcePrime
$Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Enterprise Browser v$version*").href
$SourceUrl = "https://www.citrix.com$Link"

#Get downloadlink
$response = Invoke-WebRequest $SourceUrl
$downloadlink = "https:" + ($response.Links | where rel -like "*CitrixEnterpriseBrowserInstaller.exe*")[0].rel

Write-Output $downloadlink

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Enterprise-Browser";
    FileType       = "EXE";
    SilentArgs     = "--silent";
    Url            = $downloadlink;
    ValidExitCodes = @(0, 102);
    Checksum       = $Checksum;
    ChecksumType   = $ChecksumType;
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>