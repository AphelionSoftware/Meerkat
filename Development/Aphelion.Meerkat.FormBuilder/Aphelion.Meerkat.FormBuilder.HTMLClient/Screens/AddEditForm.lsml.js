/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditForm.created = function (screen) {
    // Set Active Types
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.Form.isConfidential = false;
    screen.Form.isComplete = false;
};