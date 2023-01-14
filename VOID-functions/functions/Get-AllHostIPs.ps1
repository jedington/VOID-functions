<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

####################
# GET ALL HOST IPS #
####################
function Get-AllHostIPs {
	if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		$allhostips = [string](
			ipconfig | Select-String (
				'(\s)+IPv4.+\s(?<IP>(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))(\s)*'
			) -AllMatches | % {$_.Matches} | % {$_.Groups['IP']} | % {$_.Value}
		)
	}
	else {
		$allhostips = [string](
			ifconfig | Select-String (
				'(\s)+IPv4.+\s(?<IP>(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))(\s)*'
			) -AllMatches | % {$_.Matches} | % {$_.Groups['IP']} | % {$_.Value}
		)
	}
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
