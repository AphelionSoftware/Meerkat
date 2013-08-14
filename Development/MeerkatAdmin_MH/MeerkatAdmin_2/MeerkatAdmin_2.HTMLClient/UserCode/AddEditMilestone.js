﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditMilestone.Milestone_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Milestone);
};

myapp.AddEditMilestone.Milestone_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditMilestone.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.Milestone.IsKeyIndicator = false;
};

myapp.AddEditMilestone.MilestoneType_postRender = function (element, contentItem) {
    contentItem.dataBind("value", function (newValue) {

        var indicatorGroup = contentItem.screen.findContentItem("Subcategories");
        $.each(indicatorGroup.children, function (index, child) {
            child.isVisible = false;
        });

        if (newValue === undefined) {
            return;
        }

        var target = undefined;
        switch (newValue.Code) {
            case "Activity":
                {
                    target = contentItem.screen.findContentItem("Activity");
                    break;
                }
            case "Project":
                {
                    target = contentItem.screen.findContentItem("Project");
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
