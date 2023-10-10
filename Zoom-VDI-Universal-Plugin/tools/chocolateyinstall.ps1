
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.0.24280/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.16.0.24280/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'a7fb4de1166a1be7d96cb4eb3f55863cd7a813242d228c7eb7ca4e2902dd1490'
  checksumType  = 'sha256'
  checksum64      = '338e8c5443d59d2db0fd1d4bcbae83e01f0ae7fd1625bde41d005abbfa869935'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs