$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v24.3.3.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v24.3.3.0.msi"
$checksum64 = "62C00292AD42C3C94098D4030C78B190C80421A58B180F6851BF5D45D7B67C85"
$checksum = "FD2C597142FA256E3C8306B1124B93F7843831CE4AF57E75E9682291C68BD7D2"

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