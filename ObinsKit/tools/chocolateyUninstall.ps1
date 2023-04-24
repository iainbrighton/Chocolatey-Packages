$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName

[array]$key = Get-UninstallRegistryKey -SoftwareName 'ObinsKit*'

if ($key.Count -eq 1) {
  $key | ForEach-Object {
  $pattern = '(^".*?")'
  $match = [regex]::Match($_.UninstallString, $pattern)
  $filepathWithQuotations = $match.Groups[1].Value
  $packageArgs = @{
    packageName    = $packageName
    fileType       = 'EXE'
    silentArgs     = '/allusers /S'
    validExitCodes = @(0)
    file           = $filepathWithQuotations
  }

    Uninstall-ChocolateyPackage @packageArgs
  }

} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {

  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $($_.DisplayName)"}
}