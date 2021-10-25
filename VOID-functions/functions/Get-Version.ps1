<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

###############
# GET VERSION #
###############
function Get-Version {
    [string]$psversion = $($PSVersionTable.PSVersion)
    Invoke-VOIDX "PowerShell Version: $psversion"
}
