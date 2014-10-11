/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.Link_Form_Project.Delete_execute = function (screen) {
    screen.getForm_Projects().then(function (customers) {
        // Delete selected
        Form_Projects.deleteSelected();
        // Save changes
        myapp.commitChanges().then(null, function fail(e) {
            msls.showMessageBox(e.message, { title: e.title }).then(function () {
                myapp.cancelChanges();
                throw e;
            });
        });
    });
};
myapp.Link_Form_Project.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);

    if (screen.Form_ID) {
        myapp.activeDataWorkspace.MeerkatData.Forms_SingleOrDefault(screen.Form_ID).execute().then(function (x) {
            screen.setForm(x.results[0]);
        }, function (x) {
            msls.showMessageBox(x, {
                title: "Default value for Form failed"
            });
        });
    }
    if (screen.Project_ID) {
        myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(screen.Project_ID).execute().then(function (x) {
            screen.setProject(x.results[0]);
        }, function (x) {
            msls.showMessageBox(x, {
                title: "Default value for Project failed"
            });
        });
    }

};