/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseOutputs.ShowHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseOutputs.AddOutputStatusValue_execute = function (screen) {
    screen.getOutputs().then(function (outputs) {
        var data = {};

        if (outputs.selectedItem !== undefined) {
            data.Output = outputs.selectedItem;            
        } else {
            data.DataType = "Output";
        }

        myapp.showAddEditStatusValue(undefined, data, {});
    });
};