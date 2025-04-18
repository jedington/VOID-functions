<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#########################################
# CLEAR TEMP AND CACHED FILES (WINDOWS) #
#########################################
function Clear-TempFiles {
	Invoke-VOIDT 'Will clear all temp files and cache...'
	$answeryn = Invoke-VOIDYN 'Works on Windows only. Continue?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0))) {
		$users = Get-ChildItem "$env:HOMEDRIVE\Users" | Select-Object Name
		$users = $users.Name
		foreach ($user in $users) {
			$userdir = "$env:HOMEDRIVE\Users\$user"
			Remove-Item -path "$userdir\Dropbox\.dropbox.cache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userdir\Dropbox*\.dropbox.cache\*" -Recurse -Force -EA 0 -Verbose
			$userappdata = "$userdir\AppData\Local"
			Remove-Item -path "$userappdata\Temp\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\CrashDumps\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Microsoft\Teams\previous\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Microsoft\Teams\stage\*" -Recurse -Force -EA 0 -Verbose
			$userwindata = "$userappdata\Microsoft\Windows"
			Remove-Item -path "$userwindata\Temporary Internet Files\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userwindata\INetCache\* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userwindata\WebCache\* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userwindata\AppCache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userwindata\WER\*" -Recurse -Force -EA 0 -Verbose
		}
		Remove-Item -path "$env:windir\Temp\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Prefetch\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Logs\CBS\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\SoftwareDistribution\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Downloaded Program Files\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -EA 0 -Verbose
	}
	elseif ([bool]($IsLinux) -or [bool]($IsMacOS)) {
		Invoke-VOIDX 'WINDOWS ONLY...'
	}
    else {
        Invoke-VOIDX 'OPERATION CANCELLED'
    }
	##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'answeryn' -EA 0
	Remove-Variable -Name 'userdir' -EA 0
	Remove-Variable -Name 'userappdata' -EA 0
	Remove-Variable -Name 'userwindata' -EA 0
	Remove-Variable -Name 'users' -EA 0
}
