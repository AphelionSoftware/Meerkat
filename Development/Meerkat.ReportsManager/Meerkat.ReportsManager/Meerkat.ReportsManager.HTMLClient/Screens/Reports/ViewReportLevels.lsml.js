/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewReportLevels.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.IndicatorType.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.IndicatorType." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

