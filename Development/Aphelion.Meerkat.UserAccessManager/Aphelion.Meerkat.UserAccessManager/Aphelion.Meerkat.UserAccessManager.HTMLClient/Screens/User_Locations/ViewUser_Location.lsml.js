/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewUser_Location.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.User_Location.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.User_Location." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

