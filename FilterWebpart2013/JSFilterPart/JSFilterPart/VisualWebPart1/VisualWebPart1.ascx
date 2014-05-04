<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1.ascx.cs" Inherits="JSFilterPart.VisualWebPart1.VisualWebPart1" %>
<!DOCTYPE
html>

<html>

<head>
  
<title></title>
    <script src="../_layouts/15/JSFilterPart/JS/jquery-1.9.1.js"></script>
    <script src="../_layouts/15/JSFilterPart/JS/jquery-ui-1.10.3.custom.js"></script>
    <link href="../_layouts/15/JSFilterPart/CSS/ui-lightness/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script type="text/javascript" >
     
        $(function () {
            if (typeof FilterValues == 'undefined') {

                FilterValues = [];

            }
           /* var FilterValues = [
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
            ];*/

            $("#<%= Filter.ClientID %>").autocomplete({
                source: FilterValues,
                focus: function (event, ui) {
                    $("#<%= Filter.ClientID %>").val(ui.item.value);
                    return false;
                },
                select: function (event, ui) {
                    $("#<%= HiddenFilterValue.ClientID %>").val(ui.item.ID);
                    return false;
                }
            });
           
        });
    </script>
    </head>
    <body>
        <asp:TextBox ID="Filter" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="FilterButton" runat="server" Text="Filter" OnClick="FilterButton_Click" />

        <asp:HiddenField ID="HiddenFilterValue" runat="server" />

    </body>
    </html>
