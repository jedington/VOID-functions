<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

##################################
# START POWERSHELL CORE AS ADMIN #
##################################
function Start-PowerShellCore-AsAdmin ([string]$value='.') {
	if ([bool]($PSVersionTable | Where-Object PSVersion -like 7.2* -EA 0)) {
		Start-Process pwsh -Verb RunAs
	}
	elseif ([bool]($IsCoreCLR) -or [bool]($PSVersionTable | Where-Object PSVersion -le 7 -EA 0)) {
		Invoke-VOIDX 'POWERSHELL CORE UPDATE AVAILABLE'
		Update-PowerShell
		Start-Process pwsh -Verb RunAs
	}
	elseif ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		if (!(Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
			Where-Object DisplayName -like "PowerShell*")) {
			Invoke-VOIDX 'POWERSHELL CORE NOT FOUND'
			Update-PowerShell
		}
		Start-Process pwsh -Verb RunAs
	}
	else {
		Invoke-VOIDX 'OPERATION FAILED... CANT ESCALATE TO ADMIN'
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'value' -EA 0
}
