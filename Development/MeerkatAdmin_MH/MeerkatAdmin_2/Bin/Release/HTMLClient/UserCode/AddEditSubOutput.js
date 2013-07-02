/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditSubOutput.created = function (screen) {
    // Write code here.
    var SubOutput = screen.SubOutput;

    // Can only safely do this if the SubOutput is not modified.
    if (SubOutput.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the SubOutput because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current SubOutput ID
    var SubOutputID = screen.SubOutput.SubOutputID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this SubOutput from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .SubOutputs_SingleOrDefault(SubOutputID)
        .execute().then(function (result) {

            // Query succeeded. If the SubOutput still exists on
            //  server, merge it.
            var serverSubOutput = result.results[0];
            if (serverSubOutput) {
                // Replace the raw JSON object representing the
                // SubOutput.
                SubOutput.details._ = serverSubOutput.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                SubOutput.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        SubOutput.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditSubOutput.Project_Delete_execute = function (screen) {
    // Write code here.
    var Project = screen.Project;

    // Can only safely do this if the Project is not modified.
    if (Project.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Project because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Project.ActiveType = ActiveTypesQuery.results[0];
        //myapp.activeDataWorkspace.MeerkatData.SaveChanges();
    }, function (error) {
        msls.showMessageBox(error, {
            title: "Delete failed"
        });
    });
};
myapp.AddEditSubOutput.SubOutput_Delete_execute = function (screen) {
    // Write code here.
    var SubOutput = screen.SubOutput;

    // Can only safely do this if the SubOutput is not modified.
    if (SubOutput.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the SubOutput because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        SubOutput.ActiveType = ActiveTypesQuery.results[0];
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