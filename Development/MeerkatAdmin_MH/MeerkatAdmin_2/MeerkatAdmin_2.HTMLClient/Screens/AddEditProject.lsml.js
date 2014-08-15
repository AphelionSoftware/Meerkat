/// <reference path="../GeneratedArtifacts/viewModel.js" />
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
};
myapp.AddEditProject.ProjectType_postRender = function (element, contentItem) {
    // Write code here.
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
                {
                    target = contentItem.screen.findContentItem("OutcomeGroup");
                    break;
                }
            case "Programme":
                {
                    target = contentItem.screen.findContentItem("ProgrammeGroup");
                    break;
                }
            case "Sector":
                {
                    target = contentItem.screen.findContentItem("SectorGroup");
                    break;
                }
            case "SubSector":
                {
                    target = contentItem.screen.findContentItem("SubSectorGroup");
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