Param(
  [string] $DatabaseServer ,
  [string] $FarmAccount 
)


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
  
# Settings you may want to change ## 
$databaseServerName = $DatabaseServer
$saAppPoolName = "SharePoint Web Services"
$appPoolUserName = $FarmAccount 
  
  
# Service Application Service Names ## 
$excelSAName = "Excel Services Application"
$metadataSAName = "Managed Metadata Web Service"
$performancePointSAName = "PerformancePoint Service"
$stateSAName = "State Service"
$secureStoreSAName = "Secure Store Service"
$usageSAName = "Usage and Health Data Collection Service"
  
  
$saAppPool = Get-SPServiceApplicationPool -Identity $saAppPoolName -EA 0 
if($saAppPool -eq $null) 
{ 
  Write-Host "Creating Service Application Pool..."
  
  $appPoolAccount = Get-SPManagedAccount -Identity $appPoolUserName -EA 0 
  if($appPoolAccount -eq $null) 
  { 
      Write-Host "Please supply the password for the Service Account..."
      $appPoolCred = Get-Credential $appPoolUserName
      $appPoolAccount = New-SPManagedAccount -Credential $appPoolCred -EA 0 
  } 
  
  $appPoolAccount = Get-SPManagedAccount -Identity $appPoolUserName -EA 0 
  
  if($appPoolAccount -eq $null) 
  { 
    Write-Host "Cannot create or find the managed account $appPoolUserName, please ensure the account exists."
    Exit -1 
  } 
  
  New-SPServiceApplicationPool -Name $saAppPoolName -Account $appPoolAccount -EA 0 > $null
      
} 
  
  
  
  

$serviceInstance = Get-SPUsageService
$var = Get-SPUsageApplication
if ($var  -eq $null) {
    Write-Host "Creating Usage Service and Proxy..."
    New-SPUsageApplication -Name $usageSAName -DatabaseServer $databaseServerName -DatabaseName "UsageDB" -UsageService $serviceInstance > $null
}
  
  
  
$var = Get-SPExcelServiceApplication
if ($var  -eq $null) {

    Write-Host "Creating Excel Service..."
    New-SPExcelServiceApplication -name $excelSAName –ApplicationPool $saAppPoolName > $null
    Set-SPExcelFileLocation -Identity "http://" -ExcelServiceApplication $excelSAName -ExternalDataAllowed 2 -WorkbookSizeMax 10 -WarnOnDataRefresh:$true 
    Get-SPServiceInstance | where-object {$_.TypeName -eq "Excel Calculation Services"} | Start-SPServiceInstance > $null
}  
  
  
  
#$var = Get-SPMetadataServiceApplication -Identity $metadataSAName
#if ($var  -eq $null) {
#    Write-Host "Creating Metadata Service and Proxy: $metadataSAName"
#New-SPMetadataServiceApplication -Name $metadataSAName -ApplicationPool $saAppPoolName -DatabaseServer $databaseServerName -DatabaseName "MetadataDB"  > $null
#New-SPMetadataServiceApplicationProxy -Name "$metadataSAName Proxy" -DefaultProxyGroup -ServiceApplication $metadataSAName > $null
#Get-SPServiceInstance | where-object {$_.TypeName -eq "Managed Metadata Web Service"} | Start-SPServiceInstance > $null
# }
  
  
  
$var = Get-SPPerformancePointServiceApplication
if ($var  -eq $null) {
    Write-Host "Creating Performance Point Service and Proxy..."
New-SPPerformancePointServiceApplication -Name $performancePointSAName -ApplicationPool $saAppPoolName > $null
New-SPPerformancePointServiceApplicationProxy -Default -Name "$performancePointSAName Proxy" -ServiceApplication $performancePointSAName > $null
Get-SPServiceInstance | where-object {$_.TypeName -eq "PerformancePoint Service"} | Start-SPServiceInstance > $null
 }
  

$var = Get-SPStateServiceApplication
if ($var  -eq $null) {
    Write-Host "Creating State Service and Proxy..."
New-SPStateServiceDatabase -Name "StateServiceDB" -DatabaseServer $databaseServerName | New-SPStateServiceApplication -Name $stateSAName | New-SPStateServiceApplicationProxy -Name "$stateSAName Proxy" -DefaultProxyGroup > $null
  }
  
  
  
$var = Get-SPSecureStoreServiceapplication
if ($var  -eq $null) {
    Write-Host "Creating Secure Store Service and Proxy..."
New-SPSecureStoreServiceapplication -Name $secureStoreSAName -Sharing:$false -DatabaseServer $databaseServerName -DatabaseName "SecureStoreServiceAppDB" -ApplicationPool $saAppPoolName -auditingEnabled:$true -auditlogmaxsize 30 | New-SPSecureStoreServiceApplicationProxy -name "$secureStoreSAName Proxy" -DefaultProxygroup > $null
Get-SPServiceInstance | where-object {$_.TypeName -eq "Secure Store Service"} | Start-SPServiceInstance > $null
}

Write-Host "Configuring Reporting Services"
Install-SPRSService
Install-SPRSServiceProxy
get-spserviceinstance -all |where {$_.TypeName -like "SQL Server Reporting*"} | Start-SPServiceInstance