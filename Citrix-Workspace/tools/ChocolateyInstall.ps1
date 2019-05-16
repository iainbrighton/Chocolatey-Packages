## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$releaseUri = 'https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows/workspace-app-for-windows-1903.html'
$htmlAgilityPackPath = '{0}\HtmlAgilityPack.dll' -f (Split-Path -Path $MyInvocation.MyCommand.Path)
$null = [System.Reflection.Assembly]::LoadFrom($htmlAgilityPackPath)
Write-Host 'Resolving download link..'
$webResponse = (New-Object -TypeName System.Net.WebClient).DownloadString($releaseUri)
$htmlDocument = New-Object -TypeName 'HtmlAgilityPack.HtmlDocument'
$htmlDocument.LoadHtml($webResponse)
$relativeUri = $htmlDocument.DocumentNode.SelectNodes('//a') |
    ForEach-Object { $_.Attributes } |
        Where-Object { $_.Value -match 'CitrixWorkspaceApp.exe' } |
            Select-Object -ExpandProperty Value
$downloadUri = 'https:{0}' -f $relativeUri

$installChocolateyPackageParams = @{
    PackageName    = "Citrix-Workspace";
    FileType       = "EXE";
    SilentArgs     = "/noreboot /silent";
    Url            = "$downloadUri";
    ValidExitCodes = @(0,3010);
    Checksum       = "086DBE728BFBA427D1DF28C3A7ADEB072CD3878758084A547879759EE36064B5";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
