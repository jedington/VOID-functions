<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

####################
# GET ALL HOST IPS #
####################
function Get-AllHostIPs {
	$allhostips = [string](
		Get-NetIPAddress | Where-Object {
			$_.AddressState -eq 'Preferred' -and $_.ValidLifetime -lt '24:00:00'
		}
	).IPAddress	
	if ([bool]($allhostips)) {
    	$allhostips.Split()
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... UNKNOWN PROBLEM'
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'allhostips' -EA 0
}
