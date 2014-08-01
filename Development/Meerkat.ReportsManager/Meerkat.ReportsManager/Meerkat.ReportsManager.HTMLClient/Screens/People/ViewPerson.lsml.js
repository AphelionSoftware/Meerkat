/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewPerson.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.Person.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.Person." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

