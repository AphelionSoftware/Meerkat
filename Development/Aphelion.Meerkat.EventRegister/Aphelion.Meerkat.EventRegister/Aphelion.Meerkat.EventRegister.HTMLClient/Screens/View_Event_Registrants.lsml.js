/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightswitchTools.js" />

myapp.View_Event_Registrants.created = function (screen) {
    // Write code here.

    msls.application.lightswitchTools.configureCaptureForm(screen);
    for (i = 0; i <= 20; i++) {
        //var newAttendee = new myapp.EventRegister();
    }

};
myapp.View_Event_Registrants.AddRow_execute = function (screen) {
    // Write code here.
    var newAttendee = new myapp.EventRegister();
    newAttendee.FirstName = "Test";
    screen.EventRegisters.load();
};