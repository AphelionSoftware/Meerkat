/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

myapp.AddEditProject.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    //msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    //msls.application.lightswitchTools.setDescriptionIsShortName(screen);
};

myapp.AddEditProject.Project_Delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);
};

myapp.AddEditProject.Project_Delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditProject.AddProjectStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.addStatusValue(screen, {
        Project: screen.Project,
        Type: "Project"
    });
};

myapp.AddEditProject.EditStatusValue_execute = function (screen) {
    msls.application.lightswitchTools.editStatusValue(screen, "Project");
};

myapp.AddEditProject.SearchOutcomesTap_execute = function (screen) {
    screen.Project.Outcome = screen.Outcomes.selectedItem;
    screen.closePopup();
};
myapp.AddEditProject.SearchProgrammesTap_execute = function (screen) {
    // Write code here.
    screen.Project.Programme = screen.Programmes.selectedItem;
    screen.closePopup();
};
myapp.AddEditProject.SearchSectorsTap_execute = function (screen) {
    // Write code here.
    screen.Project.Sector = screen.Sectors.selectedItem;
    screen.closePopup();
};
myapp.AddEditProject.SearchSubSectorsTap_execute = function (screen) {
    // Write code here.
    screen.Project.SubSector = screen.SubSectors.selectedItem;
    screen.closePopup();
};