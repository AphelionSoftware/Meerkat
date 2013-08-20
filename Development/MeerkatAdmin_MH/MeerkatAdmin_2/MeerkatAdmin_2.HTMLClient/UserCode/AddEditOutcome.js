/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditOutcome.Outcome_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditOutcome.Outcome_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditOutcome.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditOutcome.AddOutputStatusValue_execute = function (screen) {
    myapp.showAddEditStatusValue(undefined, {
        Outcome: screen.Outcome,
        Type: "Output"
    }, {
        afterClosed: function () {
            screen.getStatusValues().then(function (x) {
                x.load();
            });
        }
    });
};

myapp.AddEditOutcome.EditStatusValue_execute = function (screen) {
    screen.getStatusValues().then(function (x) {
        myapp.showAddEditStatusValue(x.selectedItem, {
        }, {
            afterClosed: function () {
                x.load();
            }
        });
    });
};

myapp.AddEditOutcome.AddProjectStatusValue_execute = function (screen) {
    myapp.showAddEditStatusValue(undefined, {
        Outcome: screen.Outcome,
        Type: "Project"
    }, {
        afterClosed: function () {
            screen.getStatusValues().then(function (x) {
                x.load();
            });
        }
    });
};