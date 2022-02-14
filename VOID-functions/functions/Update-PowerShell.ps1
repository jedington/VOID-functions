<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

##########################
# UPDATE POWERSHELL CORE #
##########################
function Update-PowerShell {
	$answeryn = Invoke-VOIDYN 'Install / Update PowerShell Core?'
	if ($answeryn -eq $true) {
		if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -like 5.* -EA 0)) {
			iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
		}
		else {
			& bash "wget https://aka.ms/install-powershell.sh; 
					sudo bash install-powershell.sh; 
					rm install-powershell.sh; 
					pwsh"
		}
		Invoke-VOIDX 'PAUSED... <ENTER> WHEN READY TO CONTINUE'
		Read-Host		
	}
}
