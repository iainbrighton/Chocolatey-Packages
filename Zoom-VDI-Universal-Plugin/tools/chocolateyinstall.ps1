
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.13.24615/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.16.13.24615/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '27B21A30DA540965B04BBA253E94660CCCAAF2B2787DE8DBF21271D44D792563'
  checksumType  = 'sha256'
  checksum64      = '18FFB8DB5B4B8863C006EC4577F5120BEF2D809CDC7DB7C70453A0F0967203BF'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs