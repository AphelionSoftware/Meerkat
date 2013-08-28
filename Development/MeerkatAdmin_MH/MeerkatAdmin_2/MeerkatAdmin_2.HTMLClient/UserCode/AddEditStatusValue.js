/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {

    var percentageElement;

    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    var isOutputPage = false;

    if (screen.StatusValue === undefined) {
        /* new screen */
        screen.StatusValue = new myapp.StatusValue();

        if (screen.Values.Outcome !== undefined) {
            screen.pageTitle = "Add Outcome Status Value";
            screen.findContentItem("Outcome").isVisible = true;
            screen.StatusValue.setOutcome(screen.Values.Outcome);
        }

        if (screen.Values.Output !== undefined) {
            screen.pageTitle = "Add Output Status Value";
            screen.findContentItem("Output").isVisible = true;
            screen.StatusValue.setOutput(screen.Values.Output);
        }

        if (screen.Values.SubOutput !== undefined) {
            screen.pageTitle = "Add SubOutput Status Value";
            screen.findContentItem("SubOutput").isVisible = true;
            screen.StatusValue.setSubOutput(screen.Values.SubOutput);
        }

        if (screen.Values.Activity !== undefined) {
            screen.pageTitle = "Add Activity Status Value";
            screen.findContentItem("Activity").isVisible = true;
            screen.StatusValue.setActivity(screen.Values.Activity);
        }

        if (screen.Values.Project !== undefined) {
            screen.pageTitle = "Add Project Status Value";
            screen.findContentItem("StatusValue_Project").isVisible = true;
            screen.StatusValue.setProject(screen.Values.Project);
        }

        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.StatusValue.setReportingPeriod(reportingPeriod.results[0]);
            });
        });
    } else {
        /* modified screen */
        screen.StatusValue.getOutcome().then(function (outcome) {
            if (outcome !== undefined) {
                screen.findContentItem("Outcome").isVisible = true;
                screen.pageTitle = "Edit Outcome Status Value";
            } else {
                screen.StatusValue.getOutput().then(function (output) {
                    if (output !== undefined) {
                        screen.findContentItem("Output").isVisible = true;
                        screen.pageTitle = "Edit Output Status Value";
                    } else {
                        screen.StatusValue.getSubOutput().then(function (suboutput) {
                            if (suboutput !== undefined) {             
                                screen.findContentItem("SubOutput").isVisible = true;
                                screen.pageTitle = "Edit SubOutput Status Value";
                            } else {
                                screen.StatusValue.getProject().then(function (project) {
                                    if (project !== undefined) {
                                        screen.findContentItem("StatusValue_Project").isVisible = true;
                                        screen.Values.Type = "Project";
                                        screen.pageTitle = "Edit Project Status Value";
                                    } else {
                                        screen.StatusValue.getActivity().then(function (activity) {
                                            screen.findContentItem("Activity").isVisible = true;
                                            screen.pageTitle = "Edit Activity Status Value";
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            }

        });
    }

    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditStatusValue.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditStatusValue.Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditStatusValue.CopyPercentage_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.copyIcon(element);
};

myapp.AddEditStatusValue.CopyPercentage_execute = function (screen) {
    screen.getStatusValues().then(function (statusValues) {
        if (statusValues.selectedItem === undefined) {
            debugger
            msls.showMessageBox("You must select an existing version from below first", {
                title: "Error"
            });
        } else {

            screen.StatusValue.Percentage = statusValues.selectedItem.Percentage;
            statusValues.selectedItem.getStatusType().then(function (statusType) {
                screen.StatusValue.setStatusType(statusType);
            });

            statusValues.selectedItem.getLocation().then(function (location) {
                screen.StatusValue.setLocation(location);
            });

            statusValues.selectedItem.getDataVersion().then(function (dataVersion) {
                screen.StatusValue.setDataVersion(dataVersion);
            });

            percentageElement.focus();
        }
    });
};

myapp.AddEditStatusValue.Percentage_postRender = function (element, contentItem) {
    percentageElement = $('input', $(element));
};