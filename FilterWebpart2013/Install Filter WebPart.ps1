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

# Add solution to the farm environment and install it.
$solutionpath = Read-Host 'Please insert the full path for the wsp solution file e.g "C:\FilterWebPart.wsp"'
$solutionfile = Read-Host 'Please insert the name of the solution file without the extension or path e.g "FilterWebPart"'
Add-SPSolution $solutionpath
Install-SPSolution -Identity $solutionfile -AllWebApplications –GACDeployment