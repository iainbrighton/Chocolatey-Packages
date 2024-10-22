$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v24.10.3.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v24.10.3.0.msi"
$checksum64 = "FEC3B1B0B76DA9181C42474595AF303F5EEBF9A3BFE591C0FAFFD8271D1F17E1"
$checksum = "4C662AD451829E25E8152CE6958990EFB02BCD428D3552A66EF98E52F012F5A9"

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