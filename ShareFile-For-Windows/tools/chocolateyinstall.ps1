$releaseUri = 'https://www.citrix.com/downloads/sharefile/clients-and-plug-ins/citrix-files-for-windows.html'
$releaseExeName = '*ShareFileForWindows_x64_v23.7.12.0.msi*'
write-host 'Resolving download link...'
$links = (Invoke-WebRequest $releaseUri).links
$relativeUri = $links | where {$_.rel -like $releaseExeName} | select-object -expandproperty rel
if (!$relativeUri)
{
  throw "Download link not found. Package possibly outdated"
}
$downloadUri = 'https:' + $relativeUri
write-host 'Obtained download link...'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $downloadUri
  softwareName  = 'ShareFile'

  checksum      = '7ae48eeaba486fdb961b1c48a1d942897fbbc783397fa33976fc830d72c0a7a5'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs