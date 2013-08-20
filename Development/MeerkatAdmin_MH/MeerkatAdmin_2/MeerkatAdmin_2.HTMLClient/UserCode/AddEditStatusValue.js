/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {

    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    var isOutputPage = false;

    if (screen.StatusValue === undefined) {
        /* new screen */
        screen.StatusValue = new myapp.StatusValue();

        if (screen.Values.Outcome !== undefined) {
            if (screen.Values.Type === "Output") {
                isOutputPage = true;
            }

            screen.findContentItem("Outcome").isVisible = true;
            screen.StatusValue.setOutcome(screen.Values.Outcome);
        }

        if (screen.Values.Output !== undefined) {
            isOutputPage = true;
            screen.findContentItem("Output").isVisible = true;
            screen.StatusValue.setOutput(screen.Values.Output);
        }

        if (screen.Values.SubOutput !== undefined) {
            isOutputPage = true;
            screen.findContentItem("SubOutput").isVisible = true;
            screen.StatusValue.setSubOutput(screen.Values.SubOutput);
        }

        if (screen.Values.Activity !== undefined) {
            screen.findContentItem("Activity").isVisible = true;
            screen.StatusValue.setActivity(screen.Values.Activity);
        }

        if (screen.Values.Project !== undefined) {
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
                if (screen.Values.Type === "Output") {
                    isOutputPage = true;
                }

                screen.findContentItem("Outcome").isVisible = true;
            } else {
                screen.StatusValue.getOutput().then(function (output) {
                    if (output !== undefined) {
                        isOutputPage = true;
                        screen.findContentItem("Output").isVisible = true;
                    } else {
                        screen.StatusValue.getSubOutput().then(function (suboutput) {
                            if (suboutput !== undefined) {
                                isOutputPage = true;
                                screen.findContentItem("SubOutput").isVisible = true;
                            } else {
                                screen.StatusValue.getProject().then(function (project) {
                                    if (project !== undefined) {
                                        screen.findContentItem("StatusValue_Project").isVisible = true;
                                    } else {
                                        screen.StatusValue.getActivity().then(function (activity) {
                                            screen.findContentItem("Activity").isVisible = true;
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

    if (isOutputPage) {
        screen.pageTitle = "Output Status Value";
    } else {
        screen.pageTitle = "Project Status Value";
    }

    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditStatusValue.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditStatusValue.Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};