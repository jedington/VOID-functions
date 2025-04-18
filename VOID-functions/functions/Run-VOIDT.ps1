<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

##################
# T / TYPEWRITER #
##################
function Invoke-VOIDT ([string]$message) {
	$mrandom = New-Object System.Random
	$message -split '' | ForEach-Object {
		Write-Host $_ -NoNewLine -ForegroundColor Magenta
		Start-Sleep -milliseconds $(0.05 + $mrandom.Next(6))
	}
	Write-Host ''
}
