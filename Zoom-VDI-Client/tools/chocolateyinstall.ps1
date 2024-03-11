
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.5.24630/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.5.24630/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'FF64C6354374722EA3AB3ABCA792FF14CAE92583D5896804B2F9CE4675590C8E'
  checksumType  = 'sha256'
  checksum64      = '8F0E8654662E442424BD02B3E993DB3330F6BF01FC3A8580911A313E04FFC0F8'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs