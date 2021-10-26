<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

###############
# OPEN GOOGLE #
###############
function Open-Google ([string]$search='foundation') {
	Start-Process "https://www.google.com/search?q=$search"
}
