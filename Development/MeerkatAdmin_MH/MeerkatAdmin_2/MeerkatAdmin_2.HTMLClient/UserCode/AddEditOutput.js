/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOutput.Output_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Output, "Activity");
};
myapp.AddEditOutput.Output_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.Output);
};