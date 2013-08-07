/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditSubOutput.beforeApplyChanges = function (screen) {
    "use strict";

    var activeType = screen.findContentItem("ActiveType");
    if (activeType.value === undefined) {
        activeType.validationResults = [
            new msls.ValidationResult(screen.SubOutput.details.properties.ActiveType, "Active type is required")
        ];

        return false;
    }
};

myapp.AddEditSubOutput.Project_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen.SubOutput, "Activity");
};

myapp.AddEditSubOutput.SubOutput_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen.SubOutput);
};