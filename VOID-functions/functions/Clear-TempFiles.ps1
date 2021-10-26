<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#########################################
# CLEAR TEMP AND CACHED FILES (WINDOWS) #
#########################################
function Clear-TempFiles {
	Write-Host 'Will clear all temp files and cache.'
	$tempfiles = Invoke-VOIDYN 'Works on Windows only. Continue?'
	if ([bool]($tempfiles) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | 
		Where-Object PSVersion -le 5 -EA 0))) {
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
	elseif ([bool]($tempfiles) -and ([bool]($IsLinux) -or [bool]($IsMacOS))) {
		Invoke-VOIDX 'WINDOWS ONLY FOR NOW...'
	}
}
