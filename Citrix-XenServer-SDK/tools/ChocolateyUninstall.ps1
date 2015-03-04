## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for MSI installations
try {
    Get-WmiObject -Class Win32_Product | Where { $_.Name -eq 'Citrix XenServerPSSnapin' } | ForEach-Object {
	    Uninstall-ChocolateyPackage -PackageName 'Citrix-XenServer-SDK' -FileType 'MSI' -SilentArgs "$($_.IdentifyingNumber) /qn /norestart"; 
    }
}
catch {
    throw $_.Exception;
}
