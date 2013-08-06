/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataVersionLevel.DataVersionLevel_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.DataVersionLevel, "Data Version Level");
};

myapp.AddEditDataVersionLevel.DataVersionLevel_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.DataVersionLevel);
};