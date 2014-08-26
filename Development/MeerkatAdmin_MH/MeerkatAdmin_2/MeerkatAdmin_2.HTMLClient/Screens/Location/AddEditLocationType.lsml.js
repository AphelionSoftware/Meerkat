/// <reference path="../GeneratedArtifacts/viewModel.js" />
///  <reference path="LightSwitchTools.js" />

myapp.AddEditLocationType.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
    //msls.application.lightswitchTools.deleteObject(screen, screen.LocationType);
};

myapp.AddEditLocationType.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsName(screen);
};