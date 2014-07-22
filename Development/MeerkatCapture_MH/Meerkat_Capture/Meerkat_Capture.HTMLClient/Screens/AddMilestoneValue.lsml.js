/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />


function updateAllMA(element, contentItem) {
    //Need to do this for the rollups. Theoretically should only fire the once so not a big impact on performance
    if (contentItem.screen.ReportingPeriodsFiltered.selectedItem == null) {
        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
                contentItem.screen.ReportingPeriodsFiltered.selectedItem = reportingPeriod.results[0];

            });
        });

    }

    if (contentItem.screen.DataVersionSorted.selectedItem && contentItem.screen.LocationsSorted.selectedItem && contentItem.screen.ReportingPeriodsFiltered.selectedItem) {

        setBizKey(element, contentItem);
        updatePreviousVersion(element, contentItem)
    } else {
        //If the basic filters aren't in place, hide the rollup fields

    }

}


//Set good defaults for business key
function setBizKey(element, contentItem) {
    var bizKey = contentItem.screen.ReportingPeriodsFiltered.selectedItem.Summary + " | " +
        contentItem.screen.LocationsSorted.selectedItem.Name + " | " +
        contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID;

    contentItem.screen.findContentItem("BusinessKey").value = bizKey;
}

function updatePreviousVersion(element, contentItem) {
    contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;
    contentItem.screen.MilestoneValuesPreviousVersion.load();
}


myapp.AddMilestoneValue.created = function (screen) {
    if (screen.MilestoneValue === undefined) {
        screen.MilestoneValue = new myapp.MilestoneValue();
    }

    msls.application.lightswitchTools.setCommonAddScreenValues(screen);
    msls.application.lightswitchTools.configureCaptureForm(screen);
    
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRange = reportingPeriod.results[0].EndDateID;
            //screen.ReportingPeriods.load().then(function () {
                screen.MilestoneValue.setReportingPeriod(reportingPeriod.results[0]);
            //});
        });
    });

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneId).execute().then(function (result) {
        var mileStone = result.results[0];
        screen.MilestoneValue.setMilestone(mileStone);
    });
};

myapp.AddMilestoneValue.SearchOrganizationsTap_execute = function (screen) {
    screen.MilestoneValue.Organization = screen.Organizations.selectedItem;
    screen.closePopup();
};

myapp.AddMilestoneValue.SelectedLocationsTap_execute = function (screen) {
    screen.MilestoneValue.Location = screen.Locations.selectedItem;
    screen.closePopup();
};