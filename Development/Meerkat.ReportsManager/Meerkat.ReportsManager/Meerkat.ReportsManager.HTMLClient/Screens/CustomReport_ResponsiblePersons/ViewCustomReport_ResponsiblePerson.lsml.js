/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewCustomReport_ResponsiblePerson.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.CustomReport_ResponsiblePerson.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.CustomReport_ResponsiblePerson." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

