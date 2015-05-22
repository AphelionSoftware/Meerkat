Param(
  [string]$site,
  [string]$PageName,
  [string]$ReportLocation,
  [string]$ListName,
  [string]$RootSite
)

#Ensuring we have rights to do everything
#Add-SPShellAdmin -UserName "administrator" | Out-Null #needs to be done once
#Add-SPShellAdmin -UserName "spinstall" | Out-Null
#Add-SPShellAdmin -UserName "MarkGStacey" | Out-Null

# cd D:\Dropbox\GitHub\Meerkat\Development\SharePoint\PS
#.\CreatePage.ps1 -site "http://mgs-m6700/sites/Meerkat/Outcome1/" -PageName "IndicatorMapPage" -ReportLocation "http://mgs-m6700/sites/Meerkat/Reports/ValueReports/IndicatorMapDetails.rdl" -ListName  "Dashboards" -RootSite "http://mgs-m6700/sites/Meerkat"
Add-PSSnapin microsoft.sharepoint.powershell
 [Reflection.Assembly]::LoadWithPartialName("Microsoft.ReportingServices.SharePoint.UI.WebParts")
	[Reflection.Assembly]::LoadWithPartialName("System.Web")
	[Reflection.Assembly]::LoadWithPartialName("System.IO")
	[Reflection.Assembly]::LoadWithPartialName("System.Collections.Generic")


 function Remove-All-WebParts ( $WebPartManager )
 {
 $webparts = @() # – Declare empty array that will contain the GUID of the web parts on the current page; 
 foreach($spwebpart in $WebPartManager.Webparts) 
    { 
        foreach($wptitle in $wpNames) 
        { 
            if($spwebpart.Title -eq $wptitle) 
            { 
                $webparts = $webparts + $spwebpart.ID    #   We've found a web part to be deleted, add its ID to the array;                         
            } 
        } 
    } 
    foreach($webpartId in $webparts) #  Now that we have the GUID of all web parts to delete, loop through them and delete them one at a time; 
        { 
            $WebPartManager.DeleteWebPart($spWpManager.Webparts[$webpartId]) 
        } 

 }

 $spWeb = Get-SPWeb -Identity $site

#region Create Page

#$listname = "Dashboards"

$pagesLibrary = $spWeb.Lists | Where { $_.Title -eq "$ListName" }
 
$pageLayout = 5

$cmd = '<?xml version="1.0" encoding="UTF-8"?><Method ID="0,NewWebPage"><SetList Scope="Request">' + $pagesLibrary.ID + '</SetList><SetVar Name="Cmd">NewWebPage</SetVar><SetVar Name="ID">New</SetVar><SetVar Name="Type">WebPartPage</SetVar><SetVar Name="WebPartPageTemplate">' + $pageLayout + '</SetVar><SetVar Name="Overwrite">true</SetVar><SetVar Name="Folder">Template Pages</SetVar><SetVar Name="Title">' + $PageName + '</SetVar></Method>';

$spWeb.ProcessBatchData($cmd)

$spWeb.AllowUnsafeUpdates = $true


#endregion

#region Setup Web Part Manager
    $page = $spWeb.GetFile("$site/$ListName/$PageName.aspx")
  
     $WebPartManager = $spweb.GetLimitedWebPartManager("$ListName/$PageName.aspx", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared);
    
  
if($page.CheckOutStatus -eq "None")
{
$page.CheckOut()
}
$egrWpsCount=0

#endregion
 
  
 Remove-All-WebParts ( $WebPartManager )

 
 #region Context
 [System.Web.HttpRequest] $request = new-object System.Web.HttpRequest("",$site,"")
	$response = new-object System.Web.HttpResponse([System.IO.TextWriter]::Null);
	[System.Web.HttpContext]::Current = new-object System.Web.HttpContext($request,$response)
	[System.Web.HttpContext]::Current.Request.Browser = new-object System.Web.HttpBrowserCapabilities
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities = new-object 'System.Collections.Generic.Dictionary[string,string]'
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["type"] = "IE7";
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["majorversion"] = "7";
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["minorversion"] = "0"
	[System.Web.HttpContext]::Current.Items["HttpHandlerSPWeb"] = [Microsoft.SharePoint.SPWeb]$spWeb;
#endregion
#region Add web parts 
    #region ReportViewer
     $webpart=new-object  Microsoft.ReportingServices.SharePoint.UI.WebParts.ReportViewerWebPart
     $webpart.Title="$PageName"
     $webpart.ChromeType = "None"
     #$webpart
     $webpart.ReportPath = $ReportLocation
     $webpart.Height = "650px"
     #$webpart
     $WebPartManager.AddWebPart($webpart, "Header", 1);

    #endregion

    #region Quickfilter
      [System.Web.HttpContext]::Current = $null

      #[Microsoft.SharePoint.SPList]$wpList = $spWeb.Site.GetCatalog([Microsoft.SharePoint.SPListTemplateType]::WebPartCatalog)
      #
      #
      #$qsWebPart =   $wpList.Items | ? { $_.Name -eq "QueryStringFilter.webpart"} #     > "Web.txt"
      #$qsWebPart.Title = "qsIndicatorID"
      #$qsWebPart

      $filterWebpart = new-object  Microsoft.SharePoint.Portal.WebControls.QueryStringFilterWebPart
      $filterWebpart.FilterName = "qsIndicator"
      $filterWebpart.Title = "qsIndicator"
      $filterWebpart.QueryStringParameterName = "qsIndicatorID"
       
      $WebPartManager.AddWebPart($filterWebpart, "Row 1", 1);

      $conWP = $WebPartManager.GetConsumerConnectionPoints($webpart)[1]
      #[1] gets us parameter
      $conWP

      $provWP = $WebPartManager.GetProviderConnectionPoints($filterWebpart)[0]
      #[0] is the filter value. 1 is the default value
      $provWP

       #http://blog.repsaj.nl/index.php/2010/05/sp2010-programmatically-creating-a-web-part-page-with-connected-webparts/
      #TransformableFilterValuesToEntityInstanceTransformer
      #TransformableFilterValuesToFieldTransformer
      #TransformableFilterValuesToFilterValuesTransformer
      #TransformableFilterValuesToParametersTransformer
      #SPRowToParametersTransformer 
      #TransformableBIDataProviderTransformer 
      #??? FilterValuesToTransformableFilterValuesTransformer

      #$trans = New-Object Microsoft.SharePoint.WebPartPages.SPRowToParametersTransformer   
      #$trans.ConsumerFieldNames = @()
      #$field = "Indicator_ID";
      #$trans.ConsumerFieldNames += ,$field;   
      #$trans.ProviderFieldNames    = @()
      #$field = "Title";
      #$trans.ProviderFieldNames += ,$field;      

      $trans = New-Object Microsoft.SharePoint.WebPartPages.TransformableFilterValuesToFilterValuesTransformer
      $trans.MappedConsumerParameterName = "Indicator_ID";
      $trans
      $newCon = $WebPartManager.SPConnectWebParts($filterWebpart,$provWP,$webpart,$conWP, $trans)   
      $WebPartManager.SPWebPartConnections.Add($newCon);   
       Write-Host $WebPartManager.SPWebPartConnections



      $filterWebpart = new-object  Microsoft.SharePoint.Portal.WebControls.QueryStringFilterWebPart
      $filterWebpart.FilterName = "qsDataVersion"
      $filterWebpart.Title = "qsDataVersion"
      $filterWebpart.QueryStringParameterName = "qsDataVersionID"
      $filterWebpart.DefaultValue = "1"
       

      $WebPartManager.AddWebPart($filterWebpart, "Row 1", 1);


     #
    #endregion

#endregion
 


 #Microsoft.ReportingServices.SharePoint.UI.WebParts.ReportViewerWebPart
 


#$page.CheckIn("$PageName")   
$spWeb.Close()



 