$packageName = 'nitroreader.install'
$checksum = 'EE1E777D7D46B09C5DCCB16EF91B5F181581156B575283251336DDB0EA0B569D';
$checksum64 = '77720C4A6E1DDE7B0790A3375E0120821A2147307F62E0584B066F54E5200CE8';
$msiChecksum = 'B34290DFC9558E3B639F5AD557DF3444212EB76D66941608068264AD8EC7F586';
$msiChecksum64 = '2B29BB44A5E8A2F03F39E251EF00473E6C9A1A919E86CD3BA4CA330B14D5D3A0';

## Template VirtualEngine.Build ChocolateyInstall.ps1 file for extracted MSI installations
$packageToolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition;
$packageDownloadPath = Join-Path -Path $packageToolsPath -ChildPath 'nitro_reader.exe';
$getChocolateyWebFileParams = @{
    PackageName    = $packageName;
    FileFullPath   = $packageDownloadPath;
    Url            = 'http://install.nitropdf.com/reader5/en/nitro_reader5.exe';
    Checksum       = $checksum;
    ChecksumType   = 'sha256';
    Url64bit       = 'http://install.nitropdf.com/reader5/en/nitro_reader5_64.exe';
    Checksum64     = $checksum64;
    ChecksumType64 = 'sha256';
}
Get-ChocolateyWebFile @getChocolateyWebFileParams;

## Extract Msi
$packageExtractPath = Join-Path -Path $packageToolsPath -ChildPath 'nitro_reader.msi';
Start-ChocolateyProcessAsAdmin -ExeToRun $packageDownloadPath -Statements "/EXTRACTMSI:$packageExtractPath" -Minimized;

## Install Msi
$installChocolateyInstallPackageParams = @{
    PackageName    = $packageName;
    FileType       = 'MSI';
    SilentArgs     = '/qn /norestart';
    File           = $packageExtractPath;
    ValidExitCodes = @(0,3010);
    Checksum       = $msiChecksum;
    ChecksumType   = 'sha256';
    Checksum64     = $msiChecksum64;
    ChecksumType64 = 'sha256';
}
Install-ChocolateyInstallPackage @installChocolateyInstallPackageParams;
