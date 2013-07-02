/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditDataSource.DataSource_Delete_execute = function (screen) {
    // Write code here.
    var DataSource = screen.DataSource;

    // Can only safely do this if the DataSource is not modified.
    if (DataSource.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the DataSource because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        DataSource.ActiveType = ActiveTypesQuery.results[0];
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