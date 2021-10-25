######################
# YN / YES/NO PROMPT #
######################
function Invoke-VOIDYN ([string]$input) {
	BEGIN {
		$WarningPreference = 'SilentlyContinue'
	}
	PROCESS {
		Invoke-VOIDT '<<<-------------->>>'
		Invoke-VOIDT '<<< [Y]ES / [N]O >>>'
		Invoke-VOIDT '<<<-------------->>>'
		$answeryn = Read-Host $input
		while ('[y]es','[n]o','yes','no','y','n' -notcontains $answeryn) {
			Invoke-VOIDT '<<<-------------->>>'
			Invoke-VOIDT '<<< TRY AGAIN... >>>'
			Invoke-VOIDT '<<<-------------->>>'
			Invoke-VOIDT '<<< [Y]ES / [N]O >>>'
			Invoke-VOIDT '<<<-------------->>>'
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
	END {
	}
}
