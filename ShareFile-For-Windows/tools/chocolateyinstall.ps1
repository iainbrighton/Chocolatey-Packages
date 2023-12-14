$downloadUri64 = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x64_v23.10.16.0.msi"
$downloadUri = "https://dl.sharefile.com/cfwin/ShareFileForWindows_x86_v23.10.16.0.msi"
$checksum64 = "8B0DDB4D47E5CD4F19A976526E7709D393698CB33B1EA29BCBE8E7E24DFA50F5"
$checksum = "CDFA78FD3CB7629B02CBA96C46EF1FC24211AE2E71A3345F2F580BDB229B4758"

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