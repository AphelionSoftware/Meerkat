/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseDataSources.ShowAdministrationHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon");
};

myapp.BrowseDataSources.EditDataSource_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseDataSources.EditDataSource_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.AddEditDataSource);
};