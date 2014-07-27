/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewCustomReportType.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.CustomReportType.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.CustomReportType." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

