<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

# works on only files for now; folders will be ignored
function Start-ShredMultiple ([string]$dirpath) {
	if (!($dirpath)) {
		Invoke-VOIDX 'USAGE: Start-ShredMultiple <DIRPATH>'
	}
	else {
		Add-Type -AssemblyName Microsoft.VisualBasic
		[array]$items = Get-ChildItem -Path $dirpath -Force | ForEach-Object { $_.FullName }
		foreach ($item in $items) {
			if (Test-Path -Path $item -PathType Container) {
				Start-ShredMultiple $item
			    Get-Item -Path $item -Force | Remove-Item -Recurse -EA 0 -Verbose
			}
			else {
			    Start-ShredFile $item
			}
		}
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'dirpath' -EA 0
	Remove-Variable -Name 'items' -EA 0
}
