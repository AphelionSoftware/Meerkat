/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditImpact.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};
myapp.AddEditImpact.Delete_execute_execute = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.deleteEntity(screen);

};