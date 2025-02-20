﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    function pluralName(name) {
        if (name.substring(0, 2) == "c_") {
            name = name.substring(2, name.length)
        }
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

    lightswitchTools.vis = {};

    lightswitchTools.client = function (screen) {

        myapp.activeDataWorkspace.MeerkatData.GlobalSettings.filter("Code eq 'Client'").execute().then(function (x) {
            lightswitchTools.sClient = x.results[0].Value;
            return lightswitchTools.sClient;
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
        //
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
            return primaryKeyColumn;
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
        if (!lightswitchTools.canDelete(screen)) {
            return msls.showMessageBox(
                "Cannot delete the " + entityLabel + " because it was changed.",
                {
                    title: "Cannot delete"
                });
        };

        msls.showMessageBox("Are you sure you want to delete this record", {
            title: "Confirm",
            buttons: msls.MessageBoxButtons.yesNo

        }).then(function (result) {
            if (result === msls.MessageBoxResult.yes) {
                screen.details.dataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Deleted'").execute().then(function (x) {
                    screen[entityLabel].ActiveType = x.results[0];

                    myapp.commitChanges().then(null,
                    function fail(e) {
                        // If error occurs, show the error.
                        msls.showMessageBox(e.message, { title: e.title }).then(function () {
                            // Discard Changes
                            screen.details.dataWorkspace.ApplicationData.details.discardChanges();
                        });
                    });
                }, function (x) {
                    msls.showMessageBox(e.message, { title: e.title }).then(function () {
                        // Discard Changes
                        screen.details.dataWorkspace.ApplicationData.details.discardChanges();
                    });
                });
            }
        });

    }


    lightswitchTools.getClientCode = function (callback) {
        if (!window.lsData) {
            $.getJSON("/api/LightswitchHelpers", function (data) {
                window.lsData = data;
                callback(data.ClientCode);
            });
        } else {

            callback(window.lsData.ClientCode);
        }
    }


    lightswitchTools.getVersionInfo = function (callback) {
        if (!window.lsData) {
            $.getJSON("/api/LightswitchHelpers", function (data) {
                window.lsData = data;
                callback("version: " + data.Version + " (built " + data.Deployed + ")");
            });
        } else {
            callback("version: " + window.lsData.Version + " (built " + window.lsData.Deployed + ")");

        }
    }

    lightswitchTools.browseAndRefresh = function (screen, target) {
        var selectedItem = screen.details.properties.all()[0].value.selectedItem;

        target(selectedItem, {
            afterClosed: function () {
                screen.details.properties.all()[0].value.load();
            }
        });
    }

    lightswitchTools.canBrowse = function (screen) {
        return screen.details.properties.all()[0].value.selectedItem !== undefined;
    }

    lightswitchTools.editStatusValue = function (screen, type) {
        var data = {};
        if (type !== undefined) {
            data.Type = type;
        }

        screen.getStatusValues().then(function (x) {
            myapp.showAddEditStatusValue(x.selectedItem, data, {
                afterClosed: function () {
                    x.load();
                }
            });
        });
    }

    lightswitchTools.addStatusValue = function (screen, data) {
        myapp.showAddEditStatusValue(undefined, data, {
            afterClosed: function () {
                screen.getStatusValues().then(function (x) {
                    x.load();
                });
            }
        });
    }

    /*lightswitchTools.setCommonDefaults = function (screen) {
        var name = screen.details.getModel().properties[0].name;
        var thisObject = screen[name];

        var CodeField = screen.findContentItem("Code");
        var BusinessKeyField = screen.findContentItem("BusinessKey");
        var NameField = screen.findContentItem("Name");
        var ShortNameField = screen.findContentItem("ShortName")
        var TextDescriptionField = screen.findContentItem("TextDescription");
        CodeField.dataBind("value", function () {
            if (CodeField.value !== undefined && CodeField.stringValue.length > 0) {
                var currentLength = 0;
                if (BusinessKeyField.value !== undefined) {
                    currentLength = BusinessKeyField.stringValue.length;
                }

                if (currentLength === 0) {
                    BusinessKeyField.stringValue = CodeField.stringValue;
                }
            }
        });

        NameField.dataBind("value", function () {
            if (NameField.value !== undefined && NameField.stringValue.length > 0) {
                var currentLength = 0;
                if (TextDescriptionField.value !== undefined) {
                    currentLength = TextDescriptionField.stringValue.length;
                }

                if (currentLength === 0) {
                    TextDescriptionField.stringValue = NameField.stringValue;
                }
            }
        });

        ShortNameField.dataBind("value", function () {
            if (ShortNameField.value !== undefined && ShortNameField.stringValue.length > 0) {
                var currentLength = 0;
                if (TextDescriptionField.value !== undefined) {
                    currentLength = TextDescriptionField.stringValue.length;
                }

                if (currentLength === 0) {
                    TextDescriptionField.stringValue = ShortNameField.stringValue;
                }
            }
        });
    }*/

    lightswitchTools.setDescriptionIsName = function (screen) {
        //var name = screen.details.getModel().properties[0].name;
        //var thisObject = screen[name];

        var NameField = screen.findContentItem("Name");
        var DescriptionField = screen.findContentItem("Description");
        var TextDescriptionField = screen.findContentItem("TextDescription");
        if (NameField && (DescriptionField || TextDescriptionField)) {
            NameField.dataBind("value", function () {
                if (NameField.value !== undefined && NameField.value.length > 0 && TextDescriptionField !== undefined) {
                    var currentLength = 0;
                    if (TextDescriptionField.value !== undefined) {
                        currentLength = TextDescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        TextDescriptionField.value = NameField.value;
                    }
                }

                if (NameField.value !== undefined && NameField.value.length > 0 && DescriptionField !== undefined) {
                    var currentLength = 0;
                    if (DescriptionField.value !== undefined) {
                        currentLength = DescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        DescriptionField.value = NameField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.setDescriptionIsShortName = function (screen) {
        var name = screen.details.getModel().properties[0].name;
        var thisObject = screen[name];

        var ShortNameField = screen.findContentItem("ShortName");
        var LongNameField = screen.findContentItem("LongName");
        var DescriptionField = screen.findContentItem("Description");
        var TextDescriptionField = screen.findContentItem("TextDescription");
        if (ShortNameField && (DescriptionField || TextDescriptionField || LongNameField)) {
            ShortNameField.dataBind("value", function () {
                if (ShortNameField.value !== undefined && ShortNameField.value.length > 0 && TextDescriptionField !== undefined) {
                    var currentLength = 0;
                    if (TextDescriptionField.value !== undefined) {
                        currentLength = TextDescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        TextDescriptionField.value = ShortNameField.value;
                    }
                }

                if (ShortNameField.value !== undefined && ShortNameField.value.length > 0 && DescriptionField !== undefined) {
                    var currentLength = 0;
                    if (DescriptionField.value !== undefined) {
                        currentLength = DescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        DescriptionField.value = ShortNameField.value;
                    }
                }

                if (ShortNameField.value !== undefined && ShortNameField.value.length > 0 && LongNameField !== undefined) {
                    var currentLength = 0;
                    if (LongNameField.value !== undefined) {
                        currentLength = LongNameField.value.length;
                    }

                    if (currentLength === 0) {
                        LongNameField.value = ShortNameField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.setBusinessKeyIsCode = function (screen) {
        var name = screen.details.getModel().properties[0].name;
        var thisObject = screen[name];

        /*var object = screen.name;

        if (object === undefined) {
            object = new myapp.name();
        }*/

        var CodeField = screen.findContentItem("Code");
        var BusinessKeyField = screen.findContentItem("BusinessKey");
        CodeField.dataBind("value", function () {
            if (CodeField.value !== undefined && CodeField.value.length > 0) {
                var currentLength = 0;
                if (BusinessKeyField.value !== undefined) {
                    currentLength = BusinessKeyField.value.length;
                }

                if (currentLength === 0) {
                    BusinessKeyField.value = CodeField.value;
                }
            }
        });
    }

    lightswitchTools.setBusinessKeyIsName = function (screen) {
        //var name = screen.details.getModel().properties[0].name;
        //var thisObject = screen[name];

        var NameField = screen.findContentItem("Name");
        var BusinessKeyField = screen.findContentItem("BusinessKey");
        NameField.dataBind("value", function () {
            if (NameField.value !== undefined && NameField.value.length > 0) {
                var currentLength = 0;
                if (BusinessKeyField.value !== undefined) {
                    currentLength = BusinessKeyField.value.length;
                }

                if (currentLength === 0) {
                    BusinessKeyField.value = NameField.value;
                }
            }
        });
    }

    lightswitchTools.setBaselineString = function (screen) {
        //var name = screen.details.getModel().properties[0].name;
        //var thisObject = screen[name];

        var BaselineField = screen.findContentItem("Baseline");
        var BaselineStringField = screen.findContentItem("BaselineString");
        if (BaselineField && BaselineStringField) {
            BaselineField.dataBind("value", function () {
                if (BaselineField.value !== undefined && BaselineField.value.length > 0) {
                    var currentLength = 0;
                    if (BaselineStringField.value !== undefined) {
                        currentLength = BaselineStringField.value.length;
                    }

                    if (currentLength === 0) {
                        BaselineStringField.value = BaselineField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.setTargetString = function (screen) {
        //var name = screen.details.getModel().properties[0].name;
        //var thisObject = screen[name];

        var TargetField = screen.findContentItem("Target");
        var TargetStringField = screen.findContentItem("TargetString");
        if (TargetField && TargetStringField) {
            TargetField.dataBind("value", function () {
                if (TargetField.value !== undefined && TargetField.value.length > 0) {
                    var currentLength = 0;
                    if (TargetStringField.value !== undefined) {
                        currentLength = TargetStringField.value.length;
                    }

                    if (currentLength === 0) {
                        TargetStringField.value = TargetField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.setDescriptionIsName = function (screen) {
        //var name = screen.details.getModel().properties[0].name;
        //var thisObject = screen[name];

        var NameField = screen.findContentItem("Name");
        var DescriptionField = screen.findContentItem("Description");
        var TextDescriptionField = screen.findContentItem("TextDescription");
        if (NameField && (DescriptionField || TextDescriptionField)) {
            NameField.dataBind("value", function () {
                if (NameField.value !== undefined && NameField.value.length > 0 && TextDescriptionField !== undefined) {
                    var currentLength = 0;
                    if (TextDescriptionField.value !== undefined) {
                        currentLength = TextDescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        TextDescriptionField.value = NameField.value;
                    }
                }

                if (NameField.value !== undefined && NameField.value.length > 0 && DescriptionField !== undefined) {
                    var currentLength = 0;
                    if (DescriptionField.value !== undefined) {
                        currentLength = DescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        DescriptionField.value = NameField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.setDescriptionIsShortName = function (screen) {
        var name = screen.details.getModel().properties[0].name;
        var thisObject = screen[name];

        var ShortNameField = screen.findContentItem("ShortName");
        var DescriptionField = screen.findContentItem("Description");
        var TextDescriptionField = screen.findContentItem("TextDescription");
        if (ShortNameField && (DescriptionField || TextDescriptionField)) {
            ShortNameField.dataBind("value", function () {
                if (ShortNameField.value !== undefined && ShortNameField.value.length > 0 && TextDescriptionField !== undefined) {
                    var currentLength = 0;
                    if (TextDescriptionField.value !== undefined) {
                        currentLength = TextDescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        TextDescriptionField.value = ShortNameField.value;
                    }
                }

                if (ShortNameField.value !== undefined && ShortNameField.value.length > 0 && DescriptionField !== undefined) {
                    var currentLength = 0;
                    if (DescriptionField.value !== undefined) {
                        currentLength = DescriptionField.value.length;
                    }

                    if (currentLength === 0) {
                        DescriptionField.value = ShortNameField.value;
                    }
                }
            });
        }
    }

    lightswitchTools.copyIcon = function (element) {
        $(element).addClass("customCopyIcon");
    }

    lightswitchTools.homeIcon = function (element) {
        $(element).addClass("customHomeIcon");
    }

    lightswitchTools.loadScript = function (element, scriptPath) {
        var jsFile = document.createElement("script");
        jsFile.setAttribute("type", "text/javascript");
        jsFile.setAttribute("src", scriptPath);

        $("body").append(jsFile);

        $(element).html("");

        report.run(element);
    }
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));

