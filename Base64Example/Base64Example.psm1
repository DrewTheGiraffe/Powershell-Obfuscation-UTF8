# Base64 Example By Drew Burgess 10 AUGUST 2021

# Libraries
Add-Type -AssemblyName System
Add-Type -AssemblyName System.Security
Add-Type -AssemblyName System.Text.Encoding

# This is for you Jose

Function Base64-Example([String]$Content,[Bool]$Decrypt,[Bool]$Encrypt) {
        If ($Decrypt -eq $true) {
            $result = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($Content))
        }
        If ($Encrypt -eq $true) {
            $result = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Content)) 
        }
    return $result
}