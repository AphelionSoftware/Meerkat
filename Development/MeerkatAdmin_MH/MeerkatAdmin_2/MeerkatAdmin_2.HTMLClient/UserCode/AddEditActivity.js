/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditActivity.Activity_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Activity, "Activity");
};

myapp.AddEditActivity.Activity_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.Activity);
};