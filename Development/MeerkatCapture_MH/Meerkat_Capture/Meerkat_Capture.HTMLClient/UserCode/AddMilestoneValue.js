/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />


myapp.AddMilestoneValue.created = function (screen) {
    if (screen.MilestoneValue === undefined) {
        screen.MilestoneValue = new myapp.MilestoneValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);
    
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MilestoneValue.setReportingPeriod(reportingPeriod.results[0]);
        });
    });

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneId).execute().then(function (result) {
        var mileStone = result.results[0];
        screen.MilestoneValue.setMilestone(mileStone);
    });
};