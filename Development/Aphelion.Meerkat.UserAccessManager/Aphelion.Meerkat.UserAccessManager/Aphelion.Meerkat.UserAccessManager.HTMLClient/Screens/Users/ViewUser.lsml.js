/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewUser.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.User.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.User." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

