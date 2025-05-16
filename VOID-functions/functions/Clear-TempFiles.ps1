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
			$userappdata = "$userdir\AppData"
			Remove-Item -path "$userappdata\Local\cache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\CEF\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Comms\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\CrashDumps\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Diagnostics\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\ElevatedDiagnostics\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Feeds\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Teams\previous\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Teams\stage\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\ActionCenterCache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\AppCache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\Explorer\thumbcache* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\History\* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\INetCache\* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\WebCache\* " -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\npm-cache\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\nwjs\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Publishers\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\Temp\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Local\tyranoscript\*" -Recurse -Force -EA 0 -Verbose
			Remove-Item -path "$userappdata\Roaming\Microsoft\Windows\Start Menu\Programs\*" -Recurse -Force -EA 0 -Verbose
		}
		Remove-Item -path "$env:ProgramData\Microsoft\Network\Downloader\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\*.lnk" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\Microsoft\Windows\WER\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\Package Cache\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:ProgramData\USOShared\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Downloaded Program Files\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Prefetch\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\SoftwareDistribution\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\SystemTemp\*" -Recurse -Force -EA 0 -Verbose
		Remove-Item -path "$env:windir\Temp\*" -Recurse -Force -EA 0 -Verbose
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
	Remove-Variable -Name 'users' -EA 0
}
