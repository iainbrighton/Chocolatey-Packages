## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell module installations
try {
    $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'VirtualEngine-Compression' 'https://github.com/VirtualEngine/Compression/releases/download/v1.1.0.18/VirtualEngine.Compression-v1.1.0.18.zip' "$moduleInstallPath";
}
catch {
    throw $_.Exception;
}
