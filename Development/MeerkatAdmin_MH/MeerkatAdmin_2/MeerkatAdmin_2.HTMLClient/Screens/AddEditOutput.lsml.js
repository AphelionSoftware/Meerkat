/// <reference path="../GeneratedArtifacts/viewModel.js" />

'use strict';

myapp.AddEditOutput.Output_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditOutput.Output_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditOutput.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditOutput.AddOutputStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Output: screen.Output,
        Type: "Output"
    });
};

myapp.AddEditOutput.EditStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Output");
};

myapp.AddEditOutput.OutcomesPopupItemTap_execute = function (screen) {
    screen.Output.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};

