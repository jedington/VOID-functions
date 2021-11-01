<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

################
# START GOOGLE #
################
function Start-Google ([string]$search='foundation') {
	Start-Process "https://www.google.com/search?q=$search"
	##############
	# CLEAR VARS #
	##############
	Clear-Variable -Name 'search' -EA 0
}
