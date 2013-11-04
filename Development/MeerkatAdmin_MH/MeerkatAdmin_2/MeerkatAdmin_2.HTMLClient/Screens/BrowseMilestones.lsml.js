/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseMilestones.ShowAdministrationHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon");
};

myapp.BrowseMilestones.EditMilestone_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};

myapp.BrowseMilestones.EditMilestone_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditMilestone);
};