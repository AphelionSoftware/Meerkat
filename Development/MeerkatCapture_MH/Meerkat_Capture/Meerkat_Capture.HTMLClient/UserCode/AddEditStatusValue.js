/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {
    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    var isOutputPage = false;

    screen.StatusValue = new myapp.StatusValue();

    if (screen.Values.Outcome !== undefined || screen.Values.DataType == "Outcome") {
        if (screen.Values.Type === "Output") {
            isOutputPage = true;
        }

        screen.findContentItem("Outcome").isVisible = true;
        screen.StatusValue.setOutcome(screen.Values.Outcome);
    }

    if (screen.Values.Output !== undefined || screen.Values.DataType === "Output") {
        isOutputPage = true;
        screen.findContentItem("Output").isVisible = true;
        screen.StatusValue.setOutput(screen.Values.Output);
    }

    if (screen.Values.SubOutput !== undefined || screen.Values.DataType == "SubOutput") {
        isOutputPage = true;
        screen.findContentItem("SubOutput").isVisible = true;
        screen.StatusValue.setSubOutput(screen.Values.SubOutput);
    }

    if (screen.Values.Activity !== undefined || screen.Values.DataType == "Activity") {
        screen.findContentItem("Activity").isVisible = true;
        screen.StatusValue.setActivity(screen.Values.Activity);
    }

    if (screen.Values.Project !== undefined || screen.Values.DataType == "Project") {
        screen.findContentItem("Project").isVisible = true;
        screen.StatusValue.setProject(screen.Values.Project);
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

    if (isOutputPage) {
        screen.details.displayName = "Add Output Status Value";
    } else {
        screen.details.displayName = "Add Project Status Value";
    }
};