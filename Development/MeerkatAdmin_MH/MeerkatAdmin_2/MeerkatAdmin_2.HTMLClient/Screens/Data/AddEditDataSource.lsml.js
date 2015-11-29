/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditDataSource.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsName(screen);
};
myapp.AddEditDataSource.DataSource_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};
myapp.AddEditDataSource.DataSource_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};