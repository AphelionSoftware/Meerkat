Param(
  [string]$site,
  [string]$PageName,
  [string]$ReportLocation
)

# cd D:\Dropbox\GitHub\Meerkat\Development\SharePoint\PS
#.\CreatePage.ps1 -site "http://mgs-m6700/sites/Meerkat/Outcome1/" -PageName "ProjectReachReport" -ReportLocation "http://mgs-m6700/sites/Meerkat/Reports/ValueReports/ProjectReach.rdl?Web=1"
Add-PSSnapin microsoft.sharepoint.powershell
 
 
 function Ensure-HttpContext([string]$url)
 {
     $sw = New-Object System.IO.StringWriter
     $resp = New-Object System.Web.HttpResponse $sw
     $req = New-Object System.Web.HttpRequest "", $url, ""
     $htc = New-Object System.Web.HttpContext $req, $resp
     [System.Web.HttpContext]::Current = $htc
 }
 function Ensure-SPContext([string]$url)
 {
     Ensure-HttpContext $url
  
     if(![System.Web.HttpContext]::Current.Items["HttpHandlerSPWeb"] -or
      ![System.Web.HttpContext]::Current.Items["HttpHandlerSPSite"])
     {
         [Microsoft.SharePoint.SPWeb]$web = Get-SPWeb $url
         [System.Web.HttpContext]::Current.Items["HttpHandlerSPWeb"] = $web
         [System.Web.HttpContext]::Current.Items["HttpHandlerSPSite"] = $web.Site
     }
 }

 $spWeb = Get-SPWeb -Identity $site

#$pubWeb =[Microsoft.SharePoint.Publishing.PublishingWeb]::GetPublishingWeb($spWeb)
# # Create blank web part page
# $pl = $pubWeb.GetAvailablePageLayouts() | Where { $_.Name -eq "BlankWebPartPage.aspx" } 
# $newPage = $pubWeb.AddPublishingPage($PageName, $pl) #filename need end with .aspx extension
# $newPage.Update()
# # Check-in and publish page
# $newPage.CheckIn("")
# $newPage.ListItem.File.Publish("")
# $spWeb.Dispose()

 

$listname = "Site Pages"

$pagesLibrary = $spWeb.Lists | Where { $_.Title -eq "$listname" }
 
$pageLayout = 1

$cmd = '<?xml version="1.0" encoding="UTF-8"?><Method ID="0,NewWebPage"><SetList Scope="Request">' + $pagesLibrary.ID + '</SetList><SetVar Name="Cmd">NewWebPage</SetVar><SetVar Name="ID">New</SetVar><SetVar Name="Type">WebPartPage</SetVar><SetVar Name="WebPartPageTemplate">' + $pageLayout + '</SetVar><SetVar Name="Overwrite">true</SetVar><SetVar Name="Title">' + $PageName + '</SetVar></Method>';

$spWeb.ProcessBatchData($cmd)

$listname = "SitePages"
    #$spSite = Get-SPSite $site
    #$page = $spWeb.GetFile("$site/$listname/$PageName.aspx")
    #
    #Write-Host $page
	#$WebPartManager = $page.GetLimitedWebPartManager([System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
    Write-Host "$site/$listname/$PageName.aspx"
    $WebPartManager = $spweb.GetLimitedWebPartManager("$listname/$PageName.aspx", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared);
    
 

 
if($page.CheckOutStatus -eq "None")
{
$page.CheckOut()
}
$egrWpsCount=0




#region Set context
 # Ensure HttpContext.Current
  
Ensure-SPContext( $site )


#endregion

#region Add web parts 
 $webpart=new-object  Microsoft.ReportingServices.SharePoint.UI.WebParts.ReportViewerWebPart
 #$webpart.ChromeType=[System.UI.Controls.Parts.PartChromeType]::TitleOnly
 $webpart.Title="Project Area Reached"
 
 $WebPartManager.AddWebPart($webpart, "Full Page", 0);

 [System.Web.HttpContext]::Current = null
#endregion
 
 #Microsoft.ReportingServices.SharePoint.UI.WebParts.ReportViewerWebPart
#foreach($webpart in $WebPartManager.WebParts)
#{
##$webpart
#$webpart.Title
#$webpart.ID
#
#$egrWpsCount++
#}


$page.CheckIn("$PageName")   
$spWeb.Close()



 