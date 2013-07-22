/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOutput.created = function (screen) {
    // Write code here.
    var Output = screen.Output;

    // Can only safely do this if the Output is not modified.
    if (Output.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Output because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Output ID
    var OutputID = screen.Output.OutputID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Output from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Outputs_SingleOrDefault(OutputID)
        .execute().then(function (result) {

            // Query succeeded. If the Output still exists on
            //  server, merge it.
            var serverOutput = result.results[0];
            if (serverOutput) {
                // Replace the raw JSON object representing the
                // Output.
                Output.details._ = serverOutput.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Output.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Output.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditOutput.Output_Delete_execute = function (screen) {
    // Write code here.
    var Output = screen.Output;

    // Can only safely do this if the Output is not modified.
    if (Output.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Output because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Output.ActiveType = ActiveTypesQuery.results[0];
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