## Template VirtualEngine.Build ChocolateyInstall.ps1 file for extracted MSI installations
$packageToolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition;
$packageDownloadPath = Join-Path -Path $packageToolsPath -ChildPath 'nitro_reader.exe';
Get-ChocolateyWebFile -PackageName 'nitroreader' -FileFullPath $packageDownloadPath -Url 'http://install.nitropdf.com/reader/en/nitro_reader3.exe' -Url64bit 'http://install.nitropdf.com/reader/en/nitro_reader3_64.exe';
## Extract Msi
$packageExtractPath = Join-Path -Path $packageToolsPath -ChildPath 'nitro_reader.msi';
Start-ChocolateyProcessAsAdmin -ExeToRun $packageDownloadPath -Statements "/EXTRACTMSI:$packageExtractPath" -Minimized;
## Install Msi
Install-ChocolateyInstallPackage -PackageName 'nitroreader' -FileType 'MSI' -SilentArgs '/qn /norestart' -File $packageExtractPath;
