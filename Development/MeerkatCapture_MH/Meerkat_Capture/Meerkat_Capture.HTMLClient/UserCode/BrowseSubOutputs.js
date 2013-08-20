/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseSubOutputs.ShowHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element);    
};

myapp.BrowseSubOutputs.AddOutputStatusValue_execute = function (screen) {
    screen.getSubOutputs().then(function (suboutputs) {
        var data = {};

        if (suboutputs.selectedItem !== undefined) {
            data.SubOutput = suboutputs.selectedItem;
        } else {
            data.DataType = "SubOutput";
        }

        myapp.showAddEditStatusValue(undefined, data, {});
    });
};