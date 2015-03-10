## Template VirtualEngine.Build ChocolateyInstall.ps1 file for zipped EXE/MSI installations
$packageToolsPath = Split-Path -parent $MyInvocation.MyCommand.Definition;
Install-ChocolateyZipPackage -PackageName 'Citrix-XenServer-SDK' -Url 'http://downloadns.citrix.com.edgesuite.net/akdlm/7289/XenServer-6.2.0-SDK.zip' -UnzipLocation $packageToolsPath;
$packageFilePath = Join-Path $packageToolsPath -ChildPath 'XenServer-SDK\XenServerPSSnapIn\XenServerPSSnapIn-6.2.0-1.msi';
Install-ChocolateyInstallPackage -PackageName 'Citrix-XenServer-SDK' -FileType 'MSI' -SilentArgs '/qn /norestart' -File $packageFilePath -ValidExitCodes @(0,3010);
