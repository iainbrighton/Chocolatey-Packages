$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v24.5.3.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v24.5.3.0.msi"
$checksum64 = "377EDB387D822D87D1F94072E6692BB4BB255B249E4F84757411C2F3223742CB"
$checksum = "FB78CE1BBE2604DC29D1973FA94014E8796D7B366A8258D74BE0BC11631F009D"

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