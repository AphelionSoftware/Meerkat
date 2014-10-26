/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />


myapp.AddEditc_Event.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);

};
myapp.AddEditc_Event.DeleteEvent_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);

};