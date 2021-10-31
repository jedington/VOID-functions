<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#####################################
# START WINDOWS POWERSHELL AS ADMIN #
#####################################
function Start-PowerShellWindows-AsAdmin ([string]$value='.') {
	if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		# (Get-Host).Version | Where-Object Major -le 5 -EA 0)
		Start-Process powershell -Verb RunAs
	}
	else {
    	Invoke-VOIDX 'OPERATION FAILED... WINDOWS POWERSHELL NOT FOUND'
	}
	Clear-Variable -Name 'value' -EA 0
}
