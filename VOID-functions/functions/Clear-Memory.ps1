<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################################
# CLEAR SYSTEM MEMORY (WINDOWS) #
#################################
function Clear-Memory {
	if ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0)) {
        Invoke-VOIDX "Memory used before cleanup: $([System.GC]::GetTotalMemory($false))"  
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        [System.GC]::Collect()
        Invoke-VOIDX "Memory used after cleanup: $([System.GC]::GetTotalMemory($true))"
    }
	elseif ([bool]($IsLinux) -or [bool]($IsMacOS)) {
		Invoke-VOIDX 'WINDOWS ONLY...'
	}
    else {
        Invoke-VOIDX 'OPERATION CANCELLED'
    }
}