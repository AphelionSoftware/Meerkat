/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditOrganization.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
};

myapp.AddEditOrganization.SearchOrganizationTypesTap_execute = function (screen) {
    screen.Organization.OrganizationType = screen.OrganizationTypes.selectedItem;
    screen.closePopup();
};
myapp.AddEditOrganization.Delete_execute_execute = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.deleteEntity(screen);

};