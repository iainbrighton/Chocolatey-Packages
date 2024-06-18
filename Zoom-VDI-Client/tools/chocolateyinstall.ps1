
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.13.25060/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.13.25060/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'A62A099289EF44185A1EAB87465E9D69F4B82D9179CCBEFE6B8F614AAB3C579B'
  checksumType  = 'sha256'
  checksum64      = '11CB12CE7F04E3332618E2D8D42FB311F22D81B67D26313526A9BC70E45F4374'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs