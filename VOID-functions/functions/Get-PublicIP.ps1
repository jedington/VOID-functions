<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################
# GET PUBLIC IP #
#################
function Get-PublicIP {
	$publicip = [string](Invoke-WebRequest -Uri 'http://ifconfig.me/ip').Content
	if ([bool]($publicip)) {
    	Invoke-VOIDX "PUBLIC IP: $publicip"
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... CHECK NET CONNECTION'
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'publicip' -EA 0
}	
