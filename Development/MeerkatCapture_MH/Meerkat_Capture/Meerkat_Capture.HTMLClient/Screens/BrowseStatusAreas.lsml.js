/// <reference path="../GeneratedArtifacts/viewModel.js" />

function addStatusValueFromScreen(screen, type) {

    var data = {};
    data.DataType = type;
    if (type == "Outcome") {
        myapp.showAddEditStatusValue(undefined, data, screen.Outcomes.selectedItem.Outcome_ID);
    } else if (type == "Programme") {
        myapp.showAddEditStatusValue(undefined, data, screen.ProgrammeSorted.selectedItem.Programme_ID);
    } else if (type == "Project") {
        myapp.showAddEditStatusValue(undefined, data, screen.ProjectsSortedByPSSS.selectedItem.ProjectID);
    } else if (type == "Sector") {
        myapp.showAddEditStatusValue(undefined, data, screen.SectorsSorted.selectedItem.Sector_ID);
    } else if (type == "SubSector") {
        myapp.showAddEditStatusValue(undefined, data, screen.SubsectorSorted.selectedItem.Subsector_ID);
    } 
}
myapp.BrowseStatusAreas.AddProgrammeStatusValue_execute = function (screen) {
    // Write code here.
    addStatusValueFromScreen(screen, "Programme");
};
myapp.BrowseStatusAreas.AddSectorStatusValue_execute = function (screen) {
    addStatusValueFromScreen(screen, "Sector");

};
myapp.BrowseStatusAreas.AddSubsectorStatusValue_execute = function (screen) {
    addStatusValueFromScreen(screen, "SubSector");

};
myapp.BrowseStatusAreas.AddProjectStatusValue_execute = function (screen) {
    addStatusValueFromScreen(screen, "Project");

};