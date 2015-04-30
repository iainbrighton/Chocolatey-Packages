## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell script deployment
try {
    $scriptInstallPath = '{0}\WindowsPowershell' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $scriptInstallPath = '{0}\WindowsPowershell' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'KeesBaggerman-Nutanix-Script' 'http://carlwebster.com/download/8379/?version=1-0' "$scriptInstallPath";
}
catch {
    throw $_.Exception;
}
