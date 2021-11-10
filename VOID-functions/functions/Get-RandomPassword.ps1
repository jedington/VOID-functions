function Get-RandomPassword {
    -join (48..57+65..90+97..122 | ForEach-Object{ [char] $_ } | Get-Random -C 20)
}