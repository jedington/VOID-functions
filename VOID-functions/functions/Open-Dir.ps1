<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

############################################
# OPEN DIRECTORY -- KEEP IT SIMPLE, STUPID #
############################################
function Open-Dir ([string]$path='.') {
	Invoke-Item $path
}
