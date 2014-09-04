/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewSystemRole.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.SystemRole.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.SystemRole." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

