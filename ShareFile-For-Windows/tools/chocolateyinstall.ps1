$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v24.2.2.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v24.2.2.0.msi"
$checksum64 = "EF80A402FB6062F717D587E78E48EB0FDD29E31FD864DE8C6E9C5E2A8956F8A6"
$checksum = "72EB31F8BE3E2854877BC9AFEBABCE02F901C8FF26B8E8FE99EE73A04FD8B95F"

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