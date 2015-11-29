/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseOutcomes.ShowAdministrationHome_postRender = function (element, contentItem) {
    //$(element).addClass("customHomeIcon");
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseOutcomes.BrowseOutcome_execute = function (screen) {
    msls.application.lightswitchTools.browseAndRefresh(screen, myapp.showAddEditOutcome);
}

myapp.BrowseOutcomes.BrowseOutcome_canExecute = function (screen) {
    return msls.application.lightswitchTools.canBrowse(screen);
};