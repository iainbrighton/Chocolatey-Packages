## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for Zip-based Powershell module installations
try {
    $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f [System.Environment]::GetFolderPath('Personal');
    if ($env:PackageParameters -like '*AllUsers') {
        $moduleInstallPath = '{0}\WindowsPowershell\Modules' -f $env:ProgramFiles;
    }
    Remove-Item -Path "$moduleInstallPath\PhatGit" -Recurse -Force;
}
catch {
    throw $_.Exception;
}
