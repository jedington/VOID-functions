<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#######################
# GET PRIMARY HOST IP #
#######################
function Get-PrimaryIP {
	$primaryip = [string](
		Get-NetIPAddress | Where-Object {
			$_.AddressState -eq 'Preferred' -and $_.ValidLifetime -lt '24:00:00'
		}
	).IPAddress	
	if ([bool]($primaryip)) {
    	Invoke-VOIDX "PRIMARY HOST IP: $primaryip"
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... UNKNOWN PROBLEM'
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'primaryip' -EA 0
}
