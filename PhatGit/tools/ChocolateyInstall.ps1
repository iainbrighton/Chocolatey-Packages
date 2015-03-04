## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based Powershell module installations
try {
    $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:chocolateyPackageParameters -like '*AllUsers*') {
        $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f $env:ProgramFiles;
    }
    Install-ChocolateyZipPackage 'PhatGit' 'https://github.com/iainbrighton/PhatGit/releases/download/v1.0.3.18/PhatGit-v1.0.3.18.zip' "$moduleInstallPath";
}
catch {
    throw $_.Exception;
}
