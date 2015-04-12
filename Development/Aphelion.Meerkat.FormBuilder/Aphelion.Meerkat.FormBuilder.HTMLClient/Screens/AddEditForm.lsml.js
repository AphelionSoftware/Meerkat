/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditForm.created = function (screen) {
    // Set Active Types
   var primaryKey = msls.application.lightswitchTools.configureCaptureForm(screen);
    if (primaryKey === undefined) {
        screen.Form.isConfidential = false;
        screen.Form.isComplete = false;
    }
    //screen.Form.setIsConfidential(false);
    msls.application.lightswitchTools.setDescriptionIsName(screen);
    
};