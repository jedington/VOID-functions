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
		Write-Host ''
		[string]$pridashes = '-'*($primaryip.Length)
    	Invoke-VOIDT "<<<------------------$pridashes->>>"
    	Invoke-VOIDT "<<< PRIMARY HOST IP: $primaryip >>>"
    	Invoke-VOIDT "<<<------------------$pridashes->>>"
	}
	else {
		Invoke-VOIDX 'UNKNOWN PROBLEM'
	}
}