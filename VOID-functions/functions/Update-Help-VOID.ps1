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
	Invoke-VOIDX 'UPDATING HELP IN BACKGROUND...'
}