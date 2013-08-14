/// <reference path="../GeneratedArtifacts/viewModel.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    lightswitchTools.getVersionInfo = function (callback) {
        $.getJSON("../api/LightswitchHelpers", function (data) {
            callback("version: " + data.Version + " (built " + data.Deployed + ")");
        });
    }
    
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));

