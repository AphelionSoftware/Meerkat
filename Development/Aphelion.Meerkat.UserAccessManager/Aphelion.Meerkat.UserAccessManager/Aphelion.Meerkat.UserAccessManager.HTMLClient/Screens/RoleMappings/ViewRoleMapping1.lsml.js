/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewRoleMapping1.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.User_SystemRole_ProjectProgramme.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.User_SystemRole_ProjectProgramme." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

