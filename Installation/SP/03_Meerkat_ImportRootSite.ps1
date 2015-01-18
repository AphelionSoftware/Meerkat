Param(
  [string]$name,
  [string]$sitecoll,
  [string]$filePath,
  [string]$template,
  [string]$user
)
Add-PSSnapin microsoft.sharepoint.powershell
#.\03_Meerkat_ImportRootSite.ps1 -name "Meerkat" -sitecoll "http://mgs-m6700" -filePath "D:\Dropbox\GitHub\Meerkat\Installation\SP\Export\Meerkat_Root.cmp" -template STS#0 -user "MGS2012\Administrator"


#New-SPSite -Url "$sitecoll" -OwnerAlias $user -template $template -name $name

#New-SPWeb –url "$sitecoll" -name "$name" -template $template
#Write-Host $sitecoll
#Write-Host $name
#Write-Host $template
#Import the site 
Write-Host "Importing site"
Import-SPWeb -Identity "$sitecoll" -Path "$filePath"

Write-Host "Enabling power pivot"
Enable-SPFeature -Identity "PowerPivotSite" -URL "$sitecoll"


#New-SPWeb –url "http://mgs-m6700/sites/Meerkat/Outcome3/test" -name "Test" -template STS#0
#Import-SPWeb -Identity "http://mgs-m6700/sites/Meerkat/Outcome2/Test" -Path "D:\Dropbox\GitHub\Meerkat\Installation\SP\Export\meerkat_project.cmp"
#