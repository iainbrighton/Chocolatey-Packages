
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.6.24660/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.6.24660/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = '37D6292F17B0239EB9065BA57E1B45EE74361D6967670523DA5DB934EE88BAFD'
  checksumType  = 'sha256'
  checksum64      = '554A6B370AF06A84F1F45FBF184690A14BDBC378A77C670487038B6836EF3307'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs