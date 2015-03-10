## Template VirtualEngine.Build ChocolateyUninstall.ps1 file for MSI installations
try {
    Get-WmiObject -Class Win32_Product | Where { $_.Name -eq 'App-V 5 Configuration Editor' } | ForEach-Object {
	    Uninstall-ChocolateyPackage -PackageName 'ACE' -FileType 'MSI' -SilentArgs "$($_.IdentifyingNumber) /qn /norestart" -ValidExitCodes @(0,3010); 
    }
}
catch {
    throw $_.Exception;
}
