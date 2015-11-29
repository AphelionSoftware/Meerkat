/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.AddEditSystemRole.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);

    var CodeField = screen.findContentItem("SystemRoleCode");
    var BusinessKeyField = screen.findContentItem("SystemRoleBusinessKey");
    CodeField.dataBind("value", function () {
        if (CodeField.value !== undefined && CodeField.value.length > 0) {
            var currentLength = 0;
            if (BusinessKeyField.value !== undefined) {
                currentLength = BusinessKeyField.value.length;
            }

            if (currentLength === 0) {
                BusinessKeyField.value = CodeField.value;
            }
        }
    });
};
myapp.AddEditSystemRole.Delete_execute = function (screen) {
    // Write code here.
    screen.getSystemRole().then(function (x) {
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