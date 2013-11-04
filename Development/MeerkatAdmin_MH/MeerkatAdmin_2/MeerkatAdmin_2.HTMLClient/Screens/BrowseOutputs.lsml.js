/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseOutputs.ShowAdministrationHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon");
};

myapp.BrowseOutputs.EditOutputs_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseOutputs.EditOutputs_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditOutput);
};