
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.12.24610/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.16.12.24610/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = '466F59F00C6EACA79FDBBE230A8D891E99823A122D8F601DE35F40D781B77615'
  checksumType  = 'sha256'
  checksum64      = '024F2EDF28AED96411A26DAF245ABAAE0A48BF775260FE27EAAAB65DC273DAB9'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs