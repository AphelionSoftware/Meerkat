/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditSubOutput.SubOutput_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditSubOutput.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};

myapp.AddEditSubOutput.SubOutput_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditSubOutput.EditStatusValues_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Output");
};

myapp.AddEditSubOutput.AddOutputStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        SubOutput: screen.SubOutput,
        Type: "Output"
    });
};
