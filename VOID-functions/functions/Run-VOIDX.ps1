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
	Remove-Variable -Name 'message' -EA 0
	Remove-Variable -Name 'mdashes' -EA 0
}
