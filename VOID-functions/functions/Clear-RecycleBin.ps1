<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

function Clear-RecycleBin {
	#- $answershred = VOID-YN 'Would you like to shred the items in the Recycle Bin instead?'
	# Still testing; RecycleBin is a bit difficult as it will always have 4 'ChildItem' Objects.
	#- 	if ([bool]($answershred)) {
	#- 		$dirpath = Get-ChildItem -Path 'C:\$Recycle.Bin' -Force
	#- 		Start-ShredMultiple $dirpath
	#- 	}
	$answeryn = VOID-YN 'Are you sure you want to clear the Recycle Bin?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | 
		Where-Object PSVersion -le 5 -EA 0))) {
		Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -EA 0
	}
	elseif ([bool]($answeryn) -and ([bool]($IsLinux) -or [bool]($IsMacOS))) {
		Invoke-VOIDX 'WINDOWS ONLY...'
	}
}