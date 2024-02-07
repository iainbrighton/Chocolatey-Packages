
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.5.24630/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.17.5.24630/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'F9B7327C954A74036351C8D8BF45DE87C83CB08A4BCF84C18B30B606B5AC3228'
  checksumType  = 'sha256'
  checksum64      = 'B67DE526521C18EB27FB7A25E0E3D75064CBD707B283176FA4EA08476AEEC3DF'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs