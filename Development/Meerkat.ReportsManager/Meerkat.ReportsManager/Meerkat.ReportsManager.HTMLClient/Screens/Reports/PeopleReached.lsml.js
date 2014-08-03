/// <reference path="../../scripts/dc.pp.disagg.js" />
/// <reference path="~/GeneratedArtifacts/viewModel.js" />
    
myapp.PeopleReached.created = function (screen) {
    // Write code here.

};
myapp.PeopleReached.ScreenContent_render = function (element, contentItem) {
    div = $("<div class='mapPPDiv' id='mapPPDiv' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwPeopleReacheds._requestUri + "?$format=json&$filter=LocationTypeCode eq 'DIST'";
    var mapURL = url.split("MeerkatData.svc")[0] + "HTMLClient/Maps/DIST.geojson";
    mapCharts(".mapPPDiv", url, mapURL);

};