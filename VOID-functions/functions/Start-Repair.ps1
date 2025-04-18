<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

################
# START REPAIR #
################
function Start-Repair {
	Invoke-VOIDT 'Will run through a series of Windows utilities to repair common errors and problems...'
	$answeryn = Invoke-VOIDYN 'Works on Windows only and you must run PowerShell with elevated permissions... Continue?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0))) {
		# chkdsk /r
		sfc /scannow
		# dism /online /cleanup-image /checkhealth
		# dism /online /cleanup-image /scanhealth
		dism /online /cleanup-image /restorehealth
		sfc /scannow
		ipconfig /release
		ipconfig /renew
		ipconfig /flushdns
		gpupdate /force
		powercfg -h off
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
