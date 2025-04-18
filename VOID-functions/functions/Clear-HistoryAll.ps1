<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

############################
# CLEAR POWERSHELL HISTORY #
############################
function Clear-HistoryAll {
    Get-PSReadLineOption | Select-Object -expand HistorySavePath | Remove-Item
    Clear-History
}
