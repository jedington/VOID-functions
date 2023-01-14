<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#############################
# GET RECYCLE BIN (WINDOWS) #
#############################
function Clear-RecycleBin {
	$answeryn = Invoke-VOIDYN 'Are you sure you want to clear the Recycle Bin?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | 
		Where-Object PSVersion -le 5 -EA 0))) {
		Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -EA 0 -Verbose
	}
	elseif ([bool]($answeryn) -and ([bool]($IsLinux) -or [bool]($IsMacOS))) {
		Invoke-VOIDX 'WINDOWS ONLY...'
	}
	else {
        Invoke-VOIDX 'OPERATION CANCELLED'
    }
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'answeryn' -EA 0
}