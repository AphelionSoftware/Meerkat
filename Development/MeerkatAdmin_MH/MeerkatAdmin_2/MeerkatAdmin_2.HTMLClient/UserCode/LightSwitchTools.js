/// <reference path="../GeneratedArtifacts/viewModel.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    lightswitchTools.configureCaptureForm = function(screen) {
        var name = screen.details.getModel().properties[0].name;

        var primaryKeyColumn;
        var properties = screen.details.getModel().properties[0].elementType.properties;

        $.each(properties, function (index, property) {
            if (property.__isKeyProperty === 1) {
                primaryKeyColumn = property.name;
                return false;
            }
        });

        var primaryKey = screen[name][primaryKeyColumn];
        var activeType = screen[name].ActiveType;

        if (primaryKey === undefined) {
            screen.details.displayName = "Add " + name;

            screen[name].sys_CreatedBy = "NA";
            screen[name].sys_CreatedOn = "1999/01/01";
            screen[name].sys_ModifiedBy = "NA";
            screen[name].sys_ModifiedOn = "1999/01/01";

            screen.findContentItem("ActiveType").isVisible = false;

            screen.details.dataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
                activeType = x.results[0];
            }, function (x) {
                console.log(x);
            });

            return;
        }

        screen.details.displayName = "Edit " + name;
    };

    lightswitchTools.canDelete = function (screen) {
        var name = screen.details.getModel().properties[0].name;
        var entity = screen[name];
        if (entity.details.entityState !== msls.EntityState.unchanged) {
            return false;
        };

        return true;
    };

    lightswitchTools.deleteEntity = function (screen) {
        var entityLabel = screen.details.getModel().properties[0].name;
        var entity = screen[entityLabel];
        if (!lightswitchTools.canDelete(entity)) {
            return msls.showMessageBox(
                "Cannot delete the " + entityLabel + " because it was changed.",
                {
                    title: "Cannot delete"
                });
        };

        entity.deleteEntity();

        myapp.commitChanges().then(null, function fail(e) {
            // If error occurs, show the error.
            msls.showMessageBox(e.message, { title: e.title }).then(function () {
                // Discard Changes
                screen.details.dataWorkspace.ApplicationData.details.discardChanges();
            });
        });
    }

    lightswitchTools.getVersionInfo = function (callback) {
        $.getJSON("/api/LightswitchHelpers", function (data) {
            callback("version: " + data.Version + " (built " + data.Deployed + ")");
        });
    }
    
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));

