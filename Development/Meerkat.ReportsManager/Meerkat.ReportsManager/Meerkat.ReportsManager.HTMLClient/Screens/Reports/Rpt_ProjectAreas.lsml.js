/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.Rpt_ProjectAreas.LoadingStatus_render = function (element, contentItem) {
 
    div = $("<div class='LoadingStatus' id='LoadingStatus' style='font-size:20px'></div>");
    $(div).appendTo($(element));
    chartWrapper.statusDiv = div;
};
myapp.Rpt_ProjectAreas.Map_render = function (element, contentItem) {
    div = $("<div class='mapPPDiv' id='mapPPDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.mapID = 'mapPPDiv';

};
myapp.Rpt_ProjectAreas.created = function (screen) {
    chartWrapper = new dcLSWrapper();

};