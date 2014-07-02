/// <reference path="../GeneratedArtifacts/viewModel.js" />

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

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.Indicator_ID).execute().then(function (indicator) {
        screen.IndicatorValue.setIndicator(indicator.results[0]);
    });
};
myapp.AddEditProjectParticipants.SumAmount_postRender = function (element, contentItem) {
    // Write code here.
    function updateTotal() {
        // Compute the total for the invoice
        updateLocationsTotal(element, contentItem);


        // contentItem.screen.IndicatorValue.ActualValue = TotalSum;

    }

    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateTotal);

    contentItem.dataBind("screen.DataVersion.value", updateTotal);

    contentItem.dataBind("screen.ReportingPeriod1.value", updateTotal);
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
    screen.PeopleReachedValue.NumberReached = screen.TotalPop;
};
myapp.AddEditProjectParticipants.UsePreviousVersion_execute = function (screen) {
    // Write code here.
    if (screen.PeopleReachedPreviousVersion.data[1]) {
        screen.PeopleReachedValue.NumberReached = screen.PeopleReachedPreviousVersion.data[1].NumberReached;
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
        updateLocationsTotal(element, contentItem);
        contentItem.screen.PeopleReachedPreviousVersion.load();
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
    var x = contentItem.data;
    if (!(contentItem.data.getActualValue()._value)) {
        contentItem.isVisible = false;
    }
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