/// <reference path="../GeneratedArtifacts/viewModel.js" />

/// <reference path="../Scripts/LightSwitchTools.js" />


function updateAllPP(element, contentItem) {
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

        updateLocationTotal(element, contentItem);
        updateFormsValue(element, contentItem);
        updateVersionRollup(element, contentItem)
    } else {
        //If the basic filters aren't in place, hide the rollup fields

    }

}

function updateVersionRollup(element, contentItem) {

    screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;

    contentItem.screen.PeopleReachedPreviousVersions.load();
    //contentItem.screen.PeopleReachedLocationRollup.load();

    if ((contentItem.screen.PeopleReachedPreviousVersions.data.length > 0)) {
        contentItem.screen.findContentItem("PeopleReachedPreviousVersions").isVisible = true;
    } else {
        contentItem.screen.findContentItem("PeopleReachedPreviousVersions").isVisible = false;
    }

}

function updateFormsValue(element, contentItem) {
    var Forms = contentItem.screen.EventRegistersSorted;
    var Form = Forms.count;

    if (Form < 1) {
        contentItem.screen.findContentItem("FormValues").isVisible = false;
    }
    else if (Form == 1) {
        contentItem.screen.FormCountString = Form.toString() + " attendee";
        contentItem.screen.findContentItem("FormValues").isVisible = true;
    }
    else {
        contentItem.screen.FormCountString = Form.toString() + " attendees";
        contentItem.screen.findContentItem("FormValues").isVisible = true;
    }


    contentItem.screen.FormValue = Form;

}



function updateLocationTotal(element, contentItem) {
    var TotalSum = 0;
    var TotalCount = 0;
    var TotalAvg = 0;
    var TotalPop = 0;
    var Max = 0;
    var Min = 0;

    contentItem.screen.PeopleReachedLocationRollup.load();

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

    //Set the project - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(screen.ProjectID).execute().then(function (project) {
        screen.PeopleReachedValue.setProject(project.results[0]);
    });
};
myapp.AddEditProjectParticipants.SumAmount_postRender = function (element, contentItem) {
    // Write code here.
    function updateTotal() {
        // Compute the total for the invoice
        updateAllPP(element, contentItem);


        // contentItem.screen.IndicatorValue.ActualValue = TotalSum;

    }

    contentItem.dataBind("screen.PeopleReachedLocationRollup.count", updateTotal);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateTotal);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateTotal);
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateTotal);

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
    

    /*function updateVersionRollupDV() {
        updateAllPP(element, contentItem);
    }
    

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollupDV);
    contentItem.dataBind("screen.ReportingPeriod1.value", updateVersionRollupDV);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollupDV);
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollupDV);

    //Also updating on count. This fires on screen open
    contentItem.dataBind("screen.ReportingPeriodsFiltered.count", updateVersionRollup);
    */
};
myapp.AddEditProjectParticipants.PeopleReachedPreviousVersionsTemplate_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    var x = contentItem.data;
    if (!(contentItem.data.getNumberReached()._value)) {
        contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;
    }
};
myapp.AddEditProjectParticipants.LocationValues_postRender = function (element, contentItem) {
    // Write code here.
    if (contentItem.screen.CountLocations == 0) {
        contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;
    }
};
myapp.AddEditProjectParticipants.UseFormValue_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.NumberReached = screen.FormValue;
};
/*myapp.AddEditProjectParticipants.PeopleReachedPreviousVersions1_postRender = function (element, contentItem) {
    // Write code here.

};*/
myapp.AddEditProjectParticipants.FormValue_postRender = function (element, contentItem) {
    // Write code here.
    function updateFormsValue() {
        updateAllPP(element, contentItem);
    }

    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateFormsValue);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateFormsValue);
    contentItem.dataBind("screen.ReportingPeriod1.value", updateFormsValue);
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateFormsValue);
    contentItem.dataBind("screen.EventRegistersSorted.count", updateFormsValue);
};
myapp.AddEditProjectParticipants.SelectedLocationsTap_execute = function (screen) {
    // Write code here.
    screen.PeopleReachedValue.Location = screen.LocationsSorted.selectedItem;
    screen.closePopup();
};