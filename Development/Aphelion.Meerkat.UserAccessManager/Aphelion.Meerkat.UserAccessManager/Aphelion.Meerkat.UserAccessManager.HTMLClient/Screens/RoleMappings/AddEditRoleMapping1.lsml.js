/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.AddEditRoleMapping1.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);

};
myapp.AddEditRoleMapping1.Delete_execute = function (screen) {
    screen.getUser_SystemRole_ProjectProgramme().then(function (rm) {
        // Delete selected
        try {
            rm.deleteEntity();
            // Save changes
            myapp.commitChanges().then(null, function fail(e) {
                msls.showMessageBox(e.message, { title: e.title }).then(function () {
                    myapp.cancelChanges();
                    throw e;
                });
            });
        }
        catch (e){
            this.showMessageBox("Error: " + e);
        }
    });
};
myapp.AddEditRoleMapping1.Programme_postRender = function (element, contentItem) {
    var input = $(element);
    //Setting here as we need access to the control
    contentItem.dataBind("screen.ProjectsSorted.selectedItem", function (newValue) {
        if (newValue) {
            contentItem.screen.User_SystemRole_ProjectProgramme.setProgramme(null);
            input.find("input").val("");
        }
    });

};
myapp.AddEditRoleMapping1.Project_postRender = function (element, contentItem) {
    //Setting here as we need access to the control through input
    var input = $(element);
    contentItem.dataBind("screen.ProgrammeSorted.selectedItem", function (newValue) {
        if (newValue) {
            contentItem.screen.User_SystemRole_ProjectProgramme.setProject(null);
            input.find("input").val("");
        }
    });

};