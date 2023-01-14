# use this for updating releases of VOID-functions
# $modulepath for Core is: $env:USERPROFILE\Documents\PowerShell\Modules
# $modulepath for Framework is: $env:USERPROFILE\Documents\WindowsPowerShell\Modules
[string]$modulepath = $env:PSModulePath.Split(';')[0]
[string]$source = "$modulepath\VOID-functions\VOID-functions.psd1"
$manifest = Import-PowerShellDataFile $source
[version]$Version = $manifest.ModuleVersion
[version]$NewVersion = "{0}.{1}.{2}" -f $Version.Major, $Version.Minor, ($Version.Build + 1) 
Update-ModuleManifest -Path $source -ModuleVersion $NewVersion

##############
# CLEAR VARS #
##############
Remove-Variable -Name 'modulepath' -EA 0
Remove-Variable -Name 'source' -EA 0
Remove-Variable -Name 'manifest' -EA 0
Remove-Variable -Name 'Version' -EA 0
Remove-Variable -Name 'NewVersion' -EA 0
