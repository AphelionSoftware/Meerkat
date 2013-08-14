/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddIndicatorValue.created = function (screen) {

    if (screen.IndicatorValue === undefined) {
        screen.IndicatorValue = new myapp.IndicatorValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.IndicatorId).execute().then(function (result) {
        var indicator = result.results[0];
        screen.IndicatorValue.setIndicator(indicator);
    });
};