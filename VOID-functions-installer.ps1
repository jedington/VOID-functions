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
$VOID = 'VOID-functions'
$module = 'VOID-functions.psm1'
$manifest = 'VOID-functions.psd1'

if ([bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
    $winPWSH = "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    New-Item -ItemType Directory -Path $winPWSH -Name 'VOID-functions' -Force
    New-Item -ItemType Directory -Path "$winPWSH\VOID-functions" -Name 'functions' -Force
    $VOIDmodule = "$winPWSH\$VOID\$module"
    $VOIDmanifest = "$winPWSH\$VOID\$manifest"
    $VOIDfunctions = "$winPWSH\$VOID\functions\"
}
elseif ([bool]($IsWindows)) {
    $corePWSH = "$env:USERPROFILE\Documents\PowerShell\Modules"
    New-Item -ItemType Directory -Path $corePWSH -Name 'VOID-functions' -Force
    New-Item -ItemType Directory -Path "$corePWSH\VOID-functions" -Name 'functions' -Force
    $VOIDmodule = "$corePWSH\$VOID\$module"
    $VOIDmanifest = "$corePWSH\$VOID\$manifest"
    $VOIDfunctions = "$corePWSH\$VOID\functions\"
}
else {
    $otherPWSH = "/usr/local/share/powershell/Modules"
    New-Item -ItemType Directory -Path $otherPWSH -Name 'VOID-functions' -Force
    New-Item -ItemType Directory -Path "$otherPWSH/VOID-functions" -Name 'functions' -Force
    $VOIDmodule = "$otherPWSH/$VOID/$module"
    $VOIDmanifest = "$otherPWSH/$VOID/$manifest"
    $VOIDfunctions = "$otherPWSH/$VOID/functions/"
}

Invoke-WebRequest -Uri "$rawrepo/$module" -OutFile $VOIDmodule
Invoke-WebRequest -Uri "$rawrepo/$manifest" -OutFile $VOIDmanifest

$repo = 'https://github.com/jedington/VOID-functions/tree/master/VOID-functions/functions'
$functionslist = (Invoke-WebRequest $repo).Links | Where-Object href -like *.ps1 
foreach ($function in [array]($functionslist.href)) {
    $function = $function.TrimStart('/jedington/VOID-functions/blob/master/VOID-functions/functions/')
    $download = ($VOIDfunctions+$function)
    $source = "$rawrepo/functions/$function"
    Start-BitsTransfer -source $source -destination $download
    # 'Start-BitsTransfer' preferrable (particularly here) as 'Invoke-WebRequest' has a limit of 10
    #- Invoke-WebRequest "$rawrepo/functions/$function" -OutFile $download
}

if (!(Get-Content $profile | Select-String 'Import-Module VOID-functions -DisableNameChecking')) {
    'Import-Module VOID-functions -DisableNameChecking' | Out-File $profile -Append -Encoding unicode -Force
}
 
Import-Module VOID-functions -DisableNameChecking