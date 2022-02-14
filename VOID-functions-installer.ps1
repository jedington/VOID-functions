<#
    .SYNOPSIS
        Installer script for 'VOID-functions'.
    .DESCRIPTION
        Installs:
            - 'VOID-functions' module, manifest, functions.
    .NOTES
        This most likely will not work in any PowerShell versions older than 5.
        Trying to make it flexible for Linux & MacOS later on.
#>

##########################################
# FORCE RUN SCRIPT AS ADMIN AND CONTINUE #
##########################################
param([switch]$elevated)
if (!($elevated)) {
    if ([bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
        Start-Process powershell.exe -Verb RunAs -ArgumentList (
            '-noprofile -noexit -file "{0}" -elevated' -f (
                $myinvocation.MyCommand.Definition
            )
        )    
    }
    else {
        Start-Process pwsh.exe -Verb RunAs -ArgumentList (
            '-noprofile -noexit -file "{0}" -elevated' -f (
                $myinvocation.MyCommand.Definition
            )
        )
    }
    exit
}

##################
# DEBUG SETTINGS #
##################
#- Set-StrictMode -Version Latest
$ErrorActionPreference = 'Continue'
$WarningPreference = 'SilentlyContinue'

####################################################################
# CREATE BLANK FOLDER FOR MODULE && WEB-SCRAPE GITHUB SCRIPT FILES #
####################################################################
$rawrepo = 'https://raw.githubusercontent.com/jedington/VOID-functions/master/VOID-functions'
$repo = 'https://github.com/jedington/VOID-functions/tree/master/VOID-functions/functions'
$modulepath = $env:PSModulePath.Split(';')[0]
$VOID = 'VOID-functions'
$module = 'VOID-functions.psm1'
$manifest = 'VOID-functions.psd1'
New-Item -ItemType Directory -Path $modulepath -Name 'VOID-functions' -Force


if ([bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0) -or [bool]($IsWindows)) {
    #- $frameworkPWSH = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    #- $corePWSH = "$env:USERPROFILE\Documents\PowerShell\Modules"
    New-Item -ItemType Directory -Path "$modulepath\VOID-functions" -Name 'functions' -Force
    $VOIDmodule = "$modulepath\$VOID\$module"
    $VOIDmanifest = "$modulepath\$VOID\$manifest"
    $VOIDfunctions = "$modulepath\$VOID\functions\"
}
else {
    #- $unixPWSH = "~/.local/share/powershell/Modules"
    New-Item -ItemType Directory -Path "$modulepath/VOID-functions" -Name 'functions' -Force
    $VOIDmodule = "$modulepath/$VOID/$module"
    $VOIDmanifest = "$modulepath/$VOID/$manifest"
    $VOIDfunctions = "$modulepath/$VOID/functions/"
}

Invoke-WebRequest -Uri "$rawrepo/$module" -OutFile $VOIDmodule
Invoke-WebRequest -Uri "$rawrepo/$manifest" -OutFile $VOIDmanifest

$functionslist = (Invoke-WebRequest $repo).Links | Where-Object href -like *.ps1 
foreach ($function in [array]($functionslist.href)) {
    $function = $function.TrimStart('/jedington/VOID-functions/blob/master/VOID-functions/functions/')
    $source = "$rawrepo/functions/$function"
    $destination = ($VOIDfunctions+$function)
    Start-BitsTransfer -source $source -destination $destination
    # 'Start-BitsTransfer' preferrable here as 'Invoke-WebRequest' has a file limit of 10
    #- Invoke-WebRequest $source -OutFile $destination
}

if (!(Get-Content $profile | Select-String 'Import-Module VOID-functions -DisableNameChecking' -EA 0)) {
    'Import-Module VOID-functions -DisableNameChecking' | Out-File $profile -Append -Encoding unicode -Force
}
 
Import-Module VOID-functions -DisableNameChecking

##############
# CLEAR VARS #
##############
Clear-Variable -Name 'rawrepo' -EA 0
Clear-Variable -Name 'repo' -EA 0
Clear-Variable -Name 'VOID' -EA 0
Clear-Variable -Name 'modulepath' -EA 0
Clear-Variable -Name 'module' -EA 0
Clear-Variable -Name 'manifest' -EA 0
Clear-Variable -Name 'VOIDmodule' -EA 0
Clear-Variable -Name 'VOIDmanifest' -EA 0
Clear-Variable -Name 'VOIDfunctions' -EA 0
Clear-Variable -Name 'functionslist' -EA 0
Clear-Variable -Name 'function' -EA 0
Clear-Variable -Name 'download' -EA 0
Clear-Variable -Name 'source' -EA 0
