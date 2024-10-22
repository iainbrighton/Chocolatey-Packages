
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.1.12.25370/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.1.12.25370/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = '62DE64998D6E71B1FFA61E3120BF39E7B440FF7D9B0CC00E191CFDF012C8AE5B'
  checksumType  = 'sha256'
  checksum64      = '4CB3E5BBF9E86069B53EEE8E08D3086F4BD6FA7978BC5FF36DBEA480E34DD6C0'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs