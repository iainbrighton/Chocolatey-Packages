
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.12.24610/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.16.12.24610/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '57CE1C0D2CDBF0A338C743E3E2EA8ED9CC3C5439A0DB9D41C4E802E88B36241C'
  checksumType  = 'sha256'
  checksum64      = '19285D2DE948CCF7822C1780D810C643CB2EE24FE1DE10037BE2EE55FE979BAD'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs