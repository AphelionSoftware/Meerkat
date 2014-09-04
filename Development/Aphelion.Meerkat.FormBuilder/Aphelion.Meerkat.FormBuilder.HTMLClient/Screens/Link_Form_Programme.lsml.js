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
    myapp.activeDataWorkspace.MeerkatData.Forms_SingleOrDefault(screen.FormID).execute().then(function (x) {
        screen.setForm(x.results[0]);
    }, function (x) {
        msls.showMessageBox(x, {
            title: "Default value for Form failed"
        });
    });

};