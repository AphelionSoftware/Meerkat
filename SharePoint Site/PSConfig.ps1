$DatabaseServer = "DBservername";
$FarmName = "SP2013";
$ConfigDB = $FarmName+"_ConfigDB";
$AdminContentDB = $FarmName+"_CentralAdminContent";
$Passphrase = convertto-securestring "Password123" -asplaintext -force;
$Port = "2013";
$Authentication = "NTLM";
$FarmAccount = "Sp2013\SPFarm"

 

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