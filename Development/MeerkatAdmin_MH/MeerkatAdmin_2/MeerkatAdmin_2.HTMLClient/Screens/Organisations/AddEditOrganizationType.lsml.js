/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOrganizationType.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsName(screen);
};

myapp.AddEditOrganizationType.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};