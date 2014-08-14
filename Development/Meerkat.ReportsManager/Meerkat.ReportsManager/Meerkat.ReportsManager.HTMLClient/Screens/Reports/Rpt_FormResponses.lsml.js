/// <reference path="../../scripts/dc.pp.disagg.js" />
/// <reference path="~/GeneratedArtifacts/viewModel.js" />
var chartWrapper;

myapp.Rpt_FormResponses.created = function (screen) {
    chartWrapper = new dcLSWrapper();

    if (screen.KeyType && screen.KeyType != "") {
        chartWrapper.url = myapp.activeDataWorkspace.MeerkatData.vwFormResponsesCounts._requestUri + "?$format=json&$filter=LocationTypeCode eq 'DIST'" + " and KeyType eq '" + screen.KeyType + "'";
    } else {
        chartWrapper.url = myapp.activeDataWorkspace.MeerkatData.vwFormResponsesCounts._requestUri + "?$format=json&$filter=LocationTypeCode eq 'DIST'";
    }
    chartWrapper.mapUrl = chartWrapper.url.split("MeerkatData.svc")[0] + "HTMLClient/Maps/DIST.geojson";
    chartWrapper.rollupField = "ResponseCount";
};
myapp.Rpt_FormResponses.Map_render = function (element, contentItem) {
    div = $("<div class='mapPPDiv' id='mapPPDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.mapID = 'mapPPDiv';
};
myapp.Rpt_FormResponses.ShortName_render = function (element, contentItem) {
    div = $("<div class='ShortNameDiv' id='ShortNameDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('ShortNameDiv', 'ShortName', 120, 400);
};

myapp.Rpt_FormResponses.FormName_render = function (element, contentItem) {
    div = $("<div class='FormNameDiv' id='FormNameDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('FormNameDiv', 'FormName', 120, 400);
};
myapp.Rpt_FormResponses.ReportPeriod_render = function (element, contentItem) {
    div = $("<div class='ReportPeriodDiv' id='ReportPeriodDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addBarChart('ReportPeriodDiv', 'ReportPeriod', 200, 400);
};
myapp.Rpt_FormResponses.AgeBand_render = function (element, contentItem) {
    div = $("<div class='AgeBandDiv' id='AgeBandDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('AgeBandDiv', 'AgeBandName', 200, 400);

};
myapp.Rpt_FormResponses.CommunityType_render = function (element, contentItem) {
    div = $("<div class='CommunityTypeDiv' id='CommunityTypeDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('CommunityTypeDiv', 'CommunityTypeName', 200, 400);

};
myapp.Rpt_FormResponses.Gender_render = function (element, contentItem) {
    div = $("<div class='GenderDiv' id='GenderDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GenderDiv', 'GenderName', 200, 400);

};
myapp.Rpt_FormResponses.GroupName_render = function (element, contentItem) {
    div = $("<div class='GroupDiv' id='GroupDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('GroupDiv', 'GroupName', 200, 400);

};
myapp.Rpt_FormResponses.Institution_render = function (element, contentItem) {
    div = $("<div class='InstitutionDiv' id='InstitutionDiv' ></div>");
    $(div).appendTo($(element));
    chartWrapper.addRowChart('InstitutionDiv', 'InstitutionName', 200, 400);

};
myapp.Rpt_FormResponses.LoadingStatus_render = function (element, contentItem) {
    div = $("<div class='LoadingStatus' id='LoadingStatus' style='font-size:20px'></div>");
    $(div).appendTo($(element));
    chartWrapper.statusDiv = div;

};
myapp.Rpt_FormResponses.Dashboard_postRender = function (element, contentItem) {
    chartWrapper.setupPage();
};