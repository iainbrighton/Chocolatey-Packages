
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.0.11.25150/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.0.11.25150/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '7E9174928583870875BC429C83C9C6E45C7488A74484B1DD8D8BA6DA21FA0909'
  checksumType  = 'sha256'
  checksum64      = 'CA675BE015521DF95588BAFECB05BB2076F8EE1781B45193D38C9C04FE909B64'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs