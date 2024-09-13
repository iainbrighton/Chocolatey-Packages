
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.1.10.25260/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.1.10.25260/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '7CA6780B75236733A03F4D6117C5CF5CA9877F73FB17952B2A8664AD0DA5D22A'
  checksumType  = 'sha256'
  checksum64      = 'FC087DE7DBB1F5A53745FADEDA8431610696ECFCA19B0603053B71E1139C4EA4'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs