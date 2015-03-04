## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for MSI installations
try {
    Get-WmiObject -Class Win32_Product | Where { $_.Name -eq 'AppV_Manage' } | ForEach-Object {
	    Uninstall-ChocolateyPackage -PackageName 'appvmanage' -FileType 'MSI' -SilentArgs "$($_.IdentifyingNumber) /qn /norestart"; 
    }
}
catch {
    throw $_.Exception;
}
