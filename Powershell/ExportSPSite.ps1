Param(
  [string]$site,
  [string]$filePath
)
Add-PSSnapin microsoft.sharepoint.powershell

#D:\Dropbox\GitHub\Meerkat\Deploy\ReportSite\ExportSPSite.ps1 -site "http://mgs-m6700/sites/Meerkat/reports/" -filePath "D:\Dropbox\GitHub\Meerkat\Deploy\ReportSite\meerkat.reports.cmp" 


#New-SPSite -Url "$sitecoll" -OwnerAlias $user -template $template -name $name

#New-SPWeb –url "$sitecoll" -name "$name" -template $template
#Write-Host $sitecoll
#Write-Host $name
#Write-Host $template
#Import the site 
Export-SPWeb -Identity "$site" -Path "$filePath" -Force

#New-SPWeb –url "http://mgs-m6700/sites/Meerkat/Outcome3/test" -name "Test" -template STS#0
#Import-SPWeb -Identity "http://mgs-m6700/sites/Meerkat/Outcome2/Test" -Path "D:\Dropbox\GitHub\Meerkat\Installation\SP\Export\meerkat_project.cmp"
#