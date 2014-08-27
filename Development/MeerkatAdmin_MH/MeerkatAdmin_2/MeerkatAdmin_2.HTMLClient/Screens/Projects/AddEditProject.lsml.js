﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

myapp.AddEditProject.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};

myapp.AddEditProject.Project_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditProject.Project_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditProject.AddProjectStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Project: screen.Project,
        Type: "Project"
    });
};

myapp.AddEditProject.EditStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Project");
};

myapp.AddEditProject.SearchOutcomesTap_execute = function (screen) {
    screen.Project.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};
myapp.AddEditProject.ProjectLevel_postRender = function (element, contentItem) {
    contentItem.dataBind("value", function (newValue) {

        var projectGroup = contentItem.screen.findContentItem("SubProjects");
        $.each(projectGroup.children, function (index, child) {
            child.isVisible = false;
        });

        if (newValue === undefined) {
            return;
        }

        var target = undefined;
        switch (newValue.Code) {
            case "Outcome":
            case "OM":
                {
                    target = contentItem.screen.findContentItem("OutcomeGroup");

                    /*if (contentItem.screen.ProgrammeSorted.selectedItem != null) {
                        contentItem.screen.ProgrammeSorted.deleteSelected();
                    }*/
                    contentItem.screen.Project.setProgramme(null);
                    break;
                }
            case "Programme":
            case "PRG":
            case "PROG":
                {
                    target = contentItem.screen.findContentItem("ProgrammeGroup");
                    /*
                    if (contentItem.screen.OutcomeSorted.selectedItem != null) {
                        contentItem.screen.OutcomeSorted.deleteSelected();
                    }*/
                    contentItem.screen.Project.setOutcome(null);
                    break;
                }
            case "Sector":
            case "S":
                {
                    target = contentItem.screen.findContentItem("SectorGroup");
                    break;
                }
            case "SubSector":
            case "Subsector":
            case "Sub-sector":
            case "Sub sector":
            case "SS":
                {
                    target = contentItem.screen.findContentItem("SubSectorGroup");
                    break;
                }
            default:
                {
                    alert("Unknown code: " + newValue.Code)
                    console.log(newValue.Code);
                    break;
                }

        }

        if (target !== undefined) {
            target.isVisible = true;
        }
    });

};