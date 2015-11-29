/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.BrowseRoleMappings1.AddRoleMapping_postRender = function (element, contentItem) {
    // Write code here.

};
myapp.BrowseRoleMappings1.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};