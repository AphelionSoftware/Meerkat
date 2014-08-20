/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ReportDeadlines.vwEachPersonsReports_render = function (element, contentItem) {
    div = $("<div class='calendarDiv' id='calendarDiv' ></div>");
    $(div).appendTo($(element));
    
    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwEachPersonsReports._requestUri + "?$format=json";
    calendarbyUrl(".calendarDiv", url);

};
myapp.ReportDeadlines.vwAllReportsByPeoples_render = function (element, contentItem) {
    div = $("<div class='calendarDivAll' id='calendarDivAll' ></div>");
    $(div).appendTo($(element));
    
    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwAllReportsByPeoples._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivAll", url);

};
myapp.ReportDeadlines.vwEachReports_render = function (element, contentItem) {
    div = $("<div class='calendarDivEach' id='calendarDivEach' ></div>");
    $(div).appendTo($(element));
    
    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwEachReports._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivEach", url);

};
myapp.ReportDeadlines.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};