/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOutcome.Outcome_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Outcome, "Activity");
};
myapp.AddEditOutcome.Outcome_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.Outcome);
};