﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.BrowseEventsSorted.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })
};