function Start-Unzip ($file) {
    $dirname = (Get-Item $file).Basename
    Write-Output("Extracting", $file, "to", $dirname)
    New-Item -Force -ItemType directory -Path $dirname
    Expand-Archive $file -OutputPath $dirname -ShowProgress
    ##############
	# CLEAR VARS #
	##############
	Remove-Variable -Name 'dirname' -EA 0
	Remove-Variable -Name 'file' -EA 0
}