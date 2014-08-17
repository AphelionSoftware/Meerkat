$password = "L0pt@8192"
$SpSite = "http://mgs-m6700/"

$pwd = $password | ConvertTo-SecureString -AsPlainText -Force
$crd = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "administrator",$pwd
Enter-PSSession -ComputerName mgs-m6700 -Authentication CredSSP -Credential $crd
Add-PSSnapin microsoft.sharepoint.powershell 

$libURL = "http://mgs-m6700/Reports/ValueReports"
$datasourcename = "rsdsPOA"
$datasourceurl = "http://mgs-m6700/Reports/DataSources/MeerKat.rsds"
$SpSite = "http://mgs-m6700/"

#invoke-expression -Command "$ScriptPath\01_Meerkat.PSConfig.v001.ps1 -DatabaseServer $DatabaseServer -FarmAccount $FarmAccount"
#invoke-expression -Command "$ScriptPath\02_Meerkat.Service Application Setup.v001.ps1 -DatabaseServer $DatabaseServer -FarmAccount $FarmAccount"
#invoke-expression -Command "$ScriptPath\03_Meerkat_ImportRootSite.ps1 -name $name -sitecoll $sitecoll -filePath $filePath -template $template -user $user"
#invoke-expression -Command "$ScriptPath\04_Meerkat_ImportReportSite.ps1  -name $name -sitecoll $sitecoll -filePath $filePath -template $template -user $user"
#invoke-expression -Command "$ScriptPath\06_FixLSiteReferences.ps1 -baseURL $baseURL -SpSite $SpSite"
#invoke-expression -Command "$ScriptPath\07_SwitchMasterPage.ps1 -SpSite $SpSite -masterpage $masterpage"

invoke-expression -Command ".\05_Meerkat_FixReportDataConnections.ps1 -webURL $SpSite -datasourcename $datasourcename -datasourceurl $datasourceurl "

exit

