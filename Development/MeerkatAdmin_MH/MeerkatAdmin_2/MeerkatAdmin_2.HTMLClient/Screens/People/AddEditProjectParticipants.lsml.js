/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditProjectParticipants.created = function (screen) {
    // Set default values and other configurations.
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsName(screen);
};
myapp.AddEditProjectParticipants.Delete_execute_execute = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.deleteEntity(screen);

};