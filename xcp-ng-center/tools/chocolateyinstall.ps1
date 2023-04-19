$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/xcp-ng/xenadmin/releases/download/v20.04.01.33/XCP-ng-Center-20.04.01.33.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'XCP-ng Center*'
  checksum      = '29f9c0d5dd738fb8c3e62a5123bb17d5eae1e456adcd11eeb5f3691882753a9d'
  checksumType  = 'sha256'
  silentArgs    = "/qn"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs