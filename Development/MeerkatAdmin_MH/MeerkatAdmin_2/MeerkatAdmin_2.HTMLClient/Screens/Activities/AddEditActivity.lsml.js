/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditActivity.Activity_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditActivity.Activity_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditActivity.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};

myapp.AddEditActivity.AddProjectStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Activity: screen.Activity,
        Type: "Project"
    });
};

myapp.AddEditActivity.EditStatusValues_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Project");
};
myapp.AddEditActivity.SelectedProjectTap_execute = function (screen) {  
    screen.Activity.Project = screen.Projects.selectedItem;
    screen.closePopup();
};
myapp.AddEditActivity.Project_postRender = function (element, contentItem) {

    if (contentItem.screen.Project_ID) {
        myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(contentItem.screen.Project_ID).execute().then(function (x) {
            contentItem.screen.Activity.setProject(x.results[0]);
        });
    }
        
    
};