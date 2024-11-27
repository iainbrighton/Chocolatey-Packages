
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.1.13.25490/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.1.13.25490/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'B2705D177EDD41A2CA9C23690292FDCA1057D072FDFAE8A3DA71D1DE007409D6'
  checksumType  = 'sha256'
  checksum64      = '982BD7494681559A448525E6AC11A6BE7A4E6E5887791652F723C4D109DDF560'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs