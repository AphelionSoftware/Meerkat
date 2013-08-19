/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditSubOutput.SubOutput_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditSubOutput.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditSubOutput.SubOutput_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};