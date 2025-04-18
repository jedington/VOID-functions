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
		if ([bool](Get-Service mozilla*)) {Start-Process 'firefox' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}}
		}
	elseif (($browser -like 'micr*') -or ($browser -like '*edge')) {
		if ([bool](Get-Service microsoftedge*)) {Start-Process 'msedge' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}}
		}
	elseif (($browser -like 'goog*') -or ($browser -like 'chro*' )) {
		if ([bool](Get-Service googlechrome*)) {Start-Process 'chrome' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}}
		}
	elseif ($browser -like 'safari*') {
		if ([bool](Get-Service safari*)) {Start-Process 'safari' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}}
		}
	elseif ($browser -like 'opera*') {
		if ([bool](Get-Service opera*)) {Start-Process 'opera' $website}
		else {
			Invoke-VOIDX $invalid
			if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}}
		}
	else {
		if ($checkhttp) {Start-Process "https://$website"} else {Start-Process $website}
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'browser' -EA 0
	Remove-Variable -Name 'checkhttp' -EA 0
	Remove-Variable -Name 'invalid' -EA 0
	Remove-Variable -Name 'website' -EA 0
}
