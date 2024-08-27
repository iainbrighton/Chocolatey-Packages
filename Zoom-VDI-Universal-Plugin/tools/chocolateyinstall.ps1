
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.0.12.25240/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.0.12.25240/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'BDF5CE7FB4029E206BBF4E9BB4486A6173FC644641799D9C571A6EBAF5BD6D31'
  checksumType  = 'sha256'
  checksum64      = '997FA7BB020CD48120A45B763EA80D7924C30AC92DC05F72141C0DE8B32C8972'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs