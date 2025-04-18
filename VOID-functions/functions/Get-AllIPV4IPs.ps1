<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#######################
# GET PRIMARY HOST IP #
#######################
function Get-AllIPV4IPs {
	if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		$AllIPV4IPs = [string](
			ipconfig | Select-String (
				'(\s)+IPv4.+\s(?<IP>(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))(\s)*'
			) -AllMatches | ForEach-Object {$_.Matches} | ForEach-Object {$_.Groups['IP']} | ForEach-Object {$_.Value}
		)
	}
	else {
		$AllIPV4IPs = [string](
			ifconfig | Select-String (
				'(\s)+IPv4.+\s(?<IP>(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}))(\s)*'
			) -AllMatches | ForEach-Object {$_.Matches} | ForEach-Object {$_.Groups['IP']} | ForEach-Object {$_.Value}
		)
	}
	if ([bool]($AllIPV4IPs)) {
		$AllIPV4IPs.Split()
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... NO IPV4 IP FOUND.'
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'AllIPV4IPs' -EA 0
}
