## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell script deployment
try {
    $scriptInstallPath = '{0}\WindowsPowershell' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $scriptInstallPath = '{0}\WindowsPowershell' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'BarrySchiffer-NetScaler-Script' 'http://carlwebster.com/download/8236/?version=2-5' "$scriptInstallPath";
}
catch {
    throw $_.Exception;
}
