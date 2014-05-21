/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicator.Indicator_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
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
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.Indicator.IsKeyIndicator = false;
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