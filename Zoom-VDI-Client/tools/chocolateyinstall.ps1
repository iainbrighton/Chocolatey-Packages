
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.12.24920/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.12.24920/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = '3E99F19134E1A24FBB5D5E2F21824B8BCC6FC87A1F03ED223759D788AFEC1966'
  checksumType  = 'sha256'
  checksum64      = '7144B63BA0A1B05F2BDF5CD88CF410689035FAB613B02D83ADF0B3E8AFDBFB6D'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs