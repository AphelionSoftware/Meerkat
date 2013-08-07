/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorType.IndicatorType_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.IndicatorType, "Indicator Type");
};

myapp.AddEditIndicatorType.IndicatorType_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.IndicatorType);
};