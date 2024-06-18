
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.13.25060/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.17.13.25060/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '65C690104D487926BC644B684FAB512A71349FAA0B7361CB77CF8028E5152D5C'
  checksumType  = 'sha256'
  checksum64      = '813631C8DA3BAAE1458EFB410E8F1B8C4160F97029F8C4410CBFDE6F61B28BDA'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs