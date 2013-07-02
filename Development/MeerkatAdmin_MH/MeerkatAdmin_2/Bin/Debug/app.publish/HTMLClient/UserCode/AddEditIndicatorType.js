/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorType.created = function (screen) {
    // Write code here.
    var IndicatorType = screen.IndicatorType;

    // Can only safely do this if the IndicatorType is not modified.
    if (IndicatorType.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the IndicatorType because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current IndicatorType ID
    var IndicatorTypeID = screen.IndicatorType.IndicatorTypeID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this IndicatorType from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .IndicatorTypes_SingleOrDefault(IndicatorTypeID)
        .execute().then(function (result) {

            // Query succeeded. If the IndicatorType still exists on
            //  server, merge it.
            var serverIndicatorType = result.results[0];
            if (serverIndicatorType) {
                // Replace the raw JSON object representing the
                // IndicatorType.
                IndicatorType.details._ = serverIndicatorType.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                IndicatorType.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        IndicatorType.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditIndicatorType.IndicatorType_delete_execute = function (screen) {
    // Write code here.
    var IndicatorType = screen.IndicatorType;

    // Can only safely do this if the IndicatorType is not modified.
    if (IndicatorType.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the IndicatorType because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        IndicatorType.ActiveType = ActiveTypesQuery.results[0];
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