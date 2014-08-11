/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditLocationType.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditLocationType.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    //msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    //msls.application.lightswitchTools.setDescriptionIsName(screen);
};