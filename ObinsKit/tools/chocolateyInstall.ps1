$packageArgs = @{
    packageName = 'ObinsKit'
    fileType = 'exe'
    url64          = "https://s3.hexcore.xyz/occ/win32/x64/ObinsKit_1.2.11_x64.exe"
    checksum64     = "1f628d002c9719d6001ea7a91cc576a6dadac04649ec475601d85970c6660982"
    url            = "https://s3.hexcore.xyz/occ/win32/ia32/ObinsKit_1.2.11_ia32.exe"
    checksum       = "2c261af5b86c0c76698eeba7406ec074fe1ad86e77fd813c88be25b39697f33d"
    checksumType  = 'sha256'
    checksumType64  = 'sha256'
    silentArgs    = "/S"
    Options = @{
      Headers = @{
        referer = "https://www.hexcore.xyz/"
      }
    }
  }

Install-ChocolateyPackage @packageArgs