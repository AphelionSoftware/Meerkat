﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/jquery-1.9.1.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    lightswitchTools.setCommonAddScreenValues = function(screen) {
        var name = screen.details.getModel().properties[0].name;
        var thisObject = screen[name];

        var actualValueField = screen.findContentItem("ActualValue");
        var actualLabelField = screen.findContentItem("ActualLabel");
        actualValueField.dataBind("value", function () {
            if (actualValueField.value !== undefined && actualValueField.stringValue.length > 0) {
                var currentLength = 0;
                if (actualLabelField.value !== undefined) {
                    currentLength = actualLabelField.stringValue.length;
                }

                if (currentLength === 0) {
                    actualLabelField.stringValue = actualValueField.stringValue;
                }
            }
        });

        thisObject.ActualDate = new Date();
        // MGS 2013/09/32
        /// Setting data version to 0 by default doesn't work! For demo purposes needs to be 1 as that is what the reports show
        myapp.activeDataWorkspace.MeerkatData.DataVersions_SingleOrDefault(1).execute().then(function (results) {
        //myapp.activeDataWorkspace.MeerkatData.DataVersions_SingleOrDefault(0).execute().then(function (results) {
            var dataVersion = results.results[0];
            thisObject.setDataVersion(dataVersion);
        });

        myapp.activeDataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
            //thisObject.setActiveType(x.results[x]);
            // MGS 2013/09/32
            //x.results[x] will always be undefined. Instead we want the single result that should return, position 0
            thisObject.setActiveType(x.results[0]);
        }, function (x) {
            msls.showMessageBox(x, {
                title: "Default value for ActiveType failed"
            });
        });
    }

    lightswitchTools.homeIcon = function (element) {
        $(element).addClass("customHomeIcon");
    }

    lightswitchTools.copyIcon = function (element) {
        $(element).addClass("customCopyIcon");
    }

    lightswitchTools.getVersionInfo = function (callback) {
        $.getJSON("../api/LightswitchHelpers", function (data) {
            callback("version: " + data.Version + " (built " + data.Deployed + ")");
        });
    }
    
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));
