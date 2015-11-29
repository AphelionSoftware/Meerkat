<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoCompleteFilter.ascx.cs" Inherits="FoundationAutoCompleteFilter.AutoCompleteFilter.JSAutoCompleteFilterX" %>
<!DOCTYPE
html>

<html>

<head>
  
<title></title>
    <script src="../_layouts/15/FoundationAutoCompleteFilter/js/jquery-1.9.1.js"></script>
    <script src="../_layouts/15/FoundationAutoCompleteFilter/js/jquery-ui-1.10.3.custom.js"></script>
    <link href="../_layouts/15/FoundationAutoCompleteFilter/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script type="text/javascript" >
     
        $(function () {
            alert('inside');
            var FilterValues = [
     "ActionScript",
     "AppleScript",
     "Asp",
     "BASIC",
     "C",
     "C++",
     "Clojure",
     "COBOL",
     "ColdFusion",
     "Erlang",
     "Fortran",
     "Groovy",
     "Haskell",
     "Java",
     "JavaScript",
     "Lisp",
     "Perl",
     "PHP",
     "Python",
     "Ruby",
     "Scala",
     "Scheme"
            ];
        $( "#Filter" ).autocomplete({
            source: FilterValues
            });
        });

    </script>
    </head>
    <body>
        <asp:TextBox ID="Filter" runat="server"></asp:TextBox>



    </body>
    </html>
