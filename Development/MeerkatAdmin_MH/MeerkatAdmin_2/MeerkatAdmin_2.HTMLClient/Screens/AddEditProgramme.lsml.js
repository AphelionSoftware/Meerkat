﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditProgramme.created = function (screen) {
    // Set default values and other configurations.
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};
myapp.AddEditProgramme.Delete_execute_execute = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.deleteEntity(screen);

};