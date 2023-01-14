<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

######################
# YN / YES/NO PROMPT #
######################
function Invoke-VOIDYN ([string]$message) {
	Invoke-VOIDX '[Y]ES / [N]O'
	$answeryn = Read-Host $message
	while ('[y]es','[n]o','yes','no','y','n' -notcontains $answeryn) {
		Invoke-VOIDX 'TRY AGAIN... [Y]ES / [N]O'
		$answeryn = Read-Host $message
	}
	switch ($answeryn) {
		'[y]es'	{return $true}
		'yes'	{return $true}
		'y'		{return $true}
		'[n]o'	{return $false}
		'no'	{return $false}
		'n'		{return $false}
	}
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'message' -EA 0
	Remove-Variable -Name 'answeryn' -EA 0
}
