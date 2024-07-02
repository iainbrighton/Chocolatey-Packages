
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/6.0.10.25100/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/6.0.10.25100/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'A4725C6FAFD7799B24421A73F0671345FDD2E64C25021D3A701DA4AE3E416270'
  checksumType  = 'sha256'
  checksum64      = 'FBA92CF3637C060F95F959BAD81345A686ADBF36FC56AAA0C6E3551B36786923'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs