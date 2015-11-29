Param(
  [string]$baseURL,
  [string]$SpSite
)
Add-PSSnapin microsoft.sharepoint.powershell
#$baseURL = "http://mgs-m6700"
#$SpSite = "http://mgs-m6700"

#Admin

$URL = $baseURL  + ":300/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/Admin"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)
 #$file.Publish("Updated/Set property of webpart")
#FormBuilder

$URL = $baseURL  + ":310/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/FormBuilder"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)
#FormCapture
$URL = $baseURL  + ":320/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/FormCapture"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)

#Capture
$URL = $baseURL  + ":330/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/Capture"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)

#EventRegister
$URL = $baseURL  + ":340/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/EventRegister"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)

#ReportsManager

$URL = $baseURL  + ":340/HTMLClient"
$web = Get-SPWeb -Identity "$SpSite/ReportsManager"
$rootFolder = $web.RootFolder
$welcomepage = $rootFolder.WelcomePage
$file = $web.GetFile("$welcomepage")
$file.CheckOut()

#WebPart manager
$wpm = $web.GetLimitedWebPartManager("$welcomepage", [System.Web.UI.WebControls.WebParts.PersonalizationScope]::Shared)
foreach($webpart in $wpm.WebParts){
    $webpart.ContentLink = "$URL"
    Write-Host $webpart.ContentLink
    $wpm.SaveChanges($webpart)
}

 $file.CheckIn("Updated/Set property of webpart",1)
