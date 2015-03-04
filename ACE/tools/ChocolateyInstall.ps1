## Template VirtualEngine.Build ChocolateyInstall.ps1 file for bundled EXE/MSI installations
$packageToolsPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent;
$packagePath = Split-Path -Path $packageToolsPath -Parent;
$bundleFilePath = Join-Path -Path $packagePath -ChildPath 'ACE.MSI';
Install-ChocolateyInstallPackage -PackageName 'ACE' -FileType 'MSI' -SilentArgs '/qn /norestart' -File $bundleFilePath;
