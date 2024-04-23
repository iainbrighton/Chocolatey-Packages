
$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://zoom.us/download/vdi/5.17.11.24850/ZoomInstallerVDI.msi'
$url64      = "https://zoom.us/download/vdi/5.17.11.24850/ZoomInstallerVDI.msi?archType=x64"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64         = $url64
  softwareName  = 'Zoom Client for VDI*'

  checksum      = 'F10C949D30C9D563C49AFA4008FCB5D58A7589859C07AF70A15D9BF54E0B721B'
  checksumType  = 'sha256'
  checksum64      = '4C8942CB17C8191D45F2FF90CD273FE332F19C2DDF194385FE8C5AE7E340A1DF'
  checksumType64  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DISABLEAUS=TRUE"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs