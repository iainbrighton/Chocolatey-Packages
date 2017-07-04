## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for MSI installations
try {
    Get-CimInstance -Class Win32_Product |
        Where { $_.Name -eq 'Nitro Reader 5' } |
            ForEach-Object {
                $uninstallChocolateyPackageParams = @{
                    PackageName    = 'nitroreader.install';
                    FileType       = 'MSI';
                    SilentArgs     = "$($_.IdentifyingNumber) /qn /norestart"
                    ValidExitCodes = @(0,3010); 
                }
                Uninstall-ChocolateyPackage @$uninstallChocolateyPackageParams;
            }
}
catch {
    throw $_.Exception;
}
