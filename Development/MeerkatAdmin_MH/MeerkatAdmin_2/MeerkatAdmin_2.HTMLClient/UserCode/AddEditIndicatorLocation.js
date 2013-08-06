/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_execute = function (screen) {
    if (screen.IndicatorLocation.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Indicator Location because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    screen.IndicatorLocation.deleteEntity();

    myapp.commitChanges().then(null, function fail(e) {
        // If error occurs, show the error.
        msls.showMessageBox(e.message, { title: e.title }).then(function () {
            // Discard Changes
            screen.details.dataWorkspace.ApplicationData.details.discardChanges();
        });
    });
};