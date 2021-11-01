<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

# works on only files for now; folders will be ignored
function Start-ShredMultiple ([string]$dirpath) {
	if (!($dirpath)) {
		Invoke-VOIDX 'USAGE: <DIRPATH>; FILES NEED TO BE IN THE SAME FOLDER'
	}
	else {
		$dirpathcount = (Get-ChildItem -Path $dirpath -Force).Count
		while ($dirpathcount -ge 1) {
			[string]$filepath = Get-ChildItem -Path $dirpath -Force | Select-Object -first 1
			Start-ShredFile $filepath
			$dirpathcount = (Get-ChildItem -Path $dirpath -Force).Count
		}
		##############
		# CLEAR VARS #
		##############
		Clear-Variable -Name 'dirpath' -EA 0		
		Clear-Variable -Name 'dirpathcount' -EA 0		
	}
}
