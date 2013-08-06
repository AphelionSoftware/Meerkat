/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicator.Indicator_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.Indicator, "Indicator");
};

myapp.AddEditIndicator.IndicatorType_postRender = function (element, contentItem) {
    
    contentItem.dataBind("value", function (newValue) {

        var indicatorGroup = contentItem.screen.findContentItem("SubIndicators");
        $.each(indicatorGroup.children, function (index, child) {
            child.isVisible = false;
        });

        if (newValue === undefined) {
            return;
        }

        var target = undefined;
        switch (newValue.Code) {
            case "Outcome":
                {
                    target = contentItem.screen.findContentItem("Outcome");
                    break;
                }
            case "Output":
                {
                    target = contentItem.screen.findContentItem("Output");
                    break;
                }
            case "SubOutput":
                {
                    target = contentItem.screen.findContentItem("SubOutput");
                    break;
                }
            case "Activity":
                {
                    target = contentItem.screen.findContentItem("Activity");
                    break;
                }
            case "Milestone":
                {
                    target = contentItem.screen.findContentItem("Project");
                    break;
                }
            case "OS":
                {
                    // there is no sub status for this that is entered in by the user.
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
    return msls.application.lightswitchTools.canDelete(screen.Indicator);
};