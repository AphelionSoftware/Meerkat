/// <reference path="~/GeneratedArtifacts/viewModel.js" />
/// <reference path="../scripts/lightswitchtools.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

 
myapp.TestGEOJson.getGeoJSON_execute = function (screen) {
    var sSQL = "select geog from maps.ProjectReachAreas";
    msls.application.lightswitchTools.getGeoJSON(sSQL, function ( retJson) {
        var x = retJson;
    })
};