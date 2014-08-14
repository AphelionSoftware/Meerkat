Param(
  [string]$name,
  [string]$sitecoll,
  [string]$filePath,
  [string]$template
)
Add-PSSnapin microsoft.sharepoint.powershell



New-SPWeb –url "$sitecoll" -name $name -template $template

#Import the site 
Import-SPWeb -Identity "$sitecoll" -Path "$filePath"