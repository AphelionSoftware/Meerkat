/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.BrowseActivities.ShowHome_postRender = function (element, contentItem) {
    $(element).addClass("customHomeIcon")
};

myapp.BrowseActivities.AddProjectStatusValue_execute = function (screen) {
    screen.getActivities().then(function (activity) {
        var data = {};

        if (activity.selectedItem !== undefined) {
            data.Activity = activity.selectedItem;
        } else {
            data.DataType = "Activity";
        }

        myapp.showAddEditStatusValue(undefined, data, {});
    });
};