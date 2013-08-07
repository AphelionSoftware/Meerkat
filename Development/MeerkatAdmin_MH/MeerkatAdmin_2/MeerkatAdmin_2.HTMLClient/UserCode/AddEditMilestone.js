/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditMilestone.Milestone_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Milestone, "Activity");
};
myapp.AddEditMilestone.Milestone_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.Milestone);
};