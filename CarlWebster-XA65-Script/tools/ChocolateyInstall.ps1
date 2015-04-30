## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell script deployment
try {
    $scriptInstallPath = '{0}\WindowsPowershell' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $scriptInstallPath = '{0}\WindowsPowershell' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'CarlWebster-XA65-Script' 'http://carlwebster.com/download/8298/?version=4-2' "$scriptInstallPath";
}
catch {
    throw $_.Exception;
}
