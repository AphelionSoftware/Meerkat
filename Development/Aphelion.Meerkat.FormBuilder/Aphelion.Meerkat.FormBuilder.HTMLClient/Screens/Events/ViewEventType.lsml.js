/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewEventType.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.EventType.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.EventType." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

