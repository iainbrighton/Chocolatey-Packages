## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

#Citrix uses dynamic download links that expire, likely for telemetry reasons. in some cases they provide direct download links, but not in this case. As a result the script needs to parse the download page to get the current dynamic link.

#region version variables
$version = "123"
$Checksum = "5111601B20C8BCC29CBA246DCC0A12BEF54724DBB2E9B93ECA4643B336D2A356";
$ChecksumType = "sha256";
#endregion version variables

#Get download page for specific version
$sourcePrime = "https://www.citrix.com/downloads/workspace-app/citrix-enterprise-browser-for-windows/"
$responsePrime = Invoke-WebRequest $sourcePrime
$Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Enterprise Browser v$version*").href
if ($null -eq $Link){
    $sourcePrime = "https://www.citrix.com/downloads/workspace-app/earlier-versions-of-citrix-enterprise-browser-for-windows/"
    $responsePrime = Invoke-WebRequest $sourcePrime
    $Link = ($responsePrime.Links | where outerHTML -like "*>Citrix Enterprise Browser v$version*").href
}
if ($null -eq $Link)
{
    throw [System.Net.WebException] "Download URL for version not found"
}
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