/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />


myapp.BrowseIndicators.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseIndicators.EditIndicator_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseIndicators.EditIndicator_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditIndicator);
};