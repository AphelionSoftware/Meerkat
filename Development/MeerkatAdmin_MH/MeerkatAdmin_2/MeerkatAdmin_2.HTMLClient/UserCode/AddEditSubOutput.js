/// <reference path="../GeneratedArtifacts/viewModel.js" />


myapp.AddEditSubOutput.SubOutput_Delete_execute = function (screen) {
    // Write code here.
    var SubOutput = screen.SubOutput;
    SubOutput.deleteEntity();

    return myapp.commitChanges().then(null, function fail(e) {

        myapp.cancelChanges();

        throw e;

    });
    // Can only safely do this if the SubOutput is not modified.
    if (SubOutput.details.entityState !== msls.EntityState.unchanged) {
        return msls.showMessageBox(
            "Cannot delete the SubOutput because it was changed.",
            {
                title: "Cannot delete"
            });
    }

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(-1).execute().then(function (ActiveTypesQuery) {
        SubOutput.ActiveType = ActiveTypesQuery.results[0];
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


myapp.AddEditSubOutput.beforeApplyChanges = function (screen) {
    "use strict";

    var activeType = screen.findContentItem("ActiveType");
    if (activeType.value === undefined) {
        activeType.validationResults = [
            new msls.ValidationResult(screen.SubOutput.details.properties.ActiveType, "Active type is required")
        ];

        return false;
    }
};