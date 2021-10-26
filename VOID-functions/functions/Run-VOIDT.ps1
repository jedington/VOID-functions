<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

##################
# T / TYPEWRITER #
##################
function Invoke-VOIDT ([string]$typewrite) {
	$Random = New-Object System.Random
	$typewrite -split '' | ForEach-Object {
		Write-Host $_ -NoNewLine -ForegroundColor Magenta
		Start-Sleep -milliseconds $(0.1 + $Random.Next(6))
	}
	Write-Host ''
}
