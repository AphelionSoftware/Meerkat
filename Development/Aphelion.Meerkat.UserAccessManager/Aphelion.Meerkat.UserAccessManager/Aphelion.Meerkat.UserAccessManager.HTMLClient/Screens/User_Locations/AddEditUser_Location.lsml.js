/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.AddEditUser_Location.Delete_execute = function (screen) {
    screen.getUser_Location().then(function (x) {
        // Delete selected
        x.deleteSelected();
        // Save changes
        myapp.commitChanges().then(null, function fail(e) {
            msls.showMessageBox(e.message, { title: e.title }).then(function () {
                myapp.cancelChanges();
                throw e;
            });
        });
    });
};
myapp.AddEditUser_Location.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);

};