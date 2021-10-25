<#
    .SYNOPSIS
        Module, as stated in the name, it's functions.
    .DESCRIPTION
		A Module of example functions while I am learning PowerShell.
		Many of these functions are very elementary in capability or scope. 
		None of this is advanced, so do not expect this module to be practical.
    .NOTES
		This most likely will not work in any PowerShell versions older than 5.
		High odds this script will be buggy for anything not Windows!
		Trying to make it flexible for Linux & MacOS later on.
#>

##################
# DEBUG SETTINGS #
##################
#- Set-StrictMode -Version Latest
#- $ErrorActionPreference = 'Inquire'
$WarningPreference = 'SilentlyContinue'

####################################
# DYNAMIC IMPORT OF FUNCTION FILES #
####################################
if ([bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
    $winPWSH = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    $VOIDfunctions = "$winPWSH\VOID-functions\functions\"
}
elseif ([bool]($IsWindows)) {
    $corePWSH = "$env:USERPROFILE\Documents\PowerShell\Modules"
    $VOIDfunctions = "$corePWSH\VOID-functions\functions\"
}
else {
    $otherPWSH = "/usr/local/share/powershell/Modules"
    $VOIDfunctions = "$otherPWSH/VOID-functions/functions/"
}

[array]$functionslist = Get-ChildItem -path $VOIDfunctions -name
foreach ($function in $functionslist) {
    . ($VOIDfunctions + $function)
}

###########
# WELCOME #
###########
Invoke-VOIDX "WELCOME $env:USERNAME"

# Export-ModuleMember -function '*' -variable '*'