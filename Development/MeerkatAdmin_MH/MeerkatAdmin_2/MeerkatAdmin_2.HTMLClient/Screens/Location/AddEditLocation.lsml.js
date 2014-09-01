/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditLocation.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);
    msls.application.lightswitchTools.setBusinessKeyIsCode(screen);
    screen.ParentLocation.getLocation_ID().then(function(_){
        if (_ !== undefined) {
            screen.ParentLocation = screen.Location.Location1;// = screen.ParentLocation;
        } 
    });
    
};

myapp.AddEditLocation.SearchParentLocationsTap_execute = function (screen) {
    screen.Location.Location1 = screen.ParentLocations.selectedItem;
    screen.closePopup();
};

myapp.AddEditLocation.SearchLocationsTap_execute = function (screen) {
    screen.Location.locations;
    screen.closePopup();
};
myapp.AddEditLocation.Delete_execute_execute = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.deleteEntity(screen);

};
myapp.AddEditLocation.Location_Population_postRender = function (element, contentItem) {
    
    var DensityField = contentItem.screen.findContentItem("Density");
    var AreaField = contentItem.screen.findContentItem("Location_AreaKM");
    var PopulationField = contentItem.screen.findContentItem("Location_Population");
        
    contentItem.dataBind("value", function () {
        if (PopulationField && AreaField && PopulationField.stringValue && AreaField.stringValue){
            DensityField.value = String(PopulationField.stringValue / AreaField.stringValue);
        }
        
    }
    );
};
myapp.AddEditLocation.Location_AreaKM_postRender = function (element, contentItem) {
    var DensityField = contentItem.screen.findContentItem("Density");
    var AreaField = contentItem.screen.findContentItem("Location_AreaKM");
    var PopulationField = contentItem.screen.findContentItem("Location_Population");

    contentItem.dataBind("value", function () {
        if (PopulationField && AreaField && PopulationField.stringValue && AreaField.stringValue) {
            DensityField.value = String(PopulationField.stringValue / AreaField.stringValue);
        }

    }
    );
};