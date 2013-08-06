/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataSource.DataSource_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.DataSource, "Activity");
};
myapp.AddEditDataSource.DataSource_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.DataSource);
};