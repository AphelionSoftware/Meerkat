/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/jquery-1.9.1.js" />

(function (lightswitchTools, undefined) {
    "use strict";
    //Set Plurals
    function pluralName(name) {
        if (name == "Person") {
            return "People";
        }
        var pluralled = name + "s";

        if (name.charAt(name.length - 1).toLocaleLowerCase() === 'y') {
            //activity
            //activities
            pluralled = name.substring(0, name.length - 1) + "ies";
        }

        return pluralled;
    }

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
            if (screen.pageTitle !== undefined) {
                screen.details.displayName = "Add " + screen.pageTitle;
            } else {
                screen.details.displayName = "Add " + name;
            }

            thisObject.sys_CreatedBy = "NA";
            thisObject.sys_CreatedOn = "1999/01/01";
            thisObject.sys_ModifiedBy = "NA";
            thisObject.sys_ModifiedOn = "1999/01/01";
            thisObject.IndicatorValueGroup = "92348bc8-685e-4cd6-b22d-d6b950ac7b53";

            var activeTypeDropDown = screen.findContentItem("ActiveType");

            if (activeTypeDropDown !== undefined) {
                activeTypeDropDown.isVisible = false;
            }

            screen.details.dataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
                thisObject.setActiveType(x.results[0]);
            }, function (x) {
                msls.showMessageBox(x, {
                    title: "Default value for ActiveType failed"
                });
            });


            return;
        } else {
            if (screen.pageTitle !== undefined) {
                screen.details.displayName = "Edit " + screen.pageTitle;
            } else {
                screen.details.displayName = "Edit " + name;
            }

            var newDataWorkspace = new myapp.DataWorkspace();
            newDataWorkspace.MeerkatData[pluralName(name)].filter(primaryKeyColumn + " eq " + primaryKey).execute().then(function (result) {

                var serverValue = result.results[0];
                if (serverValue !== undefined) {
                    var detailsProperties = thisObject.details.properties.all();
                    var foundChanges = false;
                    $.each(detailsProperties, function (index, property) {
                        var propertyName = property.name;

                        if ((property instanceof msls.Entity.Details.StorageProperty) &&
                            (propertyName[0] !== '_') &&
                            (propertyName.substring(0, 3) !== 'sys')) {
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
    
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));

