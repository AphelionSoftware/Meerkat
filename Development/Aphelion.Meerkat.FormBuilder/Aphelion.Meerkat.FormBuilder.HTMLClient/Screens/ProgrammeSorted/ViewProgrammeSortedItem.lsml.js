/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewProgrammeSortedItem.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.Programme.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.Programme." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

