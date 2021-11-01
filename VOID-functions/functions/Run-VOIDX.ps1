<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

############
# X / DASH #
############
function Invoke-VOIDX ([string]$message) {
	Write-Host ''
	[string]$mdashes = '-'*($message.Length)
	Invoke-VOIDT "<<<-$mdashes->>>"
	Invoke-VOIDT "<<< $message >>>"
	Invoke-VOIDT "<<<-$mdashes->>>"
	Write-Host ''
	##############
	# CLEAR VARS #
	##############
	Clear-Variable -Name 'message' -EA 0
	Clear-Variable -Name 'mdashes' -EA 0
}
