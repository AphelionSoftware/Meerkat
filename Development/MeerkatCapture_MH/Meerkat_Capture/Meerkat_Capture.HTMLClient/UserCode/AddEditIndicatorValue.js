/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorValue.created = function (screen) {
    if (screen.IndicatorValue === undefined || screen.IndicatorValue.IndicatorValues_ID === undefined) {
        screen.details.displayName = "Add Indicator Value";
    } else {
        screen.details.displayName = "Edit Indicator Value";
    }

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.IndicatorId).execute().then(function (result) {
        //bug be here
        var indicator = result.results[0];
        screen.IndicatorValue.setIndicator(indicator);
    });
};