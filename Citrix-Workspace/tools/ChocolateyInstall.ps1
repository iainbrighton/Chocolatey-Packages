## Template VirtualEngine.Build ChocolateyInstall.ps1 file for EXE/MSI installations

$citrixWorkspaceAppVersion = '1904.1'
<# Citrix change the download URL after a new version is released. Here we grab the latest download link from the RSS feed. #>
Write-Host "Resolving Citrix Workspace app $citrixWorkspaceAppVersion download link.."
$rssFeedUri = 'https://www.citrix.com/content/citrix/en_us/downloads/workspace-app.rss'
$rssFeedWebResponse = (New-Object -TypeName System.Net.WebClient).DownloadString($rssFeedUri)
$feed = [System.Xml.XmlDocument] $rssFeedWebResponse
$releaseUri = $feed.rss.channel.item |
                Where-Object { $_.Title -eq "New - Citrix Workspace app $citrixWorkspaceAppVersion for Windows" } |
                    Select-Object -ExpandProperty link

$htmlAgilityPackPath = '{0}\HtmlAgilityPack.dll' -f (Split-Path -Path $MyInvocation.MyCommand.Path)
$null = [System.Reflection.Assembly]::LoadFrom($htmlAgilityPackPath)

<# Citrix sign the download link via Javascript so we have to parse the page to get the signed download Uri. #>
Write-Host "Resolving Citrix Workspace app $citrixWorkspaceAppVersion download token.."
$releaseUriWebResponse = (New-Object -TypeName System.Net.WebClient).DownloadString($releaseUri)
$htmlDocument = New-Object -TypeName 'HtmlAgilityPack.HtmlDocument'
$htmlDocument.LoadHtml($releaseUriWebResponse)
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
    Checksum       = "1DA12FCFE95944693C9628C2CF3349102717317D3BFFDEDDF7384087383BA430";
    ChecksumType   = "sha256";
}
Install-ChocolateyPackage @installChocolateyPackageParams;

<#! POST-INSTALL-TASKS !#>
