
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.11.24850/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.17.11.24850/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '0885486327AE9D65F4B4A0EB8C1B71160265A062455BD14858867E6CAD2FCB68'
  checksumType  = 'sha256'
  checksum64      = '20C53BEC11BCD738425683B21EE1903FA20F306592C084804BD80B42CBF758D7'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs