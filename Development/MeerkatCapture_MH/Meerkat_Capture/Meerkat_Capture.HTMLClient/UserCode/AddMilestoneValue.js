/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />


myapp.AddMilestoneValue.created = function (screen) {
    if (screen.MilestoneValue === undefined) {
        screen.MilestoneValue = new myapp.MilestoneValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);
    
    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneId).execute().then(function (result) {
        var mileStone = result.results[0];
        screen.MilestoneValue.setMilestone(mileStone);
    });
};