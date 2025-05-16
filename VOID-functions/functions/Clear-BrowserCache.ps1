<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

#################################
# CLEAR BROWSER CACHE (WINDOWS) #
#################################
function Clear-BrowserCache {
	Invoke-VOIDT 'Will clear all browser cache.,.'
	$answeryn = Invoke-VOIDYN 'Works on Windows only. Continue?'
	
	if ([bool]($answeryn) -and ([bool]($IsWindows) -or [bool]($PSVersionTable | Where-Object PSVersion -le 5 -EA 0))) {
		$users = Get-ChildItem "$env:HOMEDRIVE\Users" | Select-Object Name
		$users = $users.Name
		if ([bool](Get-Service brave*)) {
			foreach ($user in $users) {
				$bbrave = "$env:HOMEDRIVE\Users\$user\AppData\Local\BraveSoftware\Brave-Browser\User Data"
				Remove-Item -path "$bbrave\Default\Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Default\Cookies\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Default\Cookies-Journal" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Default\IndexedDB\https_*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Default\JumpListIconsOld" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Default\Media Cache" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bbrave\Greaselion\Temp\*" -Recurse -Force -EA 0 -Verbose
			}
		}
		if ([bool](Get-Service googlechrome*)) {
			foreach ($user in $users) {
				$bchrome = "$env:HOMEDRIVE\Users\$user\AppData\Local\Google\Chrome\User Data"
				Remove-Item -path "$bchrome\Default\Cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchrome\Default\Cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchrome\Default\Cookies\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchrome\Default\Cookies-Journal" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchrome\Default\JumpListIconsOld" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bchrome\Default\Media Cache" -Recurse -Force -EA 0 -Verbose
				$profiles = Get-ChildItem -Path $bchrome | Select-Object Name | Where-Object Name -Like "Profile*"
        		foreach ($acct in $profiles) {
					$acctp = $acct.Name
					Remove-Item -path "$bchrome\$acctp\Cache\*" -Recurse -Force -EA 0 -Verbose
					Remove-Item -path "$bchrome\$acctp\Cache2\entries\*" -Recurse -Force -EA 0 -Verbose
					Remove-Item -path "$bchrome\$acctp\Cookies\*" -Recurse -Force -EA 0 -Verbose
					Remove-Item -path "$bchrome\$acctp\Cookies-Journal" -Recurse -Force -EA 0 -Verbose
					Remove-Item -path "$bchrome\$acctp\JumpListIconsOld" -Recurse -Force -EA 0 -Verbose
					Remove-Item -path "$bchrome\$acctp\Media Cache" -Recurse -Force -EA 0 -Verbose
				}
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
		if ([bool](Get-Service mozilla*)) {
			foreach ($user in $users) {
				$bffL = "$env:HOMEDRIVE\Users\$user\AppData\Local\Mozilla\Firefox\Profiles"
				$bffR = "$env:HOMEDRIVE\Users\$user\AppData\Roaming\Mozilla\Firefox\Profiles"
				$bffdefL = "$bffL\*.default-release"
				Remove-Item -path "$bffdefL\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\cache2\trash*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\suggest.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefL\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				$bffdefR = "$bffR\*.default-release"
				Remove-Item -path "$bffdefR\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\cache2\trash*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\suggest.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdefR\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				$bffdevL = "$bffL\*.dev-edition-default"
				Remove-Item -path "$bffdevL\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\cache2\trash*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\suggest.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevL\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				$bffdevR = "$bffR\*.dev-edition-default"
				Remove-Item -path "$bffdevR\cache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\cache2\entries\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\cache2\trash*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\OfflineCache\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\thumbnails\*" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\cookies.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\suggest.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\webappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
				Remove-Item -path "$bffdevR\chromeappsstore.sqlite" -Recurse -Force -EA 0 -Verbose
			}
		}
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
	Remove-Variable -Name 'acct' -EA 0
	Remove-Variable -Name 'acctp' -EA 0
	Remove-Variable -Name 'answeryn' -EA 0
	Remove-Variable -Name 'bbrave' -EA 0
	Remove-Variable -Name 'bchrome' -EA 0
	Remove-Variable -Name 'bedge' -EA 0
	Remove-Variable -Name 'bopera' -EA 0
	Remove-Variable -Name 'bffL' -EA 0
	Remove-Variable -Name 'bffR' -EA 0
	Remove-Variable -Name 'bffdefL' -EA 0
	Remove-Variable -Name 'bffdefR' -EA 0
	Remove-Variable -Name 'bffdevL' -EA 0
	Remove-Variable -Name 'bffdevR' -EA 0
	Remove-Variable -Name 'profiles' -EA 0
	Remove-Variable -Name 'user' -EA 0
	Remove-Variable -Name 'users' -EA 0
}
