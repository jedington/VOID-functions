<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#########
# UNZIP #
#########
function Start-Unzip ([string]$file) {
    $dirname = (Get-Item $file).Basename
    echo("Extracting", $file, "to", $dirname)
    New-Item -Force -ItemType directory -Path $dirname
    Expand-Archive $file -DestinationPath $dirname
    ##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'file' -EA 0
	Remove-Variable -Name 'dirname' -EA 0
}