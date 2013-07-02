/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_execute = function (screen) {
    // Write code here.
    var IndicatorLocation = screen.IndicatorLocation;

    // Can only safely do this if the IndicatorLocation is not modified.
    if (IndicatorLocation.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the IndicatorLocation because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        IndicatorLocation.ActiveType = ActiveTypesQuery.results[0];
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