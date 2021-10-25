<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

###############
# GET VERSION #
###############
function Get-Version {
	Write-Host ''
    [string]$psversion = $($PSVersionTable.PSVersion)
    [string]$psvdashes = '-'*($psversion.Length)
    Invoke-VOIDT "<<<---------------------$psvdashes->>>"
	Invoke-VOIDT "<<< PowerShell Version: $psversion >>>"
    Invoke-VOIDT "<<<---------------------$psvdashes->>>"
}
