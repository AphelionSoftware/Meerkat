﻿///<reference path="../GeneratedArtifacts/viewModel.js" />

function updateLocationsTotal( element, contentItem)
{
    var TotalSum = 0;
    var TotalCount = 0;
    var TotalAvg = 0;
    var TotalPop = 0;
    var Max = 0;
    var Min = 0;
    var Locations = contentItem.screen.IndicatorLocationRollup;


    var Location = Locations.data;
    Location.forEach(function (singleLocation) {
        if (singleLocation.ActualValue) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleLocation.ActualValue);
        }
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

    if (TotalCount <= 1) {
        contentItem.screen.findContentItem("LocationValues").isVisible = false;
    }
    else {

        contentItem.screen.findContentItem("LocationValues").isVisible = true;
    }
}

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
        updateLocationsTotal(element, contentItem);
        
       
       // contentItem.screen.IndicatorValue.ActualValue = TotalSum;
       
    }

    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateTotal);

    contentItem.dataBind("screen.DataVersion.value", updateTotal);

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
    if (screen.IndicatorValuesPreviousVersion.data[1]) {
        screen.IndicatorValue.ActualValue= screen.IndicatorValuesPreviousVersion.data[1].ActualValue;
        screen.IndicatorValue.ActualLabel = screen.IndicatorValuesPreviousVersion.data[1].ActualLabel;
        screen.IndicatorValue.ActualDate = screen.IndicatorValuesPreviousVersion.data[1].ActualDate;
    }
};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersion1_postRender = function (element, contentItem) {
    // Write code here.
    function updateVersionRollup() {
        if (contentItem.screen.DataVersionSorted.selectedItem) {
            contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID + 1;

        }
        if (contentItem.screen.ReportingPeriodsFiltered) {

        }
        updateLocationsTotal(element, contentItem);
        contentItem.screen.IndicatorValuesPreviousVersion.load();
        contentItem.screen.IndicatorLocationRollup.load();
        //

    }

    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollup);
    contentItem.dataBind("screen.DataVersion.value", updateVersionRollup);
};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersion1Template_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    var x = contentItem.data;
    if (!(contentItem.data.getActualValue()._value)) {
        contentItem.isVisible = false;
    }

};

myapp.AddEditIndicatorValue.LocationValues_postRender = function (element, contentItem) {
    // Write code here.
    if (contentItem.screen.CountLocations == 0) {
        //contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;
    }
};

//Updating values from the forms
myapp.AddEditIndicatorValue.FormValue_postRender = function (element, contentItem) {
    // Write code here.

    function updateFormValue() {
        // Compute the total for the form value
        var TotalSum = 0;
        var TotalCount = 0;
        var TotalSum = 0;
        var Min = 0;
        var Max = 0;
        
        var Forms = contentItem.screen.vw_ResponsesByIndicators_PerIndicator;

        var Form = Forms.data;
        Form.forEach(function (singleForm) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleForm.QuestionResponse);
            TotalCount = parseFloat(TotalCount) + 1;
            if (parseFloat(singleForm.ActualValue) < Min || Min == 0) {
                Min = parseFloat(singleForm.ActualValue);
            }
            if (parseFloat(singleForm.ActualValue) > Max) {
                Max = parseFloat(singleForm.ActualValue);
            }

        });

        if (TotalCount > 0) {
            
            switch (Form[0].RollupTypeCode) {
                case "SUM":
                    contentItem.screen.FormValue = TotalSum;
                    break;

                case "AVG":
                    TotalAvg = TotalSum / TotalCount;
                    contentItem.screen.FormValue = TotalAvg;
                    break;

                case "MAX":
                    contentItem.screen.FormValue = Max;
                    break;

                case "MIN":
                    contentItem.screen.FormValue = Min;
                    break;

                case "CNT":
                    contentItem.screen.FormValue = TotalCount;
                    break;


            }
        }
        contentItem.screen.FormCountstring = TotalCount.toString() + " forms filled in.";


        if (TotalCount < 1) {
            contentItem.screen.findContentItem("FormValuesRollup").isVisible = false;
        }
        else {

            contentItem.screen.findContentItem("FormValuesRollup").isVisible = true;
        }


        // contentItem.screen.IndicatorValue.ActualValue = TotalSum;

    }

    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateFormValue);
    contentItem.dataBind("screen.ReportingPeriod1.value", updateFormValue);
    contentItem.dataBind("screen.DataVersion.value", updateFormValue);
    contentItem.dataBind("screen.vw_ResponsesByIndicators_PerIndicator.count", updateFormValue);
    

};
myapp.AddEditIndicatorValue.UseFormValue_execute = function (screen) {
    screen.IndicatorValue.ActualValue = screen.FormValue;
    screen.IndicatorValue.ActualLabel = screen.FormValue;
};