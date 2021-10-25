<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

##########################
# UPDATE POWERSHELL CORE #
##########################
function Update-PowerShell {
	$updateyn = Invoke-VOIDYN 'Install / Update PowerShell Core?'
	if ($updateyn -eq $true) {
		if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -like 5.* -EA 0)) {
			iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
		}
		else {
			& bash "wget https://aka.ms/install-powershell.sh; 
					sudo bash install-powershell.sh; 
					rm install-powershell.sh"
		}
		Invoke-VOIDT '<<<------------------------------------------>>>'
		Invoke-VOIDT '<<< PAUSED... <ENTER> WHEN READY TO CONTINUE >>>'
		Invoke-VOIDT '<<<------------------------------------------>>>'
		Read-Host
		
	}
}