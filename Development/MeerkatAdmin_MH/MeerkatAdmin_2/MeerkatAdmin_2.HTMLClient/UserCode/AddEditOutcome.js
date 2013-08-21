/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditOutcome.Outcome_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditOutcome.Outcome_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditOutcome.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditOutcome.AddOutputStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Outcome: screen.Outcome,
        Type: "Output"
    });
};

myapp.AddEditOutcome.EditStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen);
};

myapp.AddEditOutcome.AddProjectStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Outcome: screen.Outcome,
        Type: "Project"
    });
};