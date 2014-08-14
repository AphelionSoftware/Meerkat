# Ensure elevated privileges
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
# No Administrative rights, it will display a popup window asking user for Admin rights
# After user clicks Yes on the popup, your file will be reopened with Admin rights

$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments

break
}
Add-PSSnapin microsoft.sharepoint.powershell

#Import the site collection
$sitecoll = Read-Host 'Please insert the url for the target site collection'
$collpath = Read-Host 'Please insert the path to the site collection export file'
Import-SPWeb -Identity "$sitecoll" -Path "$collpath"