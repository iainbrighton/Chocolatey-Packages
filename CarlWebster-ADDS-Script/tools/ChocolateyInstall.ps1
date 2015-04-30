## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell script deployment
try {
    $scriptInstallPath = '{0}\WindowsPowershell' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $scriptInstallPath = '{0}\WindowsPowershell' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'CarlWebster-ADDS-Script' 'http://carlwebster.com/download/8226/?version=1-1' "$scriptInstallPath";
}
catch {
    throw $_.Exception;
}
