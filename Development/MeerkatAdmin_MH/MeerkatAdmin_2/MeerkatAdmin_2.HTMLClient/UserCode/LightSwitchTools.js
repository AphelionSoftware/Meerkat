/// <reference path="../GeneratedArtifacts/viewModel.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    lightswitchTools.configureCaptureForm = function (screen) {
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

            var activeTypeDropDown = screen.findContentItem("ActiveType");

            if (activeTypeDropDown !== undefined) {
                activeTypeDropDown.isVisible = false;
            }

            screen.details.dataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
                activeType = x.results[0];
            }, function (x) {
                msls.showMessageBox(x, {
                    title: "Default value for ActiveType failed"
                });
            });


            return;
        } else {
            screen.details.displayName = "Edit " + name;

            var newDataWorkspace = new myapp.DataWorkspace();
            newDataWorkspace.MeerkatData.IndicatorTypes_SingleOrDefault(primaryKey).execute().then(function (result) {

                var serverValue = result.results[0];
                if (serverValue !== undefined) {
                    // Replace the raw JSON object representing the
                    // IndicatorType.
                    screen[name].details._ = serverValue.details._;

                    // Raise changes notification for all storage
                    // properties, so the UI can update.
                    screen[name].details.properties.all().forEach(
                    function (prop) {
                        if (prop instanceof
                            msls.Entity.Details.StorageProperty) {
                            // The property's value.
                            prop.dispatchChange("value");
                            // The entity's property value.
                            IndicatorType.dispatchChange(prop.name);
                        }
                    });
                }


            }, function (error) {
                msls.showMessageBox(error, {
                    title: "Data Refresh failed"
                });
            });
        }

    }

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

        //entity.deleteEntity();
        var activeType = screen[entityLabel].ActiveType;
        screen.details.dataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Deleted'").execute().then(function (x) {
            activeType = x.results[0];
        }, function (x) {
            console.log(x);
        });

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

