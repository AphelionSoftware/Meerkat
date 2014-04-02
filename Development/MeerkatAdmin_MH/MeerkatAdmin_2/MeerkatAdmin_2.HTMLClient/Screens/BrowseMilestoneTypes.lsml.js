/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseMilestoneTypes.ShowAdministrationHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseMilestoneTypes.EditMilestoneType_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditMilestoneType);
};

myapp.BrowseMilestoneTypes.EditMilestoneType_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};