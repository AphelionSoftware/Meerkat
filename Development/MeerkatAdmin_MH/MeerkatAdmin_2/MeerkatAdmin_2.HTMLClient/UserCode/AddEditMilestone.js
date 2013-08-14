/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditMilestone.Milestone_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Milestone);
};

myapp.AddEditMilestone.Milestone_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditMilestone.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.Milestone.IsKeyIndicator = false;
};