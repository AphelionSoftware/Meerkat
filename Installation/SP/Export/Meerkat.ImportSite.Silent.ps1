Param(
  [string]$name,
  [string]$sitecoll,
  [string]$filePath,
  [string]$template
)
Add-PSSnapin microsoft.sharepoint.powershell


New-SPWeb –url "$sitecoll" -name "$name" -template $template
#Write-Host $sitecoll
#Write-Host $name
#Write-Host $template
#Import the site 
Import-SPWeb -Identity "$sitecoll" -Path "$filePath"

#New-SPWeb –url "http://mgs-m6700/sites/Meerkat/Outcome3/test" -name "Test" -template STS#0
#Import-SPWeb -Identity "http://mgs-m6700/sites/Meerkat/Outcome2/Test" -Path "D:\Dropbox\GitHub\Meerkat\Installation\SP\Export\meerkat_project.cmp"
#