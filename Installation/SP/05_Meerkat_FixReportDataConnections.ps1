#Param(
#  [string]$sitecoll,
#  [string]$filePath,
#  [string]$library,
#  [string]$datasource
#)

$password = "L0pt@8192"
$SPSite = "http://mgs-m6700/"

$pwd = $password | ConvertTo-SecureString -AsPlainText -Force
$crd = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "administrator",$pwd
Enter-PSSession -ComputerName mgs-m6700 -Authentication CredSSP -Credential $crd
Add-PSSnapin microsoft.sharepoint.powershell 

#------------------------------------------------------------------------------------------- 
# Name:            Get-SSRSDataSourceInfo 
# Description:     This script will display the data source info for all the reports in a doc lib 
# Usage:        Run the function with the -DocLibUrl parameter 
# By:             Ivan Josipovic, softlanding.ca 
#------------------------------------------------------------------------------------------- 
