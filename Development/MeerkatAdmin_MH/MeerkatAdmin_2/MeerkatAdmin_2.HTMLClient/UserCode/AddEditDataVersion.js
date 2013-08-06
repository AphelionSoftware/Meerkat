/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataVersion.DataVersion_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.DataVersion, "Data Version");
};

myapp.AddEditDataVersion.DataVersion_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.DataVersion);
};