/// <reference path="../../scripts/dc.pp.disagg.js" />
/// <reference path="~/GeneratedArtifacts/viewModel.js" />
var chartWrapper;
myapp.Rpt_PeopleReached.created = function (screen) {
    // Write code here.
    
    chartWrapper = new dcLSWrapper();
    
    if (!screen.strLocationType || screen.strLocationType == "") {
        screen.strLocationType = "DIST";
    }
    if (screen.KeyType && screen.KeyType != ""){
        chartWrapper.url = myapp.activeDataWorkspace.MeerkatData.vwPeopleReacheds._requestUri + "?$format=json&$filter=LocationTypeCode eq '" + screen.strLocationType + "'" + " and KeyType eq '" + screen.KeyType + "'";
    } else {
        chartWrapper.url = myapp.activeDataWorkspace.MeerkatData.vwPeopleReacheds._requestUri + "?$format=json&$filter=LocationTypeCode eq '" + screen.strLocationType + "'";
    }
    chartWrapper.mapUrl = chartWrapper.url.split("MeerkatData.svc")[0] + "HTMLClient/Maps/" + screen.strLocationType + ".geojson";
    chartWrapper.rollupField = "NumberReached";
};

myapp.Rpt_PeopleReached.Map_render = function (element, contentItem) {
    div = $("<div class='mapPPDiv' id='mapPPDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.mapID = 'mapPPDiv';
};

myapp.Rpt_PeopleReached.CommunityType_render = function (element, contentItem) {
    div = $("<div class='CTDiv' id='CTDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('CTDiv', 'CommunityType_Name', 120, 400);

};
myapp.Rpt_PeopleReached.Bands_postRender = function (element, contentItem) {
    chartWrapper.setupPage();
};
myapp.Rpt_PeopleReached.Group_render = function (element, contentItem) {
    // Write code here.
    div = $("<div class='GroupDiv' id='GroupDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GroupDiv', 'Group_Name', 400, 400);

};
myapp.Rpt_PeopleReached.Gender_render = function (element, contentItem) {
    div = $("<div class='GenderDiv' id='GenderDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GenderDiv', 'Gender_Name', 160, 400);

};
myapp.Rpt_PeopleReached.ReportPeriods_render = function (element, contentItem) {
    div = $("<div class='ReportPeriodDiv' id='ReportPeriodDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addBarChart('ReportPeriodDiv', 'ReportPeriod',200, 1024);

};
myapp.Rpt_PeopleReached.CARE_render = function (element, contentItem) {
    div = $("<div class='ShortNameDiv' id='ShortNameDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('ShortNameDiv', 'ShortName', 600, 400);
};
myapp.Rpt_PeopleReached.LoadingStatus_render = function (element, contentItem) {
    div = $("<div class='LoadingStatus' id='LoadingStatus' style='font-size:20px'></div>");
    $(div).appendTo($(element));
    chartWrapper.statusDiv = div;
};
myapp.Rpt_PeopleReached.AgeBand_render = function (element, contentItem) {
    div = $("<div class='AgeBandDiv' id='AgeBandDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('AgeBandDiv', 'AgeBand_Name', 160, 400);

};
myapp.Rpt_PeopleReached.Donor_render = function (element, contentItem) {
    div = $("<div class='DonorDiv' id='DonorDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('DonorDiv', 'Donor_Name', 160, 400);

};
myapp.Rpt_PeopleReached.ParticipantType_render = function (element, contentItem) {
    div = $("<div class='ParticipantDiv' id='ParticipantDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('ParticipantDiv', 'ParticipationTypeName', 160, 400);
};