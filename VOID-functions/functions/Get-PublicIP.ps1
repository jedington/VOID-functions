<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

#################
# GET PUBLIC IP #
#################
function Get-PublicIP {
	$publicip = [string](Invoke-WebRequest -Uri 'http://ifconfig.me/ip')
	if ([bool]($publicip)) {
		Write-Host ''
		[string]$ipdashes = '-'*($publicip.Length)
    	Invoke-VOIDT "<<<------------$ipdashes->>>"
    	Invoke-VOIDT "<<< PUBLIC IP: $publicip >>>"
    	Invoke-VOIDT "<<<------------$ipdashes->>>"	
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... CHECK NET CONNECTION'
	}
}	
