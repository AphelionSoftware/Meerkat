Param(
  [string]$site,
  [string]$filePath
)
Add-PSSnapin microsoft.sharepoint.powershell 

#ImportReportSite_FixConnections.ps1 -site "http://mgs-m6700/sites/Meerkat/" -filePath "D:\Dropbox\GitHub\Meerkat\Deploy\ReportSite\meerkat.reports.cmp" 


#------------------------------------------------------------------------------------------- 
# Name:            Get-SSRSDataSourceInfo 
# Description:     This script will display the data source info for all the reports in a doc lib 
# Usage:        Run the function with the -DocLibUrl parameter 
# By:             Ivan Josipovic, softlanding.ca 
#------------------------------------------------------------------------------------------- 
Function Get-SSRSDataSourceInfo ($DocLibUrl){

$DocLibUrl = $DocLibUrl.Replace("%20"," ").tolower(); 
if ($docliburl.EndsWith("/")){  
    $docliburl = $docliburl.Substring(0,$docliburl.length-1); 
} 
$webfound = $false; 
$weburl = $DocLibUrl; 
 
while ($webfound -eq $false) { 
    if ($weburl.Contains("/")){ 
        $weburl = $weburl.Substring(0,$weburl.LastIndexOf("/")); 
        $web = Get-SPWeb -identity $weburl -ea 0; 
        if ($web -ne $null){ 
            $webfound = $true; 
        } 
    }else{ 
        Write-Host -ForegroundColor Red "The Web could not be found: $weburl"; 
        return -1; 
    } 
} 
$doclib = $web.lists |where {$_.RootFolder.Name.tolower() -eq $docliburl.Substring($docliburl.LastIndexOf("/")+1,$docliburl.length-$docliburl.LastIndexOf("/")-1)}; 
if($doclib -eq $null){ 
Write-Host -ForegroundColor Red "The DocLib could not be found: $docliburl"; 
return; 
} 
$reports = $doclib.items | where {$_.File.Name.tolower().Contains(".rdl")} 
 
$SSRSurl = "$($web.url)/_vti_bin/ReportServer/ReportService2010.asmx"; 
$SSRS = New-WebServiceProxy -uri $SSRSurl -UseDefaultCredential; 
$($ssrs.url); 
foreach ($report in $reports){ 
    write-output "$($web.url)/$($report.url)" 
    $dataSources = $ssrs.GetItemDataSources("$($web.url)/$($report.url)"); 
        foreach ($DataSource in $DataSources){ 
            write-output "$($DataSource.name) : $($DataSource.item.reference)"; 
        } 
    write-host ""; 
} 
} 

#-------------------------------------------------------------------------------------------
# Name:			Set-SSRSDataSourceInfo
# Description: 	This script will set the data source url for all reports in a doclib
# Usage:		Run the function with the DocLibUrl,DataSourceName and DataSourceURL parameters
# By: 			Ivan Josipovic, softlanding.ca
#-------------------------------------------------------------------------------------------

Function Set-SSRSDataSourceInfo ($WebUrl, $DocLibUrl,$DataSourceName,$DataSourceURL){
$DocLibUrl = $DocLibUrl.Replace("%20"," ").tolower();
if ($docliburl.EndsWith("/")){ 
    $docliburl = $docliburl.Substring(0,$docliburl.length-1);
}
$webfound = $false;
#$weburl = $DocLibUrl;
    $web = get-spweb -identity $weburl -ea 0;
	if ($web -ne $null){
		$webfound = $true;
	}
	else{
		Write-Output -ForegroundColor Red "The Web could not be found: $weburl";
		return -1;
	}
Write-Host $docliburl.Substring($docliburl.LastIndexOf("/")+1,$docliburl.length-$docliburl.LastIndexOf("/")-1);
$doclib = $web.lists |where {$_.RootFolder.Name.tolower() -eq $docliburl.Substring($docliburl.LastIndexOf("/")+1,$docliburl.length-$docliburl.LastIndexOf("/")-1)};
if($doclib -eq $null){
Write-Output -ForegroundColor Red "The DocLib could not be found $docliburl";
return;
}
$reports = $doclib.items | where {$_.File.Name.tolower().Contains(".rdl")}

$SSRSurl = "$($web.url)/_vti_bin/ReportServer/ReportService2010.asmx";
$SSRS = New-WebServiceProxy -uri $SSRSurl -UseDefaultCredential;
foreach ($report in $reports){
	write-output "$($web.url)/$($report.url)";
	$dataSources = $ssrs.GetItemDataSources("$($web.url)/$($report.url)");
	if ($datasources.count -gt 0){
		for ($i = 0; $i -lt $dataSources.count; $i++) {
			if ($DataSources[$i].name -eq $DataSourceName){
				write-output "Updating $($DataSources[$i].name)";
				$proxyNamespace = $DataSources[$i].GetType().Namespace;
				$DataSources[$i].Item = New-Object ("$proxyNamespace.DataSourceReference");
				$DataSources[$i].Item.Reference = $DataSourceURL;
                $SSRS.SetItemDataSources("$($web.url)/$($report.url)", $DataSources[$i])
				write-output "Done";
			}
		}
	}
Write-Host $weburl;

    Write-Host $DocLibUrl;
	
	write-output "";

}
}
#Import the site 
Import-SPWeb -Identity "$site" -Path "$filePath"

$weburl = $site + "Reports"
$libURL = $weburl + "/ValueReports"
$datasourcename = "rsdsPOA";
$datasourceurl = "$weburl/DataSources/rsdsPOA.rsds"
#Write-host $datasourceurl;
Set-SSRSDataSourceInfo -WebUrl "$weburl" -DocLibUrl "$libURL" -DataSourceURL "$datasourceurl" -DataSourceName "$datasourcename"

$libURL = $weburl + "/StatusReports"
Set-SSRSDataSourceInfo -WebUrl "$weburl" -DocLibUrl "$libURL" -DataSourceURL "$datasourceurl" -DataSourceName "$datasourcename"
$libURL = $weburl + "/AdminReports"
Set-SSRSDataSourceInfo -WebUrl "$weburl" -DocLibUrl "$libURL" -DataSourceURL "$datasourceurl" -DataSourceName "$datasourcename"
$libURL = $weburl + "/MeerkatReports"
Set-SSRSDataSourceInfo -WebUrl "$weburl" -DocLibUrl "$libURL" -DataSourceURL "$datasourceurl" -DataSourceName "$datasourcename"





