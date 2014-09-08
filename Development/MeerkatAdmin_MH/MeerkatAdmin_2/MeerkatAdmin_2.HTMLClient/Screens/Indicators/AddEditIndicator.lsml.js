/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicator.Indicator_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditIndicator.IndicatorType_postRender = function (element, contentItem) {

    contentItem.dataBind("value", function (newValue) {
        if (!contentItem.screen.Client) {
            return;
        }
        if ( contentItem.screen.Client.Value == "CARE Somalia")
        {
            contentItem.screen.findContentItem("SectorGroup").isVisible = true;
            contentItem.screen.findContentItem("SubSectorGroup").isVisible = true;
            contentItem.screen.findContentItem("ProjectGroup").isVisible = true;
            contentItem.screen.findContentItem("ProgrammeGroup").isVisible = true;
            contentItem.screen.findContentItem("IndicatorTypeGroup").isVisible = false;

            return;
            //CARE has some specific implementations
        }

        contentItem.screen.findContentItem("IndicatorTypeGroup").isVisible = true;

        var indicatorGroup = contentItem.screen.findContentItem("SubIndicators");
        $.each(indicatorGroup.children, function (index, child) {
            child.isVisible = false;
        });

        if (!newValue || newValue === undefined) {
            return;
        }

        var target = undefined;
        switch (newValue.Code) {
            case "Outcome":
                {
                    target = contentItem.screen.findContentItem("OutcomeGroup");
                    break;
                }
            case "Output":
                {
                    target = contentItem.screen.findContentItem("OutputGroup");
                    break;
                }
            case "SubOutput":
                {
                    target = contentItem.screen.findContentItem("SubOutputGroup");
                    break;
                }
            case "PROG":
                {
                    target = contentItem.screen.findContentItem("Programme");
                    break;
                }
            case "PRJ":
                {
                    target = contentItem.screen.findContentItem("Project");
                    break;
                }
            case "SEC":
                {
                    target = contentItem.screen.findContentItem("Sector");
                    break;
                }
            case "SS":
                {
                    target = contentItem.screen.findContentItem("SubSector");
                    break;
                }
            default:
                {
                    console.log(newValue.Code);
                    break;
                }

        }

        if (target !== undefined) {
            target.isVisible = true;
        }
    });
};

myapp.AddEditIndicator.Indicator_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditIndicator.created = function (screen) {


    if (screen.Indicator.Baseline == "") {
        screen.Indicator.setBaseline(0);
    }

    if (screen.Indicator.Target == "") {
        screen.Indicator.setTarget(0);
    }

    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
    msls.application.lightswitchTools.setBaselineString(screen);
    msls.application.lightswitchTools.setTargetString(screen);
    screen.Indicator.IsKeyIndicator = false;

    screen.details.dataWorkspace.MeerkatData.GlobalSettings.filter("Code eq 'Client'").execute().then(function (x) {
        screen.Client = x.results[0];
    });

    if (!screen.Indicator.Baseline || screen.Indicator.Baseline == "") {
        screen.Indicator.setBaseline(0);
    }

    if (!screen.Indicator.Target  || screen.Indicator.Target == "") {
        screen.Indicator.setTarget(0);
    }



};

myapp.AddEditIndicator.SearchIndicatorTypeTap_execute = function (screen) {
    screen.Indicator.IndicatorType = screen.IndicatorTypes.selectedItem;
    screen.closePopup();
};

myapp.AddEditIndicator.SearchOutcomesTapped_execute = function (screen) {
    screen.Indicator.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};

myapp.AddEditIndicator.SearchOutputsTap_execute = function (screen) {
    screen.Indicator.Output = screen.Outputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditIndicator.SelectedSubOutputsTap_execute = function (screen) {
    screen.Indicator.SubOutput = screen.SubOutputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditIndicator.SearchIndicatorLocationsTap_execute = function (screen) {
    screen.Indicator.IndicatorLocations = screen.IndicatorLocations.selectedItem;
    screen.closePopup();
};
myapp.AddEditIndicator.Indicator_Programme_postRender = function (element, contentItem) {
    var input = $(element);
    //Setting here as we need access to the control
    contentItem.dataBind("screen.ProjectsSorted.selectedItem", function (newValue) {
        if (contentItem.screen.Client && contentItem.screen.Client.Value == "CARE Somalia") {

            if (newValue) {
                //We dont want to actually delete!
                /*if (contentItem.screen.ProgrammeSorted.selectedItem != null) {
                    contentItem.screen.ProgrammeSorted.deleteSelected();
                }*/
                contentItem.screen.Indicator.setProgramme(null);
                input.find("input").val("");
                myapp.activeDataWorkspace.MeerkatData.IndicatorTypes.filter("BusinessKey eq 'PRJ'").execute().then(function (x) {
                    contentItem.screen.Indicator.setIndicatorType(x.results[0]);
                });
            }
        }
    });
};
myapp.AddEditIndicator.Indicator_Project_postRender = function (element, contentItem) {
    //Setting here as we need access to the control through input
        var input = $(element);
        contentItem.dataBind("screen.ProgrammeSorted.selectedItem", function (newValue) {
            if (contentItem.screen.Client && contentItem.screen.Client.Value == "CARE Somalia") {

                if (newValue) {
                    //We dont want to actually delete!
                    /*if (contentItem.screen.ProjectsSorted.selectedItem != null) {
                        contentItem.screen.ProjectsSorted.deleteSelected();
                    }*/
                    contentItem.screen.Indicator.setProject(null);
                    input.find("input").val("");
                    myapp.activeDataWorkspace.MeerkatData.IndicatorTypes.filter("BusinessKey eq 'PROG'").execute().then(function (x) {
                        contentItem.screen.Indicator.setIndicatorType(x.results[0]);
                    });
                }
            }
        });
    
};
myapp.AddEditIndicator.Indicator_Sector_postRender = function (element, contentItem) {
   
        var input = $(element);
        contentItem.dataBind("screen.SubSectorSorted.selectedItem", function (newValue) {
            if (contentItem.screen.Client && contentItem.screen.Client.Value == "CARE Somalia") {

                if (newValue) {
                    contentItem.screen.Indicator.setSector(null);
                    input.find("input").val("");

                    /*myapp.activeDataWorkspace.MeerkatData.IndicatorTypes.filter("Code eq 'S' OR Code eq 'SEC'").execute().then(function (x) {
                        contentItem.screen.Indicator.setIndicatorType(x.results[0]);
                    });
                    */
                }
            }
        });
    
};
myapp.AddEditIndicator.Indicator_SubSector_postRender = function (element, contentItem) {
    
        var input = $(element);
        contentItem.dataBind("screen.SectorSorted.selectedItem", function (newValue) {
            if (contentItem.screen.Client && contentItem.screen.Client.Value == "CARE Somalia") {

                if (newValue) {
                    contentItem.screen.Indicator.setSector(null);
                    input.find("input").val("");

                    /*myapp.activeDataWorkspace.MeerkatData.IndicatorTypes.filter("Code eq 'SS' ").execute().then(function (x) {
                        contentItem.screen.Indicator.setIndicatorType(x.results[0]);
                    });
                    */
                }
            }
        });
    
};
myapp.AddEditIndicator.ProgrammeGroup_postRender = function (element, contentItem) {
    // Write code here.

};