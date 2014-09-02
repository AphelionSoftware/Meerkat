/// <reference path="../GeneratedArtifacts/viewModel.js" />

function updateAllM(element, contentItem) {
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

myapp.AddEditMilestoneValue.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);

    /*$.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsFiltered.load().then(function () {
                screen.MilestoneValue.setReportingPeriod(reportingPeriod.results[0]);
                //screen.PreviousDataVersion = screen.DataVersionSorted.selectedItem.DataVersion_ID;
            });
        });
    });*/

    //Set the milestone - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.MilestoneID).execute().then(function (milestone) {
        screen.MilestoneValue.setMilestone(milestone.results[0]);
    });

    //Default Actual label to actual value 
    /*var actualValueField = screen.findContentItem("ActualValue");
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
    });*/


};
myapp.AddEditMilestoneValue.Order_postRender = function (element, contentItem) {
    // Write code here.
    contentItem.screen.PreviousDataVersion = contentItem.value + 1;
};

myapp.AddEditMilestoneValue.UsePreviousVersion_execute = function (screen) {
    // Write code here.
    if (screen.MilestoneValuesPreviousVersion.data[1]) {
        screen.MilestoneValue.ActualValue = screen.MilestoneValuesPreviousVersion.data[1].ActualValue;
        screen.MilestoneValue.ActualLabel = screen.MilestoneValuesPreviousVersion.data[1].ActualLabel;
        screen.MilestoneValue.ActualDate = screen.MilestoneValuesPreviousVersion.data[1].ActualDate;
    }
};
myapp.AddEditMilestoneValue.MilestoneValuesPreviousVersion_postRender = function (element, contentItem) {
    // Write code here.
    function updateVersionRollup() {
        /*if (contentItem.screen.DataVersionSorted.selectedItem) {
            contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;
        }
        
        //updateLocationsTotal(element, contentItem);
        contentItem.screen.MilestoneValuesPreviousVersion.load();
        //contentItem.screen.IndicatorLocationRollup.load();*/
        updateAllM(element, contentItem);
    }

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.DataVersion.value", updateVersionRollup);
};
myapp.AddEditMilestoneValue.MilestoneValuesPreviousVersionTemplate_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    var x = contentItem.data;
    if (!(contentItem.data.getActualValue()._value)) {
        contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;

    }

    if (!(contentItem.data.MilestoneValues_ID)) {
        contentItem.isVisible = false;
    }
};
myapp.AddEditMilestoneValue.SelectedLocationsTap_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.Location = screen.LocationsSorted.selectedItem;
    screen.closePopup();
};
myapp.AddEditMilestoneValue.MilestoneValuesPreviousVersion1Template_postRender = function (element, contentItem) {


};