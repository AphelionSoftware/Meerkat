///<reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorValue.created = function (screen) {
    // Set defaults.
    msls.application.lightswitchTools.configureCaptureForm(screen);

    //This should really be done at the data source level
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsFiltered.load().then(function () {
                screen.IndicatorValue.setReportingPeriod(reportingPeriod.results[0]);
                //screen.PreviousDataVersion = screen.DataVersionSorted.selectedItem.DataVersion_ID;
            });
        });
    });

    //Set the indicator - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.Indicator_ID).execute().then(function (indicator) {
        screen.IndicatorValue.setIndicator(indicator.results[0]);
    });

   
};
myapp.AddEditIndicatorValue.SumAmount_postRender = function (element, contentItem) {
    // Write code here.

    function updateTotal() {
        // Compute the total for the invoice

        var TotalSum = 0;
        var TotalCount = 0;
        var TotalAvg = 0;
        var TotalPop = 0;
        var Max = 0;
        var Min = 0;
        var Locations = contentItem.screen.IndicatorLocationRollup;

        var Location = Locations.data;
        Location.forEach(function (singleLocation) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleLocation.ActualValue);
            TotalCount = parseFloat(TotalCount) + 1;
            if (parseFloat(singleLocation.ActualValue) < Min || Min == 0) {
                Min = parseFloat(singleLocation.ActualValue);
            }
            if (parseFloat(singleLocation.ActualValue) > Max) {
                Max = parseFloat(singleLocation.ActualValue);
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
       // contentItem.screen.IndicatorValue.ActualValue = TotalSum;
       
    }

    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateTotal);


    contentItem.dataBind("screen.ReportingPeriod1.value", updateTotal);
};



// Function to compute the total for the invoice 

function fnSumAmount(Locations) {

    // Start with 0

    

    // Return TotalAmountOfinvoices

    return TotalSum;

}
myapp.AddEditIndicatorValue.UseSum_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.SumAmount;
    screen.IndicatorValue.ActualLabel = screen.SumAmount;
};
myapp.AddEditIndicatorValue.UseAvg_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.AvgAmount;
    screen.IndicatorValue.ActualLabel = screen.AvgAmount;

};
myapp.AddEditIndicatorValue.UseMax_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.MaxAmount;
    screen.IndicatorValue.ActualLabel = screen.MaxAmount;

};
myapp.AddEditIndicatorValue.UseMin_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.MinAmount;
    screen.IndicatorValue.ActualLabel = screen.MinAmount;

};
myapp.AddEditIndicatorValue.UseCount_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.CountLocationValues;
    screen.IndicatorValue.ActualLabel = screen.CountLocationValues;

};
myapp.AddEditIndicatorValue.UseFullCount_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.CountLocations;
    screen.IndicatorValue.ActualLabel = screen.CountLocations;

};
myapp.AddEditIndicatorValue.UsePopulation_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.ActualValue = screen.TotalPop;
    screen.IndicatorValue.ActualLabel = screen.TotalPop;

};
/*myapp.AddEditIndicatorValue.IndicatorValue_ActualValue_postRender = function (element, contentItem) {
    // Write code here.
    //contentItem.screen
};
myapp.AddEditIndicatorValue.DataVersion_ID_postRender = function (element, contentItem) {
    // Write code here.

};*/
myapp.AddEditIndicatorValue.Order_postRender = function (element, contentItem) {
    // Write code here.
    contentItem.screen.PreviousDataVersion = contentItem.value + 1; 

};
myapp.AddEditIndicatorValue.UsePreviousVersion_execute = function (screen) {
    // Write code here.
    contentItem.IndicatorValue.ActualLabel = "test";
    contentItem.IndicatorValue.ActualValue = 100;
};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersion1_postRender = function (element, contentItem) {
    // Write code here.
    function updateVersionRollup() {
        if (contentItem.screen.DataVersionSorted.selectedItem) {
            contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;

        }
        if (contentItem.screen.ReportingPeriodsFiltered) {

        }
        contentItem.screen.IndicatorValuesPreviousVersion.load();
        //

    }

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateVersionRollup);
};