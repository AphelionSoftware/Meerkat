/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditProject.created = function (screen) {
    // Write code here.
    var Project = screen.Project;

    // Can only safely do this if the Project is not modified.
    if (Project.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Project because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Project ID
    var ProjectID = screen.Project.ProjectID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Project from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Projects_SingleOrDefault(ProjectID)
        .execute().then(function (result) {

            // Query succeeded. If the Project still exists on
            //  server, merge it.
            var serverProject = result.results[0];
            if (serverProject) {
                // Replace the raw JSON object representing the
                // Project.
                Project.details._ = serverProject.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Project.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Project.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditProject.Project_Delete_execute = function (screen) {
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