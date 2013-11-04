/// <reference path="../GeneratedArtifacts/viewModel.js" />

function ShowEditMVScreen(mv, screen) {
    myapp.showAddMilestoneValue(mv, screen.Milestone.MilestoneID, {
        afterClose: function () {
            screen.details.properties.MilestoneValues.load();
        }
    });
}

myapp.ViewMilestone.AddMilestoneValue_execute = function (screen) {
    ShowEditMVScreen(undefined, screen);
};

myapp.ViewMilestone.ShowHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element);
};