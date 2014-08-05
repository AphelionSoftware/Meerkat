/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditProjectParticipants.created = function (screen) {
    // Set default values and other configurations.
    msls.application.lightswitchTools.configureCaptureForm(screen);
    //msls.application.lightswitchTools.setBusinessKeyIsName(screen);
};
myapp.AddEditProjectParticipants.beforeApplyChanges = function (screen) {
    // Write code here.
    if (screen.Person.ContactDetails == null) {

        screen.findContentItem("ContactDetails").validationResults = [

        new msls.ValidationResult(

        screen.Person.details.properties.contactDetails,

        "Contact Details cannot be empty.")

        ];

        return false;

    }
};