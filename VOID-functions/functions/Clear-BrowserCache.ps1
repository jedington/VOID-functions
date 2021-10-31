<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################################
# CLEAR BROWSER CACHE (WINDOWS) #
#################################
function Clear-BrowserCache {
	Write-Host 'Will clear all browser cache.'
	$answeryn = Invoke-VOIDYN 'Works on Windows only. Continue?'
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | 
		Where-Object PSVersion -le 5 -EA 0))) {
		$users = Get-ChildItem "$env:HOMEDRIVE\Users" | Select-Object Name
		$users = $users.Name
		if ([bool](Get-Service googlechrome*)) {
			foreach ($user in $users) {
				$bchromed = "$env:HOMEDRIVE\Users\$user\AppData\Local\Google\Chrome\User Data\Default"
				Remove-Item -path "$bchromed\Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromed\Cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromed\Cookies\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromed\Media Cache" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromed\Cookies-Journal" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromed\JumpListIconsOld" -Recurse -Force -EA 0 -Verbose
			}
			$profiles = Get-ChildItem -Path $bchromep | Select-Object Name | Where-Object Name -Like "Profile*"
        	foreach ($account in $profiles) {
				$account = $account.Name
				$bchromep = "$env:HOMEDRIVE\Users\$user\AppData\Local\Google\Chrome\User Data"
				Remove-Item -path "$bchromep\$account\Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromep\$account\Cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromep\$account\Cookies\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromep\$account\Media Cache" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromep\$account\Cookies-Journal" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchromep\$account\JumpListIconsOld" -Recurse -Force -EA 0 -Verbose
			}
		}
		if ([bool](Get-Service mozilla*)) {
			foreach ($user in $users) {
				$bff = "$env:HOMEDRIVE\Users\$user\AppData\Local\Mozilla\Firefox\Profiles"
				$bffdefault = "$bff\*.default"
				$bffdev = "$bff\*.dev-edition-default"
				Remove-Item -path "$bffdefault\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefault\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdev\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
			}
		}
		if ([bool](Get-Service microsoftedge*)) {
			foreach ($user in $users) {
				$bedge = "$env:HOMEDRIVE\Users\$user\AppData\Local\Microsoft\Edge\User Data\Default"
				Remove-Item -path "$bedge\Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bedge\Code Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bedge\Cookies" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bedge\History" -Recurse -Force -EA 0 -Verbose
			}
		}
		if ([bool](Get-Service opera*)) {
			foreach ($user in $users) {
				$bopera = "$env:HOMEDRIVE\Users\$user\AppData\Local\AppData\Local\Opera Software"
				Remove-Item -path "$bopera\Opera Stable\Cache\*" -Recurse -Force -EA 0 -Verbose
			}
		}
	}
	elseif ([bool]($answeryn) -and ([bool]($IsLinux) -or [bool]($IsMacOS))) {
		Invoke-VOIDX 'WINDOWS ONLY FOR NOW...'
	}
}
