/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicator.created = function (screen) {
    // Write code here.
    var Indicator = screen.Indicator;

    // Can only safely do this if the Indicator is not modified.
    if (Indicator.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot refresh the Indicator because it was changed.",
            {
                title: "Cannot refresh"
            });
    }

    // Get the current Indicator ID
    var IndicatorID = screen.Indicator.IndicatorID;

    // Construct a new data workspace that is isolated from the
    // application's data workspace and load a separate instance
    // of this Indicator from server.
    var dataWorkspace = new myapp.DataWorkspace();
    return dataWorkspace.MeerkatData
        .Indicators_SingleOrDefault(IndicatorID)
        .execute().then(function (result) {

            // Query succeeded. If the Indicator still exists on
            //  server, merge it.
            var serverIndicator = result.results[0];
            if (serverIndicator) {
                // Replace the raw JSON object representing the
                // Indicator.
                Indicator.details._ = serverIndicator.details._;

                // Raise changes notification for all storage
                // properties, so the UI can update.
                Indicator.details.properties.all().forEach(
                function (prop) {
                    if (prop instanceof
                        msls.Entity.Details.StorageProperty) {
                        // The property's value.
                        prop.dispatchChange("value");
                        // The entity's property value.
                        Indicator.dispatchChange(prop.name);
                    }
                });
            }

        }, function (error) {
            msls.showMessageBox(error, {
                title: "Refresh failed"
            });
        });
}
myapp.AddEditIndicator.Indicator_Delete_execute = function (screen) {
    // Write code here.
    var Indicator = screen.Indicator;

    // Can only safely do this if the Indicator is not modified.
    if (Indicator.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Indicator because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Indicator.ActiveType = ActiveTypesQuery.results[0];
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