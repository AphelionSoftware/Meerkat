/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditMilestoneValue.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);

    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsFiltered.load().then(function () {
                screen.MilestoneValue.setReportingPeriod(reportingPeriod.results[0]);
                //screen.PreviousDataVersion = screen.DataVersionSorted.selectedItem.DataVersion_ID;
            });
        });
    });

    //Set the milestone - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Milestones_SingleOrDefault(screen.Milestone_ID).execute().then(function (milestone) {
        screen.MilestoneValue.setMilestone(milestone.results[0]);
    });
};
myapp.AddEditMilestoneValue.Order_postRender = function (element, contentItem) {
    // Write code here.
    contentItem.screen.PreviousDataVersion = contentItem.value + 1;
};
/*myapp.AddEditMilestoneValue.SumAmount_postRender = function (element, contentItem) {
    // Write code here.
    function updateTotal() {
        // Compute the total for the invoice

        var TotalSum = 0;
        var TotalCount = 0;
        var TotalAvg = 0;
        var Total = 0;
        var Max = 0;
        var Min = 0;
        var Versions = contentItem.screen.MilestoneValuesPreviousVersion;

        var Version = Versions.data;
        Version.forEach(function (singleVersion) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleVersion.ActualValue);
            TotalCount = parseFloat(TotalCount) + 1;
            if (parseFloat(singleVersion.ActualValue) < Min || Min == 0) {
                Min = parseFloat(singleVersion.ActualValue);
            }
            if (parseFloat(singleVersion.ActualValue) > Max) {
                Max = parseFloat(singleVersion.ActualValue);
            }
            //Total += parseFloat(singleVersion.Version.Population);

        });
        contentItem.screen.SumAmount = TotalSum;
        TotalAvg = TotalSum / TotalCount;

        contentItem.screen.AvgAmount = TotalAvg;
        contentItem.screen.MaxAmount = Max;
        contentItem.screen.MinAmount = Min;
        contentItem.screen.CountVersionValues = TotalCount;
        contentItem.screen.CountVersions = TotalCount;
        // contentItem.screen.MilestoneValue.ActualValue = TotalSum;

    }

    contentItem.dataBind("screen.MilestoneValuesPreviousVersion.count", updateTotal);


    contentItem.dataBind("screen.ReportingPeriod1.value", updateTotal);
};

// Function to compute the total for the invoice 

function fnSumAmount(Locations) {

    // Start with 0



    // Return TotalAmountOfinvoices

    return TotalSum;

}

myapp.AddEditMilestoneValue.UseSum_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.SumAmount;
    screen.MilestoneValue.ActualLabel = screen.SumAmount;
};
myapp.AddEditMilestoneValue.UseAvg_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.AvgAmount;
    screen.MilestoneValue.ActualLabel = screen.AvgAmount;
};
myapp.AddEditMilestoneValue.UseMax_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.MaxAmount;
    screen.MilestoneValue.ActualLabel = screen.MaxAmount;
};
myapp.AddEditMilestoneValue.UseMin_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.MinAmount;
    screen.MilestoneValue.ActualLabel = screen.MinAmount;
};
myapp.AddEditMilestoneValue.UseCount_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.CountVersionValues;
    screen.MilestoneValue.ActualLabel = screen.CountVersionValues;
};
myapp.AddEditMilestoneValue.UseFullCount_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.CountVersions;
    screen.MilestoneValue.ActualLabel = screen.CountVersions;
};
myapp.AddEditMilestoneValue.UseTotal_execute = function (screen) {
    // Write code here.
    screen.MilestoneValue.ActualValue = screen.Total;
    screen.MilestoneValue.ActualLabel = screen.Total;
};*/
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
        if (contentItem.screen.DataVersionSorted.selectedItem) {
            contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;

        }
        if (contentItem.screen.ReportingPeriodsFiltered) {

        }
        //updateLocationsTotal(element, contentItem);
        contentItem.screen.MilestoneValuesPreviousVersion.load();
        //contentItem.screen.IndicatorLocationRollup.load();
    }

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateVersionRollup);
    //contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.DataVersion.value", updateVersionRollup);
};
myapp.AddEditMilestoneValue.MilestoneValuesPreviousVersionTemplate_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    var x = contentItem.data;
    if (!(contentItem.data.getActualValue()._value)) {
        contentItem.isVisible = false;
    }
};