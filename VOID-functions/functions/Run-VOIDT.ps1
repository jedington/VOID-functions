<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

##################
# T / TYPEWRITER #
##################
function Invoke-VOIDT ([string]$message) {
	$Random = New-Object System.Random
	$message -split '' | ForEach-Object {
		Write-Host $_ -NoNewLine -ForegroundColor Magenta
		Start-Sleep -milliseconds $(0.1 + $Random.Next(6))
	}
	Write-Host ''
	Clear-Variable -Name 'message' -EA 0
}
