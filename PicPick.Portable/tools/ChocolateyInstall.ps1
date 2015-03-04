## Template VirtualEngine.Build ChocolateyInstall.ps1 file for Zip-based portable installations
try {
    $packageToolsPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent;
    $packageRootPath = Split-Path -Path $packageToolsPath -Parent;
    $packageContentPath = Join-Path -Path $packageRootPath -ChildPath 'Content';
    [Ref] $null = New-Item -Path $packageContentPath -ItemType Directory;
    foreach ($exe in (@('picpick.exe','cloudexplorer.exe'))) {
        $exePath = Join-Path -Path $packageContentPath -ChildPath "$exe.gui";
        [Ref] $null = New-Item -Path $exePath -ItemType File -Force;
    }
    Install-ChocolateyZipPackage 'PicPick.Portable' 'http://www.nteworks.com/latestdownload/picpick_portable.zip' "$packageContentPath";
}
catch {
    throw $_.Exception;
};
