# use this for updating releases of the module & manifest
# $modulepath for Core is: $env:USERPROFILE\Documents\PowerShell\Modules
# $modulepath for Framework is: $env:USERPROFILE\Documents\WindowsPowerShell\Modules
$modulepath = $env:PSModulePath.Split(';')[0]
$source = "$modulepath\VOID-functions\VOID-functions.psd1"
$manifest = Import-PowerShellDataFile "$modulepath\VOID-functions\VOID-functions.psd1"
[version]$Version = $manifest.ModuleVersion
[version]$NewVersion = "{0}.{1}.{2}" -f $Version.Major, $Version.Minor, ($Version.Build + 1) 
Update-ModuleManifest -Path $source -ModuleVersion $NewVersion