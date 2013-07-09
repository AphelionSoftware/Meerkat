/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataVersionLevel.DataVersionLevel_delete_execute = function (screen) {
    // Write code here.
    var DataVersionLevel = screen.DataVersionLevel;

    // Can only safely do this if the DataVersionLevel is not modified.
    if (DataVersionLevel.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the DataVersionLevel because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        DataVersionLevel.ActiveType = ActiveTypesQuery.results[0];
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
