/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddForm.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.Form.isConfidential = false;
};
myapp.AddForm.Programme_postRender = function (element, contentItem) {
    var input = $(element);
    //Setting here as we need access to the control
    contentItem.dataBind("screen.ProjectsSorted.selectedItem", function (newValue) {
        if (newValue) {
            contentItem.screen.Form.setProgramme(null);
            input.find("input").val("");
         }
    });
};
myapp.AddForm.Project_postRender = function (element, contentItem) {
    //Setting here as we need access to the control through input
    var input = $(element);
    contentItem.dataBind("screen.ProgrammeSorted.selectedItem", function (newValue) {
        if (newValue) {
            contentItem.screen.Form.setProject(null);
            input.find("input").val("");
        }
        
    });

};