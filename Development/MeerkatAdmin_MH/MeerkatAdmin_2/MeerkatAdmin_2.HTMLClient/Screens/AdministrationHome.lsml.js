/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AdministrationHome.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })
};

myapp.AdministrationHome.created = function (screen) {
    if (document.location.hostname.toLocaleLowerCase() === "localhost") {    
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
    }
};