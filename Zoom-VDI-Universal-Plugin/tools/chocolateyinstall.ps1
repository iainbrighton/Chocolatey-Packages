
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.0.10.25100/ZoomVDIUniversalPlugin.msi'
$url64      = "https://zoom.us/download/vdi/6.0.10.25100/ZoomVDIUniversalPluginx64.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom VDI Universal Plugin*'

  checksum      = 'B66341F3627B6B151D7061120FD39185A0673C21EFB988C061D30F66B35900AD'
  checksumType  = 'sha256'
  checksum64      = '65D2DFB4894C685744758574FE65AF8BFB5A519DC75EE1BF765D55E3306B3200'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs