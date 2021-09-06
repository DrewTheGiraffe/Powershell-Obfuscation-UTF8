# Advanced Base64 Example By Drew Burgess 11 AUGUST 2021

# Libraries
Add-Type -AssemblyName System
Add-Type -AssemblyName System.Security
Add-Type -AssemblyName System.Text.Encoding



# This is for you Jose 
Function Base64-Advanced([String]$Content,[Bool]$Decrypt,[Bool]$Encrypt,[Bool]$ReadFromFile,[Bool]$WriteToFile,[Bool]$ReadFromNet,[Bool]$Help) {

        If ($Help) {
            [String]$HelpText = "`n
            Content = [Custom String]`n
            Decrypt = [Bool]`n
            Encrypt = [Bool]`n
            WriteToFile = [Bool]`n
            ReadFromNet = [Bool]`n
            ? = Help"
            Write-Host $HelpText
            return "Script Finished!"
        }
        
        If ($ReadFromNet -eq $true) {
        
            $NetSource = Read-Host -Prompt "Enter URL (RAW ONLY)" 

            $OutputFile = Read-Host -Prompt "Enter File Save Path"

            Sleep 1

            $Netdata = Invoke-WebRequest -Uri $NetSource -OutFile $OutputFile -TimeoutSec 10 # Downloads Input URL and stores data in $Netdata.
            
            $ReadNewFile = Get-Content -Path $OutputFile -Force # Reads Newly Downloaded Info From File

            Write-Host "Saved Content to Custom Path!" -ForegroundColor Green

            $Content = $ReadNewFile

        }

        If ($ReadFromFile -eq $true) {
            
            $InputtedPath = Read-Host -Prompt "Enter File Path To Read" # Gets custom input from console
            
            Sleep 1 # Wait for System to load input
            
            $FileContents = Get-Content -LiteralPath $InputtedPath -ErrorAction SilentlyContinue -Force

            $Content = $FileContents

        }

        If ($Decrypt -eq $true) {
     
            $result = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($Content))
     
        }
     
        If ($Encrypt -eq $true) {
     
            $result = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Content)) 
     
        }
        
        If ($WriteToFile -eq $true) {
            
            $WritePath = Read-Host -Prompt "Enter File Save Path" -ErrorAction SilentlyContinue # Get custom input from console

            Sleep 1 # Wait for System to load input

            # if either the FILE or PATH do not exist at the path you set they will be created below. 
            If ((Test-Path -LiteralPath $WritePath -PathType Leaf)) {
                
                 # Code continues on
                 Write-Host "Path Found!" -ForegroundColor Green

           }

           else {
           
                Write-Host "`nDirectory Not Found`nEnter New Directory without C:\temp\" -ForegroundColor Yellow 

                $DirName = Read-Host -Prompt "Enter New Directory Name"

                New-Item -Path "C:\temp\" -ItemType "directory" -Name $DirName

                Sleep 1 # Wait for System to load Change
           
           }

           If ((Test-Path -LiteralPath $WritePath -PathType Leaf)) {
                
                # Code continues on
                Write-Host "Path Found!" -ForegroundColor Green
                 
           } 

           else {
           
                Write-Host "`nFile Not Found`nEnter New File Name without C:\temp\$DirName\" -ForegroundColor Yellow
                                
                $FileName = Read-Host -Prompt "Enter New File Name"
                 
                New-Item -Path "C:\temp\$DirName\" -ItemType "file" -Name $FileName
           
           }
            
            Set-Content -Path $WritePath -Value $result -Force

            Write-Host "`nSaved Content to Custom Path!" -ForegroundColor Green
        
        }

        Else {
      
           return $result

        }
}

