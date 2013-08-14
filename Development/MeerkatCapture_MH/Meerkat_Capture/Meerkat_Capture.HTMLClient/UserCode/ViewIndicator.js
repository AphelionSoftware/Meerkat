/// <reference path="../GeneratedArtifacts/viewModel.js" />


function ShowEditIndicatorScreen(iv, screen) {
    myapp.showAddIndicatorValue(iv, screen.Indicator.IndicatorID, {
        afterClose: function () {
            screen.details.properties.IndicatorValues.load();
        }
    });
}

myapp.ViewIndicator.AddIndicatorValue_execute = function (screen) {
    ShowEditIndicatorScreen(undefined, screen);
};