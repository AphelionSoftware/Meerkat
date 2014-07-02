﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />
function updateLocationTotal(element, contentItem) {
    var TotalSum = 0;
    var TotalCount = 0;
    var TotalAvg = 0;
    var TotalPop = 0;
    var Max = 0;
    var Min = 0;
    var Locations = contentItem.screen.PeopleReachedLocationRollup;

    var Location = Locations.data;
    Location.forEach(function (singleLocation) {
        if (singleLocation.NumberReached) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleLocation.NumberReached);
        }
        TotalCount = parseFloat(TotalCount) + 1;
        if (parseFloat(singleLocation.NumberReached) < Min || Min == 0) {
            Min = parseFloat(singleLocation.NumberReached);
        }
        if (parseFloat(singleLocation.NumberReached) > Max) {
            Max = parseFloat(singleLocation.NumberReached);
        }
        //TotalPop += parseFloat(singleLocation.Location.Population);

    });
    contentItem.screen.SumAmount = TotalSum;
    TotalAvg = TotalSum / TotalCount;

    contentItem.screen.AvgAmount = TotalAvg;
    contentItem.screen.MaxAmount = Max;
    contentItem.screen.MinAmount = Min;
    contentItem.screen.CountLocationValues = TotalCount;
    contentItem.screen.CountLocations = TotalCount;

    if (TotalCount <= 1) {
        contentItem.screen.findContentItem("LocationValues").isVisible = false;
    }
    else {

        contentItem.screen.findContentItem("LocationValues").isVisible = true;
    }
}

myapp.AddEditProjectParticipants.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);


    //This should really be done at the data source level
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsFiltered.load().then(function () {
                screen.PeopleReachedValue.setReportingPeriod(reportingPeriod.results[0]);
            });
        });
    });

    //Set the indicator - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(screen.ProjectID).execute().then(function (project) {
        screen.PeopleReachedValue.setProject(project.results[0]);
    });
};
myapp.AddEditProjectParticipants.SumAmount_postRender = function (element, contentItem) {
    // Write code here.
    function updateTotal() {
        // Compute the total for the invoice
        updateLocationTotal(element, contentItem);


        // contentItem.screen.IndicatorValue.ActualValue = TotalSum;

    }

    contentItem.dataBind("screen.PeopleReachedLocationRollup.count", updateTotal);

    contentItem.dataBind("screen.DataVersion.value", updateTotal);

    contentItem.dataBind("screen.ReportingPeriods.value", updateTotal);
};

// Function to compute the total 

function fnSumAmount(Locations) {

    // Start with 0



    // Return TotalAmountOfinvoices

    return TotalSum;

}
myapp.AddEditProjectParticipants.UseSum_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.SumAmount;
};
myapp.AddEditProjectParticipants.UseAvg_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.AvgAmount;
};
myapp.AddEditProjectParticipants.UseMax_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.MaxAmount;
};
myapp.AddEditProjectParticipants.UseMin_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.MinAmount;
};
myapp.AddEditProjectParticipants.UseCount_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.CountLocationValues;
};
myapp.AddEditProjectParticipants.UseFullCount_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.CountLocations;
};
myapp.AddEditProjectParticipants.UsePopulation_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.TotalPopulation;
};
myapp.AddEditProjectParticipants.Order_postRender = function (element, contentItem) {
    // Write code here.
    contentItem.screen.PreviousDataVersion = contentItem.value + 1;
};
myapp.AddEditProjectParticipants.UsePreviousVersion_execute = function (screen) {
    // Write code here.
    if (screen.PeopleReachedPreviousVersions.data[1]) {
        screen.PeopleReachedValue.NumberReached = screen.PeopleReachedPreviousVersions.data[1].NumberReached;
        //screen.IndicatorValue.ActualLabel = screen.PeopleReachedPreviousVersion.data[1].ActualLabel;
        //screen.IndicatorValue.ActualDate = screen.PeopleReachedPreviousVersion.data[1].ActualDate;
    }
};
myapp.AddEditProjectParticipants.PeopleReachedPreviousVersions_postRender = function (element, contentItem) {
    // Write code here.
    function updateVersionRollup() {
        if (contentItem.screen.DataVersionSorted.selectedItem) {
            contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;

        }
        if (contentItem.screen.ReportingPeriodsFiltered) {

        }
        updateLocationTotal(element, contentItem);
        contentItem.screen.PeopleReachedPreviousVersions.load();
        contentItem.screen.PeopleReachedLocationRollup.load();
        //

    }

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.DataVersion.value", updateVersionRollup);
};
myapp.AddEditProjectParticipants.PeopleReachedPreviousVersionsTemplate_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    /*var x = contentItem.data;
    if (!(contentItem.data.getNumberReached()._value)) {
        contentItem.isVisible = false;
    }*/
};
myapp.AddEditProjectParticipants.LocationValues_postRender = function (element, contentItem) {
    // Write code here.
    if (contentItem.screen.CountLocations == 0) {
        //contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;
    }
};
myapp.AddEditProjectParticipants.UseFormValue_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.FormValue;
};