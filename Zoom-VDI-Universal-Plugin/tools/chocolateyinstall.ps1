
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.15.4.23940/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.15.4.23940/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '8bc459026ff7f1f9b0ba3d531ab658e94993c741a1a47b8f4f72a8321b54149b'
  checksumType  = 'sha256'
  checksum64      = 'a10a50baed7f8ec15866269d925be9f4c0e234c270e9b925050db806b1e9f542'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs