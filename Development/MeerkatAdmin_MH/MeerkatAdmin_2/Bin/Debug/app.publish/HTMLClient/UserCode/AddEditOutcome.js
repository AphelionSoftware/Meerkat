/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOutcome.created = function (screen) {
    // Write code here.
    var Outcome = screen.Outcome;

    // Can only safely do this if the Outcome is not modified.
    if (Outcome.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Outcome because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Outcome ID
    var OutcomeID = screen.Outcome.OutcomeID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Outcome from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Outcomes_SingleOrDefault(OutcomeID)
        .execute().then(function (result) {

            // Query succeeded. If the Outcome still exists on
            //  server, merge it.
            var serverOutcome = result.results[0];
            if (serverOutcome) {
                // Replace the raw JSON object representing the
                // Outcome.
                Outcome.details._ = serverOutcome.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Outcome.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Outcome.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditOutcome.Outcome_Delete_execute = function (screen) {
    // Write code here.
    var Outcome = screen.Outcome;

    // Can only safely do this if the Outcome is not modified.
    if (Outcome.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Outcome because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Outcome.ActiveType = ActiveTypesQuery.results[0];
        return myapp.commitChanges().then(null, function fail(e) {
            myapp.cancelChanges();
            throw e;
        });

    }, function (error) {
        msls.showMessageBox(error, {
            title: "Delete failed"
        });
    });
};