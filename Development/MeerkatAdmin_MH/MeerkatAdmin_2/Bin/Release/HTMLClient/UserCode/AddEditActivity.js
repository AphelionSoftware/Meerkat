/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditActivity.created = function (screen) {
    // Write code here.
    var Activity = screen.Activity;

    // Can only safely do this if the Activity is not modified.
    if (Activity.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Activity because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Activity ID
    var ActivityID = screen.Activity.ActivityID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Activity from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Activities_SingleOrDefault(ActivityID)
        .execute().then(function (result) {

            // Query succeeded. If the Activity still exists on
            //  server, merge it.
            var serverActivity = result.results[0];
            if (serverActivity) {
                // Replace the raw JSON object representing the
                // Activity.
                Activity.details._ = serverActivity.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Activity.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Activity.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditActivity.Activity_Delete_execute = function (screen) {
    // Write code here.
    var Activity = screen.Activity;

    // Can only safely do this if the Activity is not modified.
    if (Activity.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Activity because it was changed.",
            {
                title: "Cannot delete"
            });
    }
    
    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Activity.ActiveType = ActiveTypesQuery.results[0];
        //myapp.activeDataWorkspace.MeerkatData.SaveChanges();


        //myapp.activeDataWorkspace.MeerkatData.saveChanges();
        //myapp.activeDataWorkspace.MeerkatData.details.dataService.saveChanges();
        //myapp.activeDataWorkspace.MeerkatData.dispatchChange();
        return myapp.commitChanges().then(null, function fail(e) {
            myapp.cancelChanges();
            throw e;
        });

    }, function (error) {
        msls.showMessageBox(error, {
            title: "Delete failed"
        });
    });


    /*return myapp.applyChanges().then(
        function succeed() {
        },

        function fail(e) {
            myapp.cancelChanges();
            throw e;
        }
    );*/

    


};