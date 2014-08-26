/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseDataVersions.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseDataVersions.EditDataVersion_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseDataVersions.EditDataVersion_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditDataVersion);

};