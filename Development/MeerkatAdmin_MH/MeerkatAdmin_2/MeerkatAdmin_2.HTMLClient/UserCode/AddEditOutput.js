/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOutput.Output_Delete_execute = function (screen) {
    // Write code here.
    var Output = screen.Output;
  

    // Can only safely do this if the Output is not modified.
    if (Output.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the Output because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        Output.ActiveType = ActiveTypesQuery.results[0];
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