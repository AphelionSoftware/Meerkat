/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataVersion.DataVersion_delete_execute = function (screen) {
    // Write code here.
    var DataVersion = screen.DataVersion;
    
    DataVersion.deleteEntity();

    return myapp.commitChanges().then(null, function fail(e) {

        myapp.cancelChanges();

        throw e;

    });
    // Can only safely do this if the DataVersion is not modified.
    if (DataVersion.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the DataVersion because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        DataVersion.ActiveType = ActiveTypesQuery.results[0];
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