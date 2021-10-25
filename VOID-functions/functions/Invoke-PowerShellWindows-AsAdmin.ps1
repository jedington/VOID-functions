<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

####################################
# OPEN WINDOWS POWERSHELL AS ADMIN #
####################################
function Open-PowerShellWindows-AsAdmin ([string]$value='.') {
	if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		# (Get-Host).Version | Where-Object Major -le 5 -EA 0)
		Start-Process powershell -Verb RunAs
	}
	else {
		Invoke-VOIDT '<<<--------------------------------->>>'
		Invoke-VOIDT '<<< WINDOWS POWERSHELL NOT FOUND... >>>'
		Invoke-VOIDT '<<<--------------------------------->>>'
	}
}
