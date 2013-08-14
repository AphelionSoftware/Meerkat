/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditProject.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
}

myapp.AddEditProject.Project_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditProject.Project_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};