/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditActivity.Activity_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditActivity.Activity_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditActivity.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditActivity.AddProjectStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Activity: screen.Activity,
        Type: "Project"
    });
};

myapp.AddEditActivity.EditStatusValues_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Project");
};