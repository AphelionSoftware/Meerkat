/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewCustomReport.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.CustomReport.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.CustomReport." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

