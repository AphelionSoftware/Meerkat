/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseLocations.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseLocations.EditLocation_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseLocations.EditLocation_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditLocation);
};