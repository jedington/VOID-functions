<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#########################################################
# START BROWSER / A BIT UGLY ATM, DUE TO OPTIMIZE LATER #
#########################################################
function Start-Browser ([string] $browser, [string] $website='github.com') {
	$checkhttp = $website -notlike 'http*://*'
	$invalid = 'BROWSER INVALID / DEFERRING TO DEFAULT'

	if (($browser -like 'fire*') -or ($browser -like '*fox')) {
		if ([bool](Get-Service mozilla*)) {start 'firefox' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {start "https://$website"} else {start $website}}
		}
	elseif (($browser -like 'micr*') -or ($browser -like '*edge')) {
		if ([bool](Get-Service microsoftedge*)) {start 'msedge' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {start "https://$website"} else {start $website}}
		}
	elseif (($browser -like 'goog*') -or ($browser -like 'chro*' )) {
		if ([bool](Get-Service googlechrome*)) {start 'chrome' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {start "https://$website"} else {start $website}}
		}
	elseif ($browser -like 'safari*') {
		if ([bool](Get-Service safari*)) {start 'safari' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {start "https://$website"} else {start $website}}
		}
	elseif ($browser -like 'opera*') {
		if ([bool](Get-Service opera*)) {start 'opera' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {start "https://$website"} else {start $website}}
		}
	else {
		$website = $browser
		if ($checkhttp) {start "https://$website"} else {start $website}
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'browser' -EA 0
	Remove-Variable -Name 'website' -EA 0
	Remove-Variable -Name 'invalid' -EA 0
	Remove-Variable -Name 'checkhttp' -EA 0
}
