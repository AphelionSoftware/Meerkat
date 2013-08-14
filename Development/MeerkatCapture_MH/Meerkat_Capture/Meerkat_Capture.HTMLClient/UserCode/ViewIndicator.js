/// <reference path="../GeneratedArtifacts/viewModel.js" />


function ShowEditIndicatorScreen(iv, screen) {
    myapp.showAddEditIndicatorValue(iv, screen.Indicator.IndicatorID, {
        afterClose: function () {
            screen.details.properties.IndicatorValues.load();
        }
    });
}

myapp.ViewIndicator.AddIndicatorValue_execute = function (screen) {
    ShowEditIndicatorScreen(undefined, screen);
};

myapp.ViewIndicator.EditIndicatorValues_execute = function (screen) {
    screen.getIndicatorValues().then(function (x) {
        ShowEditIndicatorScreen(x.selectedItem, screen);
    });
};