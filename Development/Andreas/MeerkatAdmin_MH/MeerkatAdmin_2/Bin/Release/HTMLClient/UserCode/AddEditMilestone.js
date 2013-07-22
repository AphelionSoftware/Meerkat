/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditMilestone.created = function (screen) {
    // Write code here.
    var Milestone = screen.Milestone;

    // Can only safely do this if the Milestone is not modified.
    if (Milestone.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Milestone because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Milestone ID
    var MilestoneID = screen.Milestone.MilestoneID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Milestone from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Milestones_SingleOrDefault(MilestoneID)
        .execute().then(function (result) {

            // Query succeeded. If the Milestone still exists on
            //  server, merge it.
            var serverMilestone = result.results[0];
            if (serverMilestone) {
                // Replace the raw JSON object representing the
                // Milestone.
                Milestone.details._ = serverMilestone.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Milestone.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Milestone.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditMilestone.Milestone_Delete_execute = function (screen) {
    // Write code here.
    var Milestone = screen.Milestone;

    // Can only safely do this if the Milestone is not modified.
    if (Milestone.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Milestone because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Milestone.ActiveType = ActiveTypesQuery.results[0];
        //myapp.activeDataWorkspace.MeerkatData.SaveChanges();
    }, function (error) {
        msls.showMessageBox(error, {
            title: "Delete failed"
        });
    });
    return myapp.applyChanges().then(null,
        function fail(e) {
            myapp.cancelChanges();
            throw e;
        }
    );
};