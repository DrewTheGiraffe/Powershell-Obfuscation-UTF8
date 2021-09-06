# Powershell-Obfuscation-UTF8
String Obfuscation for [.ps1 | .ps1m] scripts

Quick Bio:
Hello, my name is Drew. I am a member of the U.S. Army Active duty force. I have been writing scripts for "PS" for the last year, if you are an advanced developer and have any tips for me please let me know. If you are new welcome! I hope this benefits people and promotes security with in your organization or other projects from the future. This is my personal Git-hub where I work on network programming projects. Please feel free to check out my other work available from the link on my Git-hub home page. 


Obfuscation Write-up: 

Advanced Base64 Obfuscation in UTF8 Write up

Once downloaded, extract the zip file.
Next copy the folder to the following directory.

C:\Windows\System32\WindowsPowerShell\v1.0\Modules

Verify that you do not have the module in multiple folders.
the final directory should be this: 
C:\Windows\System32\WindowsPowerShell\v1.0\Modules\base64 advanced\Base64-Advanced.psm1

once this is done, open Powershell_ise elevated (Administrator)

File open and paste the link above to the file.

Next enter the following command in the console. 

Get-Module Base64-Advanced

If you do not get an error you have installed the module correctly. 

Alright now that you have ISE open, when you type the command for the module all the -arguments will be easy to read.
This will also allow you to see what functions do in real time. 

To start the module type the following command 

Base64-Advanced 

Now add any arguments, lets start basic and work our way into it.

Base64-Advanced -Content "This Can Be Anything" -Encrypt $true

This will effectively encrypt that string and output it in the console session.

Now we can get more advanced. Lets write this content to a file.

Base64-Advanced -Content "This Can Be Anything" -Encrypt $true -WriteToFile $true

Output: 
PS C:\WINDOWS\system32> Base64-Advanced -Content "This Can Be Anything" -Encrypt $true -WriteToFile $true
Enter File Save Path: C:\temp\Test\string.txt
Path Found!
Path Found!

Saved Content to Custom Path!

# End Output.

Now, if the path did not exist. The script will automatically detect this and give you a chance to create a directory
and file in C:\temp. This script assumes C:\temp already exists. If it does not, be sure to create that directory. 

Just one final note. The ReadFromNet argument does not require you to use the WriteToFile argument. 
It will automatically Create a new directory anywhere you input on your computer all the way down to the file.
ReadFromNet is designed to read raw files from the internet. 
I haven't found a use for it yet, but I wanted to make an in depth example this time so it was necessary.

Hope this helps. -Drew
