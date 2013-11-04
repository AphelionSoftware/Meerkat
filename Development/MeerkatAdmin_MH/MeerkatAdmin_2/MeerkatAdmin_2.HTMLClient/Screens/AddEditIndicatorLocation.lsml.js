/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);  
};

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditIndicatorLocation.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};