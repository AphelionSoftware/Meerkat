/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseProjects.ShowAdministrationHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon");
};

myapp.BrowseProjects.EditProject_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditProject);
};

myapp.BrowseProjects.EditProject_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};