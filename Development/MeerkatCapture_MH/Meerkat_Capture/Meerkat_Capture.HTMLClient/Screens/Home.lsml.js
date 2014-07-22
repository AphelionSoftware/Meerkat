/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.Home.VersionNumber_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};

function addStatusValue(screen, type) {



    var data = {};
    data.DataType = type;
    if (type == "Outcome") {
        /*
        screen.getOutcomes().then(function (outcomes) {
            var data = {};

            if (outcomes.selectedItem !== undefined) {
                data.Outcome = outcomes.selectedItem;
            }
            else {
                data.DataType = "Outcome";
            }

            data.Type = type;

            myapp.showAddEditStatusValue(undefined, data, {});
        });*/
        
        myapp.showAddEditStatusValue(undefined, data, screen.Outcomes.selectedItem.Outcome_ID);

    } else if (type == "Programme") {
        myapp.showAddEditStatusValue(undefined, data, screen.ProgrammeSorted.selectedItem.Outcome_ID);
    }  else if (type == "Project") {
    myapp.showAddEditStatusValue(undefined, data, screen.ProgrammeSorted.selectedItem.Outcome_ID);
}
}

myapp.Home.AddOutputStatusValue_execute = function (screen) {
    addStatusValue(screen, "Output");
};

myapp.Home.AddSectorStatusValue_execute = function (screen) {
    addStatusValue(screen, "Sector");
};


myapp.Home.AddProjectStatusValue_execute = function (screen) {
    addStatusValue(screen, "Project");
};
myapp.Home.ShowOutcomeIndicators_Tap_canExecute = function (screen) {
   

};
myapp.Home.AddProgrammeStatus_execute = function (screen) {
   
    myapp.Home.AddProjectStatusValue_execute = function (screen) {
        addStatusValue(screen, "Programme");
    };
};
myapp.Home.AddOutcomeStatusValue_Tap_execute = function (screen) {
   
    addStatusValue(screen, "Outcome");
};
myapp.Home.AddProgrammeStatus_Tap_execute = function (screen) {
   
    addStatusValue(screen, "Programme");
};
myapp.Home.created = function (screen) {
   
    //Need to do this for the rollups. Theoretically should only fire the once so not a big impact on performance
    if (screen.ReportingPeriodsFiltered.selectedItem == null) {
        $.getJSON("/api/TodaysReportingPeriod", function (data) {
            myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
                screen.ReportingPeriodEndDateID = reportingPeriod.results[0].EndDateID;
                screen.ReportingPeriodsFiltered.selectedItem = reportingPeriod.results[0];

            });
        });

    }
};
myapp.Home.StatusValuesSorted_postRender = function (element, contentItem) {
    // Write code here.
 
};
myapp.Home.StatusValuesSortedTemplate_postRender = function (element, contentItem) {
    if (contentItem.value.StatusType.Code == "-") {
        $(element).css("background", "#fc8d59");
    } else if (contentItem.value.StatusType.Code == "=") {
        $(element).css("background", "#ffffbf");
    } else if (contentItem.value.StatusType.Code == "+") {
        $(element).css("background", "#91cf60");
    }
    

};