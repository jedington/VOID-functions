<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

###############################
# CLEAR RECYCLE BIN (WINDOWS) #
###############################
function Clear-RecycleBin {
	$answeryn = Invoke-VOIDYN 'Are you sure you want to clear the Recycle Bin?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0))) {
		# Still testing; RecycleBin is a bit difficult as it will always have lingering 'ChildItem' Objects
		# Start-ShredMultiple 'C:\$Recycle.Bin'
		Get-ChildItem -Path 'C:\$Recycle.Bin' -Force | Remove-Item -Recurse -EA 0
	}
	elseif ([bool]($IsLinux) -or [bool]($IsMacOS)) {
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