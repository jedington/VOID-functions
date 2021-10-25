<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

#################################
# OPEN POWERSHELL CORE AS ADMIN #
#################################
function Open-PowerShellCore-AsAdmin ([string]$value='.') {
	if ([bool]($PSVersionTable | Where-Object PSVersion -like 7.1* -EA 0)) {
		Start-Process pwsh -Verb RunAs
	}
	elseif ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
		if (!(Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
			Where-Object DisplayName -like "PowerShell*")) {
			Invoke-VOIDT '<<<--------------------------->>>'
			Invoke-VOIDT '<<< POWERSHELL CORE NOT FOUND >>>'
			Invoke-VOIDT '<<<--------------------------->>>'
			Update-PowerShell
		}
		Start-Process pwsh -Verb RunAs
	}
	elseif ([bool]($IsCoreCLR) -or [bool]($PSVersionTable | Where-Object PSVersion -le 7 -EA 0)) {
		Invoke-VOIDT '<<<---------------------------------->>>'
		Invoke-VOIDT '<<< POWERSHELL CORE UPDATE AVAILABLE >>>'
		Invoke-VOIDT '<<<---------------------------------->>>'
		Update-PowerShell
		Start-Process pwsh -Verb RunAs
	}
	else {
		Invoke-VOIDX 'CANT ESCALATE TO ADMIN'
	}
}
