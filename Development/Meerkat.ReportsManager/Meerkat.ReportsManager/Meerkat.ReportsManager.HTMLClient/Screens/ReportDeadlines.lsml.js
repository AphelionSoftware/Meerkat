/// <reference path="~/GeneratedArtifacts/viewModel.js" />

 
myapp.ReportDeadlines.vwAllReportsByPeoples_render = function (element, contentItem) {
    

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
myapp.ReportDeadlines.vwReportsByPerson_render = function (element, contentItem) {
    div = $("<div class='calendarDivAllPerson' id='calendarDivAllPerson' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwAllReportsByPeoples._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivAllPerson", url);

};

myapp.ReportDeadlines.vwReportsByProject_render = function (element, contentItem) {
    div = $("<div class='calendarDivAllProject' id='calendarDivAllProject' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwAllReportsByProjects._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivAllProject", url);

};
myapp.ReportDeadlines.vwReportsByProgramme_render = function (element, contentItem) {
    div = $("<div class='calendarDivAllProgramme' id='calendarDivAllProgramme' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwAllReportsByProgrammes._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivAllProgramme", url);

};
myapp.ReportDeadlines.vwReportsByDonor_render = function (element, contentItem) {
    div = $("<div class='calendarDivAllDonor' id='calendarDivAllDonor' ></div>");
    $(div).appendTo($(element));

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwAllReportsByDonors._requestUri + "?$format=json";
    calendarbyUrl(".calendarDivAllDonor", url);

};