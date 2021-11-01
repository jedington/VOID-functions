<#
	.SYNOPSIS
	.DESCRIPTION
	.NOTES
#>

# works on only files for now; folders will be ignored
function Start-ShredFile ([string]$filepath) {
	if (!($filepath)) {
		Invoke-VOIDX 'USAGE: Start-ShredFile <FILEPATH>'
	}
	else {
		$size = 2048
		$buffer,$rng,$stream,$file = $null
		$file = $filepath | Get-Item
		if ($file -eq $null) {
			Invoke-VOIDX 'INPUT PATH IS NOT VALID'
		} 
		elseif ($file -isnot [IO.FileInfo]) {
			Invoke-VOIDX 'INPUT PATH IS NOT A FILE'
		} 
		else {
			$file.Attributes = 'Normal'
			$sectors = [Math]::Ceiling($file.Length / $size)
			$buffer = New-Object Byte[] $size
			$rng = New-Object Security.Cryptography.RNGCryptoServiceProvider
			$stream = New-Object IO.FileStream($file.FullName, [IO.FileAccess]::Write)
			for ($i = 0; $i -lt 13; $i++) {
				$stream.Position = 0
				for ($j = 0; $j -lt $sectors; $j++) {
					$rng.GetBytes($buffer)
					$stream.Write($buffer, 0, $buffer.Length)
				}
			}
			$stream.SetLength(0);
			$stream.Close();
			$file.CreationTime = '01/01/2000 00:00:01 AM'
			$file.LastWriteTime = '01/01/2000 00:00:01 AM'
			$file.LastAccessTime = '01/01/2000 00:00:01 AM'
			$file.Delete()
			$filename = [IO.Path]::GetFileName($filepath)
			if ([bool]($filename)) {
				Invoke-VOIDX "FILE SHREDDED ($filename)"
			}
		}
		if ($buffer -ne $null) {
			$buffer.Clear()
		}
		if ($rng -ne $null) {
			$rng.Dispose()
		}
		if ($stream -ne $null) {
			$stream.Close()
			$stream.Dispose()
		}
		##############
		# CLEAR VARS #
		##############
		Clear-Variable -Name 'filepath' -EA 0
		Clear-Variable -Name 'file' -EA 0
		Clear-Variable -Name 'filename' -EA 0
		Clear-Variable -Name 'sectors' -EA 0
		Clear-Variable -Name 'stream' -EA 0
		Clear-Variable -Name 'buffer' -EA 0
		Clear-Variable -Name 'rng' -EA 0
	} 
}