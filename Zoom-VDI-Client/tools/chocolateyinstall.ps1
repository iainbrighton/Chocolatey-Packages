
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.10.24730/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.10.24730/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'B22785D334D1D211E18B662A1CD2E295C73EC0602D55F7BEF3A11AFC1DD7790B'
  checksumType  = 'sha256'
  checksum64      = 'B8FC955757A9DC21A5752E64E8074184B07E62B7119917673DF99342159A598A'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs