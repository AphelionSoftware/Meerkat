<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SampleWebApplication._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <script type="text/javascript" src="jquery-1.3.2.min.js"></script>
    <script src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2" type="text/javascript"></script>
    <script type="text/javascript" src="SampleJScript.js"></script>
    <title>GeoJSON Sample Web Application</title>
</head>
<body>
    <form id="form1" runat="server">
    <input id="showGeoJSON"  type="button" value="Show GeoJSON"  onclick="ShowGeoJSON();"/>
    <div id='myMap' style="position:relative; width:600px; height:400px;">
    </div>
    </form>
</body>
</html>
