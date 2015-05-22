Param(
  [string]$site,
  [string]$PageName,
  [string]$ReportLocation
)

$web = Get-SPWeb $site
$listname = "Dashboards"
	$wpm = $web.GetLimitedWebPartManager("$listname/$PageName.aspx", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)

	[Reflection.Assembly]::LoadWithPartialName("Microsoft.ReportingServices.SharePoint.UI.WebParts")
	[Reflection.Assembly]::LoadWithPartialName("System.Web")
	[Reflection.Assembly]::LoadWithPartialName("System.IO")
	[Reflection.Assembly]::LoadWithPartialName("System.Collections.Generic")
	[System.Web.HttpRequest] $request = new-object System.Web.HttpRequest("",$web.Url,"")
	$response = new-object System.Web.HttpResponse([System.IO.TextWriter]::Null);
	[System.Web.HttpContext]::Current = new-object System.Web.HttpContext($request,$response)
	[System.Web.HttpContext]::Current.Request.Browser = new-object System.Web.HttpBrowserCapabilities
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities = new-object 'System.Collections.Generic.Dictionary[string,string]'
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["type"] = "IE7";
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["majorversion"] = "7";
	[System.Web.HttpContext]::Current.Request.Browser.Capabilities["minorversion"] = "0"
	[System.Web.HttpContext]::Current.Items["HttpHandlerSPWeb"] = [Microsoft.SharePoint.SPWeb]$web;
	$wp = new-object Microsoft.ReportingServices.SharePoint.UI.WebParts.ReportViewerWebPart
	$web.AllowUnsafeUpdates = $true
	$page = $web.GetFile("$PageName")

	$wp.ReportPath = "$ReportLocation"
	$wpm.AddWebPart($wp,"Header",1)
	$wpm.SaveChanges($wp)
	$wpm.Dispose()
	$web.Dispose()
 [System.Web.HttpContext]::Current = $null

# .\TestScript.ps1 -site "http://mgs-m6700/sites/Meerkat/Outcome1/" -PageName "IndicatorMapPage" -ReportLocation "http://mgs-m6700/sites/Meerkat/Reports/ValueReports/ProjectReach.rdl"

