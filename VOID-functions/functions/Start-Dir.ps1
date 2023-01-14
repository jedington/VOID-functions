<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#############################################
# START DIRECTORY -- KEEP IT SIMPLE, STUPID #
#############################################
function Start-Dir ([string]$path='.') {
	Invoke-Item $path
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'path' -EA 0
}
