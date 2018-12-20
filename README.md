# RDG-Cracker
decypt RDG files using DLL decrypt funcrion and user's permissions,
Use PowerShell to find and Crack Remote Desktop Connection Manager 

This PowerShell script Searchs for *.RDG files in the "c:\Users" Directory
and in alll the Subdirecories, when RDG files has been found The script will use
the RDCMAN.exe witch located in "c:\Program Files (x86)". 


   use The Argument -Password to crack a password from the local machine 
   use The Argument -Path to crack a RDG file from the local machine 
   When this parameter -Force is used, The Url Parameter will be needed too.and with the url powershell will download the dll from HTTP server.    
   Don't forget to use -URL Argument if you're using -Force 
 
Examples:

   Get-RDGCracker 

   The will search and Crack RDG files
   ----------- 
   Get-RDGCracker -PATH c:\users\user\abcd.rdg
    
   Crack spesific RDG file 
   ----------- 
   Get-RDGCracker -Password AQAAANCMnd8BFdERjHoAwE/Cl+sBAAAAaxDmDn3QlEywbGaxFbRBCgAAAAACAAAAAAAQZgAAAAEAACAAAACsIP06El88paC9kIe7ZyFgrO+dncDZca7K6lJ+syYlTAAAAAAOgAAAAAIAACAAAABjV510S7n7FRVaOpx/Zy5O9lhPi+klWuzKiAnsymqM/yAAAADfZTPGGxAzT4l41v2RGj2EGz/Nel44EkYWL5oPAI4Uq0AAAAAsOWHjJbfibk61gq2+YjpZPFLrSMxSY0VcnNHY1ZtvBcF4qMY8vVu+de43f4AxCvgRZGfS2KRSP8StXZSIsDwo
   Will Crack only the Password.
   ----------- 
   Get-RDGCracker -Force=$true -URL=https://github.com/D-Hutch/RDG-Cracker/blob/master/RDCMan.dll?raw=true -Path c:\users\user\abcd.rdg
