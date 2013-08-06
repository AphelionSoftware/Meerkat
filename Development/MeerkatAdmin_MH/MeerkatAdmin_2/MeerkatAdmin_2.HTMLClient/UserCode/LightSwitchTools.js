/// <reference path="../GeneratedArtifacts/viewModel.js" />

(function (lightswitchTools, undefined) {
    "use strict";

    lightswitchTools.canDelete = function (entity) {
        if (entity.details.entityState !== msls.EntityState.unchanged) {
            return false;
        };

        return true;
    };

    lightswitchTools.deleteEntity = function (entity, entityLabel) {
        if (!lightswitchTools.canDelete(entity)) {
            return msls.showMessageBox(
                "Cannot delete the " + entityLabel + " because it was changed.",
                {
                    title: "Cannot delete"
                });
        };

        entity.deleteEntity();

        myapp.commitChanges().then(null, function fail(e) {
            // If error occurs, show the error.
            msls.showMessageBox(e.message, { title: e.title }).then(function () {
                // Discard Changes
                screen.details.dataWorkspace.ApplicationData.details.discardChanges();
            });
        });
    }
}(msls.application.lightswitchTools = msls.application.lightswitchTools || {}));

