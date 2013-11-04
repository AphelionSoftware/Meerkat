/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {
    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    };

    screen.StatusValue = new myapp.StatusValue();    

    screen.StatusValue.sys_CreatedBy = "NA";
    screen.StatusValue.sys_CreatedOn = "1999/01/01";
    screen.StatusValue.sys_ModifiedBy = "NA";
    screen.StatusValue.sys_ModifiedOn = "1999/01/01";

    if (screen.Values.Outcome !== undefined || screen.Values.DataType == "Outcome") {
        screen.details.displayName = "Add Outcome Status Value";
        screen.findContentItem("Outcome").isVisible = true;
        screen.StatusValue.setOutcome(screen.Values.Outcome);
    }

    if (screen.Values.Output !== undefined || screen.Values.DataType === "Output") {
        screen.details.displayName = "Add Output Status Value";
        screen.findContentItem("Output").isVisible = true;
        screen.StatusValue.setOutput(screen.Values.Output);
    }

    if (screen.Values.SubOutput !== undefined || screen.Values.DataType == "SubOutput") {
        screen.details.displayName = "Add SubOutput Status Value";
        screen.findContentItem("SubOutput").isVisible = true;
        screen.StatusValue.setSubOutput(screen.Values.SubOutput);
    }

    if (screen.Values.Activity !== undefined || screen.Values.DataType == "Activity") {
        screen.findContentItem("Activity").isVisible = true;
        screen.StatusValue.setActivity(screen.Values.Activity);
        screen.details.displayName = "Add Activity Status Value";
    }

    if (screen.Values.Project !== undefined || screen.Values.DataType == "Project") {
        screen.findContentItem("Project").isVisible = true;
        screen.StatusValue.setProject(screen.Values.Project);
        screen.details.displayName = "Add Project Status Value";
    }

    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.StatusValue.setReportingPeriod(reportingPeriod.results[0]);
        });
    });

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
        screen.StatusValue.setActiveType(x.results[0]);
    }, function (x) {
        msls.showMessageBox(x, {
            title: "Default value for ActiveType failed"
        });
    });
};

myapp.AddEditStatusValue.CopyStatusValue_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.copyIcon(element);
};

myapp.AddEditStatusValue.CopyStatusValue_execute = function (screen) {
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