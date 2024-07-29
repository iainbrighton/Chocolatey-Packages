
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.0.11.25150/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/6.0.11.25150/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = '28C22EF2DE548466936B919B3639250BBEC9DECBD8CD08A629F69250F59B6F75'
  checksumType  = 'sha256'
  checksum64      = 'D40D6CBE562405D8D5629B9376F0F48EE8B53368BD9FF781D6D0BF783982740C'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs