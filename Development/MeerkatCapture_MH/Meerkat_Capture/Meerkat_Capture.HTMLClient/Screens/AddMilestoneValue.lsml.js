/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />


myapp.AddMilestoneValue.created = function (screen) {
    if (screen.MilestoneValue === undefined) {
        screen.MilestoneValue = new myapp.MilestoneValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);
    msls.application.lightswitchTools.configureCaptureForm(screen);
    
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRange = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriods.load().then(function () {
                screen.MilestoneValue.setReportingPeriod(reportingPeriod.results[0]);
            });
        });
    });

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneId).execute().then(function (result) {
        var mileStone = result.results[0];
        screen.MilestoneValue.setMilestone(mileStone);
    });
};

myapp.AddMilestoneValue.SearchOrganizationsTap_execute = function (screen) {
    screen.MilestoneValue.Organization = screen.Organizations.selectedItem;
    screen.closePopup();
};

myapp.AddMilestoneValue.SelectedLocationsTap_execute = function (screen) {
    screen.MilestoneValue.Location = screen.Locations.selectedItem;
    screen.closePopup();
};