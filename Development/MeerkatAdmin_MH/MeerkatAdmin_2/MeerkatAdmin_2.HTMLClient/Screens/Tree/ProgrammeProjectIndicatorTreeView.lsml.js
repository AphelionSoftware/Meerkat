/// <reference path="~/GeneratedArtifacts/viewModel.js" />
/// <reference path="~/Scripts/d3/d3.Treeview.ProgramIndicator.js" />
/// <reference path="~/Scripts/d3/d3.js" />
Scripts / d3 / d3.Treeview.ProgramIndicator.js
myapp.ProgrammeProjectIndicatorTreeView.Treeview_render = function (element, contentItem) {
    div = $("<div class='treeviewDiv' id='treeviewDiv' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData .vwEachPersonsReports._requestUri + "?$format=json";
    treeviewbyUrl(".treeviewDiv", url);


};