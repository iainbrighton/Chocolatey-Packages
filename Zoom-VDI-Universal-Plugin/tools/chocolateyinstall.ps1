
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.10.24420/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.16.10.24420/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '38FD1136273139ECE5F3230BE610CEE8EE616A19C50014C4FF969FD15C00132F'
  checksumType  = 'sha256'
  checksum64      = 'CB868D1BE3EBF36D6A30CEC8B6FC929812E56F86E02538BC46B3F3C3412E9A9D'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs