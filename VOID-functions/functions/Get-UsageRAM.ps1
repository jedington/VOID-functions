<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################
# Get RAM Usage #
#################
function Get-UsageRAM {
	$systemInfo = Get-CimInstance win32_operatingsystem -EA 0
	$totalRAM = (Get-CimInstance win32_physicalmemory | 
	    Measure-Object -property Capacity -Sum).Sum / 1MB
	$freeRAM = $systemInfo.FreePhysicalMemory / 1KB
	$currentRAM = $totalRAM - $freeRAM
	$currentRAMpct = $currentRAM * 100 / $totalRAM
	Write-Host (@{'Current RAM%' = [string]([math]::Round($currentRAMpct)) + ' %'
		} | Out-String
	) -f Magenta
	Write-Host (@{'Current / Total RAM' = [string]($currentRAM) + ' / ' + [string]($totalRAM) + ' MBs'
		} | Out-String
	) -f Magenta
	##############
	# CLEAR VARS #
	##############
	Clear-Variable -Name 'systemInfo' -EA 0
	Clear-Variable -Name 'totalRAM' -EA 0
	Clear-Variable -Name 'freeRAM' -EA 0
	Clear-Variable -Name 'currentRAM' -EA 0
	Clear-Variable -Name 'currentRAMpct' -EA 0
}
