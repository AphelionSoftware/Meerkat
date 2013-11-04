/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddIndicatorValue.created = function (screen) {

    if (screen.IndicatorValue === undefined) {
        screen.IndicatorValue = new myapp.IndicatorValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);

    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.IndicatorValue.setReportingPeriod(reportingPeriod.results[0]);
        });
    });

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.IndicatorId).execute().then(function (result) {
        var indicator = result.results[0];
        screen.IndicatorValue.setIndicator(indicator);
    });
};
