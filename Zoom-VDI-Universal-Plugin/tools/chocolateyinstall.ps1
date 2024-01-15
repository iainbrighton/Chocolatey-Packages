
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.11.24500/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/5.16.11.24500/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'FD1EF0E9F77DF61FFA19782C6B092BAD57FD06AB557AB9CFD7391AEA3A72C380'
  checksumType  = 'sha256'
  checksum64      = '244B81F52223833F42947E12CB4B8E7E53DA6CD396D3F36C8BE623400A6DB003'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs