/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditLocation.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    screen.ParentLocation.getLocation_ID().then(function(_){
        if (_ !== undefined) {
            screen.Location.Location1 = screen.ParentLocation;
        } 
    });
    
};

myapp.AddEditLocation.SearchParentLocationsTap_execute = function (screen) {
    screen.Location.Location1 = screen.ParentLocations.selectedItem;
    screen.closePopup();
};

myapp.AddEditLocation.SearchLocationsTap_execute = function (screen) {
    screen.Location.locations
    screen.closePopup();
};