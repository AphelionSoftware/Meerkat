/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.BrowseProjects.ShowHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element);
};

myapp.BrowseProjects.AddProjectStatusValue_execute = function (screen) {
    screen.getProjects().then(function (projects) {
        var data = {};

        if (projects.selectedItem !== undefined) {
            data.Project = projects.selectedItem;
        } else {
            data.DataType = "Project";
        }

        myapp.showAddEditStatusValue(undefined, data, {});
    })

};