$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v24.1.26.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v24.1.26.0.msi"
$checksum64 = "F48AC4B09B651493126BC7B9460785DEFCEA4AD27C1670ABBB6989AD5A6CF957"
$checksum = "56AF2D887391D88745111C39DFE521B5275D7C59563FC9EB7B05CE26042B627D"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $downloadUri
  Url64bit       = $downloadUri64
  softwareName   = 'ShareFile'
  checksum       = $checksum
  checksumType   = 'sha256'
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs