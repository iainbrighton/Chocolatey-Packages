
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.15.11.24220/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.15.11.24220/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '1f8d07b568e3575d1bfec26af591854771e8d569ae1dc1db3798b100a95f1958'
  checksumType  = 'sha256'
  checksum64      = '090a1e57332d6d32898cad90648ba10d27b288b173b3bf02de1fb29a9299ac7e'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs