/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ReportsByLevel.PeopleReached_Dist_execute = function (screen) {
    myapp.showRpt_PeopleReached("DIST");
};
myapp.ReportsByLevel.CNTRY_execute = function (screen) {
    myapp.showRpt_PeopleReached("CNTRY");

};
myapp.ReportsByLevel.REG_execute = function (screen) {
    myapp.showRpt_PeopleReached("REG");

};
myapp.ReportsByLevel.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};