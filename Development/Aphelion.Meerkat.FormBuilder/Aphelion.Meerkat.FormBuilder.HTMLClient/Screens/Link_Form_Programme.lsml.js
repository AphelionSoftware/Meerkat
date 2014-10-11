/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.Link_Form_Programme.Delete_execute = function (screen) {
    screen.getForm_Programmes().then(function (x) {
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

myapp.Link_Form_Programme.created = function (screen) {
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
    if (screen.Programme_ID) {
        myapp.activeDataWorkspace.MeerkatData.Programmes_SingleOrDefault(screen.Programme_ID).execute().then(function (x) {
            screen.setProgramme(x.results[0]);
        }, function (x) {
            msls.showMessageBox(x, {
                title: "Default value for Programme failed"
            });
        });
    }


};