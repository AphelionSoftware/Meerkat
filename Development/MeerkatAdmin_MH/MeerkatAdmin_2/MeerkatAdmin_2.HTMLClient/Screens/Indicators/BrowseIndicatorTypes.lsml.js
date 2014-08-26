/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseIndicatorTypes.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseIndicatorTypes.EditIndicatorTypes_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditIndicatorType);
};

myapp.BrowseIndicatorTypes.EditIndicatorTypes_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};