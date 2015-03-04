## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for MSI installations
try {
    Get-WmiObject -Class Win32_Product | Where { $_.Name -eq 'Virtual Engine Toolkit' } | ForEach-Object {
	    Uninstall-ChocolateyPackage -PackageName 'VET' -FileType 'MSI' -SilentArgs "$($_.IdentifyingNumber) /qn /norestart"; 
    }
}
catch {
    throw $_.Exception;
}
