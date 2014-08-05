/// <reference path="../../scripts/dc.pp.disagg.js" />
/// <reference path="~/GeneratedArtifacts/viewModel.js" />
var chartWrapper;
myapp.PeopleReached.created = function (screen) {
    // Write code here.
    
    chartWrapper = new dcLSWrapper();
    chartWrapper.url = myapp.activeDataWorkspace.MeerkatData.vwPeopleReacheds._requestUri + "?$format=json&$filter=LocationTypeCode eq 'DIST'";
    if (screen.KeyType && screen.KeyType != "")
    {
        chartWrapper.url +=" and KeyType ='" + screen.KeyType + "'";
    }
    chartWrapper.mapUrl = chartWrapper.url.split("MeerkatData.svc")[0] + "HTMLClient/Maps/DIST.geojson";
};

myapp.PeopleReached.Map_render = function (element, contentItem) {
    div = $("<div class='mapPPDiv' id='mapPPDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.mapID = 'mapPPDiv';
};

myapp.PeopleReached.CommunityType_render = function (element, contentItem) {
    div = $("<div class='CTDiv' id='CTDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('CTDiv', 'CommunityType_Name', 120, 400);

};
myapp.PeopleReached.Bands_postRender = function (element, contentItem) {
    chartWrapper.setupPage();
};
myapp.PeopleReached.Group_render = function (element, contentItem) {
    // Write code here.
    div = $("<div class='GroupDiv' id='GroupDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GroupDiv', 'Group_Name', 400, 400);

};
myapp.PeopleReached.Gender_render = function (element, contentItem) {
    div = $("<div class='GenderDiv' id='GenderDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GenderDiv', 'Gender_Name', 160, 400);

};
myapp.PeopleReached.ReportPeriods_render = function (element, contentItem) {
    div = $("<div class='ReportPeriodDiv' id='ReportPeriodDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addBarChart('ReportPeriodDiv', 'ReportPeriod',200, 1024);

};