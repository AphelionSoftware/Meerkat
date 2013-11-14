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
            screen.pageTitle = "Outcome Status Value";
            screen.findContentItem("OutcomeGroup").isVisible = true;
            screen.StatusValue.setOutcome(screen.Values.Outcome);
        }

        if (screen.Values.Output !== undefined) {
            screen.pageTitle = "Output Status Value";
            screen.findContentItem("OutputGroup").isVisible = true;
            screen.StatusValue.setOutput(screen.Values.Output);
        }

        if (screen.Values.SubOutput !== undefined) {
            screen.pageTitle = "SubOutput Status Value";
            screen.findContentItem("SubOutputGroup").isVisible = true;
            screen.StatusValue.setSubOutput(screen.Values.SubOutput);
        }

        if (screen.Values.Activity !== undefined) {
            screen.pageTitle = "Activity Status Value";
            screen.findContentItem("ActivityGroup").isVisible = true;
            screen.StatusValue.setActivity(screen.Values.Activity);
        }

        if (screen.Values.Project !== undefined) {
            screen.pageTitle = "Project Status Value";
            screen.findContentItem("ProjectGroup").isVisible = true;
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
                screen.findContentItem("OutcomeGroup").isVisible = true;
                screen.pageTitle = "Outcome Status Value";
            } else {
                screen.StatusValue.getOutput().then(function (output) {
                    if (output !== undefined) {
                        screen.findContentItem("OutputGroup").isVisible = true;
                        screen.pageTitle = "Output Status Value";
                    } else {
                        screen.StatusValue.getSubOutput().then(function (suboutput) {
                            if (suboutput !== undefined) {             
                                screen.findContentItem("SubOutputGroup").isVisible = true;
                                screen.pageTitle = "SubOutput Status Value";
                            } else {
                                screen.StatusValue.getProject().then(function (project) {
                                    if (project !== undefined) {
                                        screen.findContentItem("ProjectGroup").isVisible = true;
                                        screen.Values.Type = "Project";
                                        screen.pageTitle = "Project Status Value";
                                    } else {
                                        screen.StatusValue.getActivity().then(function (activity) {
                                            screen.findContentItem("ActivityGroup").isVisible = true;
                                            screen.pageTitle = "Activity Status Value";
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

myapp.AddEditStatusValue.SearchOutcomesTap_execute = function (screen) {
    screen.StatusValue.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchOutputsTap_execute = function (screen) {
    screen.StatusValue.Output = screen.Outputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchSubOutputsTap_execute = function (screen) {
    screen.StatusValue.SubOutput = screen.SubOutputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchProjectsTap_execute = function (screen) {
    screen.StatusValue.Project = screen.Projects.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchActivitiesTap_execute = function (screen) {
    screen.StatusValue.Activity = screen.Activities.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchReportingPeriodsTap_execute = function (screen) {
    screen.StatusValue.ReportingPeriod = screen.ReportingPeriods.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchStatusTypesTap_execute = function (screen) {
    screen.StatusValue.StatusType = screen.StatusTypes.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchDataVersionsTap_execute = function (screen) {
    screen.StatusValue.DataVersion = screen.DataVersions.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchLocationsTap_execute = function (screen) {
    screen.StatusValue.Location = screen.Locations.selectedItem;
    screen.closePopup();
};