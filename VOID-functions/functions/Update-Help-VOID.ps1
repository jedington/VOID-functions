<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

########################
# UPDATE HELP SILENTLY #
########################
function Update-Help-VOID {
	# Save-Help -DestinationPath "$Env:UserProfile\Documents\PowerShell\Help"
	# Update-Help -SourcePath "$Env:UserProfile\Documents\PowerShell\Help"
	Start-Job -Name "UpdateHelp" -ScriptBlock { 
		Update-Help -Force -Verbose -EA 0 -UICulture en-US  
	} | Out-Null
	Invoke-VOIDT '<<<-------------------------------->>>'
	Invoke-VOIDT '<<< UPDATING HELP IN BACKGROUND... >>>'
	Invoke-VOIDT '<<<-------------------------------->>>'
}