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

        var thisObject = screen[name];
        var primaryKey = thisObject[primaryKeyColumn];
        var activeType = thisObject.ActiveType;

        if (primaryKey === undefined) {
            screen.details.displayName = "Add " + name;

            thisObject.sys_CreatedBy = "NA";
            thisObject.sys_CreatedOn = "1999/01/01";
            thisObject.sys_ModifiedBy = "NA";
            thisObject.sys_ModifiedOn = "1999/01/01";

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
            newDataWorkspace.MeerkatData[name + "s"].filter(primaryKeyColumn + " eq " + primaryKey).execute().then(function (result) {

                var serverValue = result.results[0];
                if (serverValue !== undefined) {
                    var detailsProperties = thisObject.details.properties.all();
                    var foundChanges = false;
                    $.each(detailsProperties, function (index, property) {
                        var propertyName = property.name;

                        if ((property instanceof msls.Entity.Details.StorageProperty) &&
                            (propertyName[0] !== '_') &&
                            (propertyName.substring(0,3) !== 'sys')) {
                            var diffFound = false;

                            if (thisObject.details._[propertyName] instanceof Date) {
                                diffFound = (thisObject.details._[propertyName].toString() !== serverValue.details._[propertyName].toString());
                            } else {
                                diffFound = (thisObject.details._[propertyName] !== serverValue.details._[propertyName]);
                            }

                            if (diffFound) {
                                // we found a real property that has different values.
                                console.log("Detected that " + propertyName + " has changed");
                                thisObject.details._[propertyName] = serverValue.details._[propertyName];
                                property.dispatchChange("value");
                                thisObject.dispatchChange(propertyName);
                                foundChanges = true;
                            }
                        }
                    });

                    if (foundChanges) {
                        thisObject.details._.__metadata.etag = serverValue.details._.__metadata.etag;
                    }
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

