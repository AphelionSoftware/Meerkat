# Set admin rights if they are lacking.
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
# No Administrative rights, it will display a popup window asking user for Admin rights
# After user clicks Yes on the popup, your file will be reopened with Admin rights

$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments

break
}  

# Import SP Cmdlets 
Add-PSSnapin Microsoft.SharePoint.PowerShell -erroraction SilentlyContinue 

# Settings to change
$DatabaseServer = "DBservername";
$FarmName = "SP2013";
$ConfigDB = $FarmName+"_ConfigDB";
$AdminContentDB = $FarmName+"_CentralAdminContent";
$Passphrase = convertto-securestring "Password123" -asplaintext -force;
$Port = "2013";
$Authentication = "NTLM";
$FarmAccount = "Sp2013\SPFarm"

 
# Configure SP Farm
New-SPConfigurationDatabase -DatabaseName $ConfigDB -DatabaseServer $DatabaseServer -FarmCredentials (Get-Credential $farmAccount) -Passphrase $Passphrase -AdministrationContentDatabaseName $AdminContentDB

Install-SPHelpCollection -All
"Installed Help Collection"

Initialize-SPResourceSecurity
"Initialized SP Resource Security"

Install-SPService 
"Installed SP service" 

Install-SPFeature -AllExistingFeatures
"Installed SP Feature"

New-SPCentralAdministration -Port $Port
"Created Central Administration Site"

Install-SPApplicationContent 
"Installed Application Content"