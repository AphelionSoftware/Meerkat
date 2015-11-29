/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

myapp.AddEditStatusValue.created = function (screen) {

    if (screen.StatusValue && screen.StatusValue.StatusValuesID)
    {
        if (screen.StatusValue.Output) {
            screen.findContentItem("OutputGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.Outcome) {
            screen.findContentItem("OutcomeGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.SubOutput) {
            screen.findContentItem("SubOutputGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.Sector) {
            screen.findContentItem("SectorGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.SubSector) {
            screen.findContentItem("SubSectorGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.Programme) {
            screen.findContentItem("ProgrammeGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.Project) {
            screen.findContentItem("ProjectGroup").isVisible = true;
            return;
        }
        if (screen.StatusValue.Activity) {
            screen.findContentItem("ActivityGroup").isVisible = true;
            return;
        }

        if (screen.StatusValue.Output_ID) {
            screen.findContentItem("OutputGroup").isVisible = true;
            return;
        }

    }

    if (screen.Values === undefined) {
        msls.showMessageBox("This screen has been called without the required values and thus will be broken");
    }

    screen.StatusValue = new myapp.StatusValue();    

    screen.StatusValue.sys_CreatedBy = "NA";
    screen.StatusValue.sys_CreatedOn = "1999/01/01";
    screen.StatusValue.sys_ModifiedBy = "NA";
    screen.StatusValue.sys_ModifiedOn = "1999/01/01";

    if (screen.Values.Outcome !== undefined || screen.Values.DataType === "Outcome") {
        screen.details.displayName = "Add Outcome Status Value";
        screen.findContentItem("OutcomeGroup").isVisible = true;
        if (screen.Values.Outcome !== undefined) {
            screen.StatusValue.setOutcome(screen.Values.Outcome);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Outcomes_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setOutcome(Item.results[0]);
            })
        }
    }

    if (screen.Values.Output !== undefined || screen.Values.DataType === "Output") {
        screen.details.displayName = "Add Output Status Value";
        screen.findContentItem("OutputGroup").isVisible = true;
        if (screen.Values.Output !== undefined) {
            screen.StatusValue.setOutput(screen.Values.Output);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Outputs_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setOutput(Item.results[0]);
            })
        }
    }

    if (screen.Values.SubOutput !== undefined || screen.Values.DataType === "SubOutput") {
        screen.details.displayName = "Add SubOutput Status Value";
        screen.findContentItem("SubOutputGroup").isVisible = true;
        
        if (screen.Values.SubOutput !== undefined) {
            screen.StatusValue.setSubOutput(screen.Values.SubOutput);
        } else {
            myapp.activeDataWorkspace.MeerkatData.SubOutputs_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setSubOutput(Item.results[0]);
            })
        }
    }

    if (screen.Values.Activity !== undefined || screen.Values.DataType === "Activity") {
        screen.findContentItem("ActivityGroup").isVisible = true;
        if (screen.Values.Activity !== undefined) {
            screen.StatusValue.setActivity(screen.Values.Activity);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Activitys_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setActivity(Item.results[0]);
            })
        }
        screen.details.displayName = "Add Activity Status Value";
    }

    if (screen.Values.Project !== undefined || screen.Values.DataType === "Project") {
        screen.findContentItem("ProjectGroup").isVisible = true;
        if (screen.Values.Project !== undefined) {
            screen.StatusValue.setProject(screen.Values.Project);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setProject(Item.results[0]);
            })
        }
        screen.details.displayName = "Add Project Status Value";
    }

    if (screen.Values.Programme !== undefined || screen.Values.DataType === "Programme") {
        screen.findContentItem("ProgrammeGroup").isVisible = true;
        if (screen.Values.Programme !== undefined) {
            screen.StatusValue.setProgramme(screen.Values.Programme);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Programmes_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setProgramme(Item.results[0]);
            })
        }
        screen.details.displayName = "Add Programme Status Value";
    }


    if (screen.Values.Sector !== undefined || screen.Values.DataType === "Sector") {
        screen.findContentItem("SectorGroup").isVisible = true;
        if (screen.Values.Sector !== undefined) {
            screen.StatusValue.setSector(screen.Values.Sector);
        } else {
            myapp.activeDataWorkspace.MeerkatData.Sectors_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setSector(Item.results[0]);
            })
        }
        screen.details.displayName = "Add Sector Status Value";
    }

    if (screen.Values.SubSector !== undefined || screen.Values.DataType === "SubSector") {
        screen.findContentItem("SubSectorGroup").isVisible = true;
        if (screen.Values.SubSector !== undefined) {
            screen.StatusValue.setSubSector(screen.Values.SubSector);
        } else {
            myapp.activeDataWorkspace.MeerkatData.SubSectors_SingleOrDefault(screen.ItemID).execute().then(function (Item) {
                screen.StatusValue.setSubSector(Item.results[0]);
            })
        }
        screen.details.displayName = "Add SubSector Status Value";
    }


    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRange = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriods.load().then(function () {
                screen.StatusValue.setReportingPeriod(reportingPeriod.results[0]);
            });
            //debugger
        });
    });

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes.filter("Code eq 'Active'").execute().then(function (x) {
        screen.StatusValue.setActiveType(x.results[0]);
    }, function (x) {
        msls.showMessageBox(x, {
            title: "Default value for ActiveType failed"
        });
    });
};

myapp.AddEditStatusValue.CopyStatusValue_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.copyIcon(element);
};

myapp.AddEditStatusValue.CopyStatusValue_execute = function (screen) {
    screen.getStatusValues().then(function (statusValues) {
        if (statusValues.selectedItem === undefined) {
            debugger
            msls.showMessageBox("You must select an existing version from below first", {
                title: "Error"
            });
        } else {

            screen.StatusValue.Percentage = statusValues.selectedItem.Percentage;
            statusValues.selectedItem.getStatusType().then(function (statusType) {
                screen.StatusValue.setStatusType(statusType);
            });

            statusValues.selectedItem.getLocation().then(function (location) {
                screen.StatusValue.setLocation(location);
            });

            statusValues.selectedItem.getDataVersion().then(function (dataVersion) {
                screen.StatusValue.setDataVersion(dataVersion);
            });
        }
    });
};

myapp.AddEditStatusValue.SearchOutcomesTap_execute = function (screen) {
    screen.StatusValue.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchOutputsTap_execute = function (screen) {
    screen.StatusValue.Output = screen.Outputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchSubOutputsTap_execute = function (screen) {
    screen.StatusValue.SubOutput = screen.SubOutputs.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchProjectsTap_execute = function (screen) {
    screen.StatusValue.Project = screen.Projects.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchActivitiesTap_execute = function (screen) {
    screen.StatusValue.Activity = screen.Activities.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchStatusTypesTap_execute = function (screen) {
    screen.StatusValue.StatusType = screen.StatusTypes.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchDataVersionsTap_execute = function (screen) {
    screen.StatusValue.DataVersion = screen.DataVersions.selectedItem;
    screen.closePopup();
};

myapp.AddEditStatusValue.SearchLocationsTap_execute = function (screen) {
    screen.StatusValue.Location = screen.Locations.selectedItem;
    screen.closePopup();
};



//Default version to publish as status values will mostly go straight to publish
myapp.AddEditStatusValue.StatusValue_DataVersion_postRender = function (element, contentItem) {
    myapp.activeDataWorkspace.MeerkatData.DataVersions_SingleOrDefault(1).execute().then(function (Item) {
        contentItem.screen.StatusValue.setDataVersion(Item.results[0]);
        contentItem.screen.DataVersions.selectedItem = Item.results[0];
        

    });

};
myapp.AddEditStatusValue.StatusType_postRender = function (element, contentItem) {
    /*if (contentItem.value.StatusType.Code == "-") {
        $(element).css("background", "#fc8d59");
    } else if (contentItem.value.StatusType.Code == "=") {
        $(element).css("background", "#ffffbf");
    } else if (contentItem.value.StatusType.Code == "+") {
        $(element).css("background", "#91cf60");
    }*/

};
myapp.AddEditStatusValue.RowTemplate7_postRender = function (element, contentItem) {
    if (contentItem.value.BusinessKey == "-") {
        $(element).css("background", "#fc8d59");
    } else if (contentItem.value.BusinessKey == "=") {
        $(element).css("background", "#ffffbf");
    } else if (contentItem.value.BusinessKey == "+") {
        $(element).css("background", "#91cf60");
    }

};