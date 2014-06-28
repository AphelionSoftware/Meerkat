/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {
    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    screen.StatusValue = new myapp.StatusValue();    

    screen.StatusValue.sys_CreatedBy = "NA";
    screen.StatusValue.sys_CreatedOn = "1999/01/01";
    screen.StatusValue.sys_ModifiedBy = "NA";
    screen.StatusValue.sys_ModifiedOn = "1999/01/01";

    if (screen.Values.Outcome !== undefined || screen.Values.DataType === "Outcome") {
        screen.details.displayName = "Add Outcome Status Value";
        screen.findContentItem("OutcomeGroup").isVisible = true;
        screen.StatusValue.setOutcome(screen.Values.Outcome);
    }

    if (screen.Values.Output !== undefined || screen.Values.DataType === "Output") {
        screen.details.displayName = "Add Output Status Value";
        screen.findContentItem("OutputGroup").isVisible = true;
        screen.StatusValue.setOutput(screen.Values.Output);
    }

    if (screen.Values.SubOutput !== undefined || screen.Values.DataType === "SubOutput") {
        screen.details.displayName = "Add SubOutput Status Value";
        screen.findContentItem("SubOutputGroup").isVisible = true;
        screen.StatusValue.setSubOutput(screen.Values.SubOutput);
    }

    if (screen.Values.Activity !== undefined || screen.Values.DataType === "Activity") {
        screen.findContentItem("ActivityGroup").isVisible = true;
        screen.StatusValue.setActivity(screen.Values.Activity);
        screen.details.displayName = "Add Activity Status Value";
    }

    if (screen.Values.Project !== undefined || screen.Values.DataType === "Project") {
        screen.findContentItem("ProjectGroup").isVisible = true;
        screen.StatusValue.setProject(screen.Values.Project);
        screen.details.displayName = "Add Project Status Value";
    }

    if (screen.Values.Programme !== undefined || screen.Values.DataType === "Programme") {
        screen.findContentItem("ProgrammeGroup").isVisible = true;
        screen.StatusValue.setProgramme(screen.Values.Programme);
        screen.details.displayName = "Add Programme Status Value";
    }

    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRange = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriods.load().then(function () {
                screen.StatusValue.setReportingPeriod(reportingPeriod.results[0]);
            });
            //debugger
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
        }
    });
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