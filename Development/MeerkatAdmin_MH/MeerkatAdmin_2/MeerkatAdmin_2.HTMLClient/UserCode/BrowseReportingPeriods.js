/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseReportingPeriods.ShowAdministrationHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon");
};

myapp.BrowseReportingPeriods.EditReportingPeriod_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditReportingPeriod);
};

myapp.BrowseReportingPeriods.EditReportingPeriod_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};