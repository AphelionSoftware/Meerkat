/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditProjectParticipants.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);


    //This should really be done at the data source level
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsFiltered.load().then(function () {
                screen.PeopleReachedValue.setReportingPeriod(reportingPeriod.results[0]);
            });
        });
    });
};