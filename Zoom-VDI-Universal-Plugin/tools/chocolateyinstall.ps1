
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.6.24660/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.17.6.24660/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'C5E11718D9B476AB4AA4958360D0AFD639A534BB8FEBFDD8A96B3CD812F007BB'
  checksumType  = 'sha256'
  checksum64      = '858070D1D2C8B09D1467CA36E73C9A49293F8199A1F64D1C019817D6DCEFA374'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs