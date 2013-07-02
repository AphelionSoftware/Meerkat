/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditMilestoneValue.created = function (screen) {
    // Write code here.
    // Write code here.
    var MileStoneValue = screen.MileStoneValue;

    // Can only safely do this if the Outcome is not modified.
    if (MileStoneValue.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Indicator Value because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Outcome ID
    var MileStoneID = screen.MileStoneValue.MileStoneID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Outcome from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .MileStoneValues_SingleOrDefault(MileStoneID)
        .execute().then(function (result) {

            // Query succeeded. If the Outcome still exists on
            //  server, merge it.
            var serverOutcome = result.results[0];
            if (serverOutcome) {
                // Replace the raw JSON object representing the
                //MileStoneValue.
                MileStoneValue.details._ = serverOutcome.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                MileStoneValue.details.properties.all().forEach(
                 function (prop) {
                     if (prop instanceof
                         msls.Entity.Details.StorageProperty) {
                         // The property's value.
                         prop.dispatchChange("value");
                         // The entity's property value.
                         MileStoneValue.dispatchChange(prop.name);
                     }
                 });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
};