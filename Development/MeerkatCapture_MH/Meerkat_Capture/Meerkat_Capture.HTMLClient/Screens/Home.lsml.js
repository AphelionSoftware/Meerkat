﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.Home.VersionNumber_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};

function addStatusValue(screen, type) {
    screen.getOutcomes().then(function (outcomes) {
        var data = {};

        if (outcomes.selectedItem !== undefined) {
            data.Outcome = outcomes.selectedItem;
        }
        else {
            data.DataType = "Outcome";
        }

        data.Type = type;

        myapp.showAddEditStatusValue(undefined, data, {});
    });
}

myapp.Home.AddOutputStatusValue_execute = function (screen) {
    addStatusValue(screen, "Output");
};

myapp.Home.AddProjectStatusValue_execute = function (screen) {
    addStatusValue(screen, "Project");
};