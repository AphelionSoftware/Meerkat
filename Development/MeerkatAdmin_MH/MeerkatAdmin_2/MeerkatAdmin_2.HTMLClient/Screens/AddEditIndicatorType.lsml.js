/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditIndicatorType.IndicatorType_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditIndicatorType.IndicatorType_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditIndicatorType.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    //msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
};