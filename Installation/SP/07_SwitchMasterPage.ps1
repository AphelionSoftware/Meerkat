Param(
  [string]$SpSite,
  [string]$masterpage
)
Add-PSSnapin microsoft.sharepoint.powershell
#$baseURL = "http://mgs-m6700"
#$SpSite = "http://mgs-m6700"

$web = Get-SPWeb -Identity "$SpSite"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 

#Admin
$web = Get-SPWeb -Identity "$SpSite/Admin"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 


#Capture
$web = Get-SPWeb -Identity "$SpSite/Capture"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 


#FormBuilder
$web = Get-SPWeb -Identity "$SpSite/FormBuilder"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 


#FormCapture
$web = Get-SPWeb -Identity "$SpSite/FormCapture"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 



#EventRegister
$web = Get-SPWeb -Identity "$SpSite/EventRegister"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 



#ReportsManager
$web = Get-SPWeb -Identity "$SpSite/ReportsManager"
$web.CustomMasterUrl =  "/_catalogs/masterpage/$masterpage"  
$web.MasterUrl = "/_catalogs/masterpage/$masterpage" 
$web.Update() 


