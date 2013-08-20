/// <reference path="../GeneratedArtifacts/viewModel.js" />

/// <reference path="LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {

    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    if (screen.StatusValue === undefined) {
        screen.StatusValue = new myapp.StatusValue();

        if (screen.Values.Outcome !== undefined) {
            screen.StatusValue.setOutcome(screen.Values.Outcome);
        }

        if (screen.Values.Output !== undefined) {
            screen.StatusValue.setOutput(screen.Values.Output);
        }

        if (screen.Values.SubOutput !== undefined) {
            screen.StatusValue.setSubOutput(screen.Values.SubOutput);
        }

        if (screen.Values.Activity !== undefined) {
            screen.StatusValue.setActivity(screen.Values.Activity);
        }

        if (screen.Values.Project !== undefined) {
            screen.StatusValue.setProject(screen.Values.Project);
        }

        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.StatusValue.setReportingPeriod(reportingPeriod.results[0]);
            });
        });
    }

    switch (screen.Values.Type) {
        case "Output": {
            screen.pageTitle = "Output Status Value";
            screen.findContentItem("Output").isVisible = true;
            screen.findContentItem("SubOutput").isVisible = true;
            break;
        }
        case "Project": {
            screen.pageTitle = "Project Status Value";
            screen.findContentItem("StatusValue_Project").isVisible = true;
            break;
        }
        default: {
            screen.pageTitle = "Status Value";
            break;
        }
    }

    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditStatusValue.Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditStatusValue.Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};