/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditMilestoneValue.created = function (screen) {
    if (screen.MilestoneValue.MilestoneValues_ID === undefined) {
        screen.details.displayName = "Add Milestone Value";
    } else {
        screen.details.displayName = "Edit Milestone Value";
    }

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneId).execute().then(function (result) {
        var milestone = result.results[0];
        screen.MilestoneValue.setMilestone(milestone);
    });
};