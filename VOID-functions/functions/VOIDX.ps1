##############
# X / FAILED #
##############
function Invoke-VOIDX ([string]$message) {
	BEGIN {
		$WarningPreference = 'SilentlyContinue'
	}
	PROCESS {
    	[string]$mdashes = '-'*($message.Length)
		Invoke-VOIDT "<<<---------------------$mdashes->>>"
		Invoke-VOIDT "<<< OPERATION FAILED... $message >>>"
		Invoke-VOIDT "<<<---------------------$mdashes->>>"
	}
	END {
	}
}
