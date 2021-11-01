<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################
# Get CPU Usage #
#################
function Invoke-VOIDX ([string]$message) {
	$totalCPU = Get-CimInstance win32_processor |
	    Measure-Object MaxClockSpeed -Maximum | Select-Object -expand Maximum
	$currentCPUpct = Get-CimInstance win32_processor |
	    Measure-Object LoadPercentage -Average | Select-Object -expand Average
	$currentCPU = $totalCPU * $currentCPUpct / 100
	Write-Host (@{'Current CPU%' = [string]($currentCPUpct) + ' %'
		} | Out-String
	) -f Magenta
	Write-Host (@{'Current / Total CPU' = [string]($currentCPU) + ' / ' + [string]($totalCPU) + ' MBs'
		} | Out-String
	) -f Magenta
	##############
	# CLEAR VARS #
	##############
	Clear-Variable -Name 'totalCPU' -EA 0
	Clear-Variable -Name 'currentCPU' -EA 0
	Clear-Variable -Name 'currentCPUpct' -EA 0
}
