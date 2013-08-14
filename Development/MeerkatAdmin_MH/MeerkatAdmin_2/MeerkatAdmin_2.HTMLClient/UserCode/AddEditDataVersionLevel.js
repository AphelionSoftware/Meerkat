/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />
myapp.AddEditDataVersionLevel.DataVersionLevel_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditDataVersionLevel.DataVersionLevel_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditDataVersionLevel.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};