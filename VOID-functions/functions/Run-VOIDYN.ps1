<#
	.SYNOPSIS
    .DESCRIPTION
    .NOTES
#>

######################
# YN / YES/NO PROMPT #
######################
function Invoke-VOIDYN ([string]$input) {
	Invoke-VOIDX '[Y]ES / [N]O'
	$answeryn = Read-Host $input
	while ('[y]es','[n]o','yes','no','y','n' -notcontains $answeryn) {
		Invoke-VOIDX 'TRY AGAIN... [Y]ES / [N]O'
		$answeryn = Read-Host $input
	}
	switch ($answeryn) {
		'[y]es'	{return $true}
		'yes'	{return $true}
		'y'		{return $true}
		'[n]o'	{return $false}
		'no'	{return $false}
		'n'		{return $false}
	}
}
