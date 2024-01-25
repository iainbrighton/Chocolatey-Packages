
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.16.11.24500/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.16.11.24500/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'A6E609DD45161EF669242CE0160BB825EDFF5A51B01A2A5A43B950D57F67BC1E'
  checksumType  = 'sha256'
  checksum64      = 'E29E05FF86E6216B2F5444F6252BA118924BF04BAC3B6B5F7C013C1716FA37E7'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs