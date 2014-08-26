/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_execute = function (screen) {
    msls.application.lightswitchTools.deleteEntity(screen);  
};

myapp.AddEditIndicatorLocation.IndicatorLocation_delete_canExecute = function (screen) {
    return msls.application.lightswitchTools.canDelete(screen);
};

myapp.AddEditIndicatorLocation.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
};

myapp.AddEditIndicatorLocation.SearchIndicatorsTap_execute = function (screen) {
    screen.IndicatorLocation.Indicator = screen.Indicators.selectedItem;
    screen.closePopup();
};

myapp.AddEditIndicatorLocation.SelectedLocationsTap_execute = function (screen) {
    screen.IndicatorLocation.Location = screen.Locations.selectedItem;
    screen.closePopup();
};