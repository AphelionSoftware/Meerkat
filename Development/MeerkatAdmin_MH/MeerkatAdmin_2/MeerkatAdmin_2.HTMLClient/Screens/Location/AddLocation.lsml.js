/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.AddLocation.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);

};
myapp.AddLocation.Population_postRender = function (element, contentItem) {
    var DensityField = contentItem.screen.findContentItem("Density");
    var AreaField = contentItem.screen.findContentItem("AreaKM");
    var PopulationField = contentItem.screen.findContentItem("Population");

    contentItem.dataBind("value", function () {
        if (PopulationField && AreaField && PopulationField.stringValue && AreaField.stringValue) {
            DensityField.value = String(PopulationField.stringValue / AreaField.stringValue);
        }

    }
    );
};
myapp.AddLocation.AreaKM_postRender = function (element, contentItem) {
    var DensityField = contentItem.screen.findContentItem("Density");
    var AreaField = contentItem.screen.findContentItem("AreaKM");
    var PopulationField = contentItem.screen.findContentItem("Population");

    contentItem.dataBind("value", function () {
        if (PopulationField && AreaField && PopulationField.stringValue && AreaField.stringValue) {
            DensityField.value = String(PopulationField.stringValue / AreaField.stringValue);
        }

    }
    );
};