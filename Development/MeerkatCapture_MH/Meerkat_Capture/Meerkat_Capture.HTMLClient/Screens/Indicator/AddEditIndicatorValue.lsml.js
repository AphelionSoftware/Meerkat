///<reference path="../GeneratedArtifacts/viewModel.js" />

function updateAllInd(element, contentItem) {
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

        updatePreviousVersionIndicator(element, contentItem);
        updateLocationsTotalIndicator(element, contentItem);
        updateFormValues(element, contentItem);
        setBizKey(element, contentItem);
    } else {
        //If the basic filters aren't in place, hide the rollup fields
        contentItem.screen.findContentItem("LocationValues").isVisible = false;
        contentItem.screen.findContentItem("PreviousVersion").isVisible = false;
        contentItem.screen.findContentItem("FormValuesRollup").isVisible = false;

    }

}

//Set good defaults for business key
function setBizKey(element, contentItem) {
    var bizKey = contentItem.screen.ReportingPeriodsFiltered.selectedItem.Summary + " | " +
        contentItem.screen.LocationsSorted.selectedItem.Name + " | " +
        contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID;

    contentItem.screen.findContentItem("BusinessKey").value = bizKey;
}



function updateFormValues(element, contentItem) {

    //Only show form values when we are at First Draft
    if (contentItem.screen.DataVersionSorted.selectedItem.DataVersion_ID != 3) {
        contentItem.screen.findContentItem("FormValuesRollup").isVisible = false;
        return;
    }


    // Compute the total for the form value
    var TotalSum = 0;
    var TotalCount = 0;

    var TotalNulls = 0;
    var TotalSum = 0;
    var Min = 0;
    var Max = 0;

    var Forms = contentItem.screen.vw_ResponsesByIndicators_PerIndicator;

    var Form = Forms.data;
    Form.forEach(function (singleForm) {
        if (singleForm.QuestionResponse != null) {
            TotalSum = parseFloat(TotalSum) + parseFloat(singleForm.QuestionResponse);
        } else {
            TotalNulls++;
        }
        TotalCount++;
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



}

function updatePreviousVersionIndicator(element, contentItem) {
    if (contentItem.screen.DataVersionSorted.selectedItem) {
        contentItem.screen.IndicatorValue.ActualValue = 0;
        contentItem.screen.PreviousDataVersion = contentItem.screen.DataVersionSorted.selectedItem.Order + 1;

        contentItem.screen.IndicatorValuesPreviousVersion.load();

        contentItem.screen.findContentItem("PreviousVersion").isVisible = true;
    }

}

function updateLocationsTotalIndicator(element, contentItem) {
    var TotalSum = 0;
    var TotalCount = 0;
    var TotalAvg = 0;
    var TotalPop = 0;
    var Max = 0;
    var Min = 0;
    var Locations = contentItem.screen.IndicatorLocationRollup;


    var Location = Locations.data;
    if (Locations.data.length <= 1) {
        contentItem.screen.findContentItem("LocationValues").isVisible = false;
        return;
    }
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
    //msls.application.lightswitchTools.configureCaptureForm(screen);
    //done here as the screen name may not match the value expected by the code in LightSwitchTools.js
    var thisObject = screen.IndicatorValue;


    myapp.activeDataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
        //thisObject.setActiveType(x.results[x]);
        // MGS 2013/09/32
        //x.results[x] will always be undefined. Instead we want the single result that should return, position 0
        thisObject.setActiveType(x.results[0]);
    }, function (x) {
        msls.showMessageBox(x, {
            title: "Default value for ActiveType failed"
        });
    });


    thisObject.sys_ModifiedBy = "NA";
    thisObject.sys_ModifiedOn = "1999/01/01";
    var name = screen.details.getModel().properties[0].name;

    var primaryKeyColumn;
    var properties = screen.details.getModel().properties[0].elementType.properties;

    $.each(properties, function (index, property) {
        if (property.__isKeyProperty === 1) {
            primaryKeyColumn = property.name;
            return false;
        }
    });

    var primaryKey = screen.IndicatorValue[primaryKeyColumn];
    //var activeType = screen.IndicatorValue.ActiveType;

    if (primaryKey === undefined) {
        thisObject.sys_CreatedBy = "NA";
        thisObject.sys_CreatedOn = "1999/01/01";


        //This should really be done at the data source level
        //function setDefaultReportingPeriod(screen) {
        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
                //screen.ReportingPeriodsFiltered.load().then(function () {
                //Disabled for now til we get it to load the location rollusp correctly

                screen.IndicatorValue.setReportingPeriod(reportingPeriod.results[0]);
                //Need to do this for the rollups
                contentItem.screen.ReportingPeriodsFiltered.selectedItem = reportingPeriod.results[0];

            });
        });
        //}
    }


    //Default Actual label to actual value 
    var actualValueField = screen.findContentItem("ActualValue");
    var actualLabelField = screen.findContentItem("ActualLabel");
    actualValueField.dataBind("value", function () {
        if (actualValueField.value !== undefined && actualValueField.stringValue !== undefined && actualValueField.stringValue.length > 0) {
            var currentLength = 0;
            if (actualLabelField.value !== undefined) {
                currentLength = actualLabelField.stringValue.length;
            }

            if (currentLength === 0) {
                actualLabelField.stringValue = actualValueField.stringValue;
            }
        }
    });

    //Default business key 
    var businessKeyField = screen.findContentItem("BusinessKey");
    var ReportingPeriod1Field = screen.findContentItem("ReportingPeriod1");
    var LocationField = screen.findContentItem("Location");
    var DataVersionField = screen.findContentItem("DataVersion");

    /*actualValueField.dataBind("value", function () {
        
        if (ReportingPeriod1Field.stringValue != undefined && LocationField.stringValue != undefined && DataVersionField.stringValue) {
            businessKeyField.stringValue = ReportingPeriod1Field.stringValue + LocationField.stringValue + DataVersionField.stringValue;
        }
    }); */



    //Set the indicator - it's prefiltered by parameter.

    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(screen.Indicator_ID).execute().then(function (indicator) {
        screen.IndicatorValue.setIndicator(indicator.results[0]);
    });


};


//Location ROllup
myapp.AddEditIndicatorValue.SumAmount_postRender = function (element, contentItem) {
    // Write code here.

    function updateTotal() {
        // Compute the total for the invoice

        if (contentItem.screen.DataVersionSorted.selectedItem && contentItem.screen.LocationsSorted.selectedItem)
            contentItem.screen.IndicatorLocationRollup.load().then(function (promise) {
                updateLocationsTotal(element, contentItem);

            });

    }


    function updateTotal_LS() {
        if (contentItem.screen.DataVersionSorted.selectedItem && contentItem.screen.LocationsSorted.selectedItem) {
            updateAllInd(element, contentItem);
        }
    }


    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateTotal_LS);

    //Actually messy, as we have multiple bindings.
    contentItem.dataBind("screen.LocationsSorted.selectedItem", updateTotal_LS);
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateTotal_LS);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateTotal_LS);


    //contentItem.dataBind("screen.DataVersion.value", updateTotal);

    //contentItem.dataBind("screen.ReportingPeriod1.value", updateTotal);
};




function fnSumAmount(Locations) {

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
        if (screen.IndicatorValuesPreviousVersion.data[1].ActualValue) {
            //screen.IndicatorValue.ActualValue = screen.IndicatorValuesPreviousVersion.data[1].ActualValue;
            screen.findContentItem("ActualValue").stringValue = screen.IndicatorValuesPreviousVersion.data[1].ActualValue;
        }
        if (screen.IndicatorValuesPreviousVersion.data[1].ActualLabel) {
            screen.IndicatorValue.ActualLabel = screen.IndicatorValuesPreviousVersion.data[1].ActualLabel;
        }
        if (screen.IndicatorValuesPreviousVersion.data[1].ActualDate) {
            screen.IndicatorValue.ActualDate = screen.IndicatorValuesPreviousVersion.data[1].ActualDate;
        }
    }
};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersion1_postRender = function (element, contentItem) {
    function updateTotal() {
        updateAllInd(element, contentItem);
    }
    // Set a dataBind to update the value when the selection change
    contentItem.dataBind("screen.DataVersionSorted.selectedItem", updateTotal);
    contentItem.dataBind("screen.ReportingPeriodsFiltered.selectedItem", updateTotal);
    //contentItem.dataBind("screen.LocationsSorted.selectedItem", updateVersionRollup);
    //contentItem.dataBind("screen.DataVersion.value", updateVersionRollup);
};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersion1Template_postRender = function (element, contentItem) {
    // Write code here.
    // if (contentItem.screen == null)
    var x = contentItem.data;
    if (!(contentItem.data.getActualValue()._value)) {
        contentItem.isVisible = false;
        //contentItem.screen.findContentItem("PreviousVersion").isVisible = false;
    } else {
        contentItem.isVisible = true;
    }

    if (!(contentItem.data.IndicatorValues_ID)) {
        contentItem.isVisible = false;
    }

};

myapp.AddEditIndicatorValue.LocationValues_postRender = function (element, contentItem) {
    // Write code here.
    if (contentItem.screen.CountLocations == 0) {
        //contentItem.isVisible = false;
    } else {
        contentItem.isVisible = true;
        // contentItem.screen.findContentItem("PreviousVersion").isVisible = true;
    }
};

//Updating values from the forms
myapp.AddEditIndicatorValue.FormValue_postRender = function (element, contentItem) {
    // Write code here.

    function updateFormValue() {
        updateAllInd(element, contentItem);
    }

    contentItem.dataBind("screen.IndicatorLocationRollup.count", updateFormValue);
    contentItem.dataBind("screen.ReportingPeriod1.value", updateFormValue);
    contentItem.dataBind("screen.DataVersion.value", updateFormValue);
    contentItem.dataBind("screen.vw_ResponsesByIndicators_PerIndicator.count", updateFormValue);


};
myapp.AddEditIndicatorValue.UseFormValue_execute = function (screen) {
    //screen.IndicatorValue.ActualValue = screen.FormValue;
    screen.findContentItem("ActualValue").stringValue = String(screen.FormValue);
    screen.IndicatorValue.ActualLabel = screen.FormValue;
};
myapp.AddEditIndicatorValue.SelectedLocationTap_execute = function (screen) {
    // Write code here.
    screen.IndicatorValue.Location = screen.LocationsSorted.selectedItem;
    screen.closePopup();
};
myapp.AddEditIndicatorValue.ReportingPeriod1_postRender = function (element, contentItem) {
    // Write code here.
    /*function setDefaultReportingPeriod() {
        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
                //screen.ReportingPeriodsFiltered.load().then(function () {
                    screen.IndicatorValue.setReportingPeriod(reportingPeriod.results[0]);
                    screen.PreviousDataVersion = screen.DataVersionSorted.selectedItem.DataVersion_ID;
                //});
            });
        });
    }
    contentItem.dataBind("screen.ReportingPeriodsFiltered.count", setDefaultReportingPeriod());
    */
};
myapp.AddEditIndicatorValue.ActualValue_postRender = function (element, contentItem) {
    //contentItem.value = 0;

};
myapp.AddEditIndicatorValue.IndicatorValuesPreviousVersionTemplate_postRender = function (element, contentItem) {
    if (!(contentItem.data.IndicatorValues_ID)) {
        contentItem.isVisible = false;
    }
};
myapp.AddEditIndicatorValue.DisaggGroups_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.getClientCode(function (client) {
        if (client == "Northdoor") {

            contentItem.screen.findContentItem("DisaggGroups").isVisible = false;
        }
    });

};
myapp.AddEditIndicatorValue.Location_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.getClientCode(function (client) {
        if (client == "Northdoor") {
            myapp.activeDataWorkspace.MeerkatData.Locations_SingleOrDefault(1).execute().then(
                function (item) {
                    if (item.results.length > 0) {
                        contentItem.screen.LocationsSorted.selectedItem = item.results[0];
                        contentItem.screen.IndicatorValue.Location = item.results[0];
                    }
                }
            )
            
        }
    });


};
myapp.AddEditIndicatorValue.DataVersion_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.getClientCode(function (client) {
        if (client == "Northdoor") {
            //Northdoor only has publish
            myapp.activeDataWorkspace.MeerkatData.DataVersions_SingleOrDefault(1).execute().then(
                function (item) {
                    
                    if (item.results.length > 0) {
                        contentItem.screen.DataVersionSorted.selectedItem = item.results[0];
                        contentItem.screen.IndicatorValue.DataVersion = item.results[0];
                    }
                }
                )

        }
    });

};