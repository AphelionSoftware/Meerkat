/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseActivities.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseActivities.EditActivity_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseActivities.EditActivity_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditActivity);
};