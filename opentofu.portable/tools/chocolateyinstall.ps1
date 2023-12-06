$ErrorActionPreference = 'Stop'

$toolsPath  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    PackageName  = "opentofu.portable"
    File         = "$toolsPath\tofu_1.6.0-beta2_windows_386.zip"
    File64       = "$toolsPath\tofu_1.6.0-beta2_windows_amd64.zip"
    Destination  = $toolsPath
}
Get-ChocolateyUnzip @packageArgs

Remove-Item -force "$toolsPath\*.zip" -ea 0