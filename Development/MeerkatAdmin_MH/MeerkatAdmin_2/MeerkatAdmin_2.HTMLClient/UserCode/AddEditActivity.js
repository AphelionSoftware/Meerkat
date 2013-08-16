/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditActivity.Activity_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditActivity.Activity_Delete_canExecute = function (screen) {
    msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditActivity.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditActivity.Method_execute = function (screen) {
    // Write code here.

};