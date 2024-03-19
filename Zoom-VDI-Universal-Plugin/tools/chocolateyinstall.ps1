
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.10.24730/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.17.10.24730/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '0B8A84851A6E3DEEEEA856623EC436492805B1F425D4FD5D66338DC393BE3206'
  checksumType  = 'sha256'
  checksum64      = 'D1C616EE4CD361DE42BDEE8529293EA42D6CD7D1A2AB6D34B683D45F6B5C5BD5'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs