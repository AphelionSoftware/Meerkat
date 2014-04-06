/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.BrowseProjectsSorted.ShowBrowseForms_Tap_execute = function (screen) {
    // Write code here.
    myapp.showBrowseForms(screen.ProjectsSorted.selectedItem.ProjectID);
};
myapp.BrowseProjectsSorted.ShowBrowseEventsSorted_Tap_execute = function (screen) {
    // Write code here.
    myapp.showBrowseEventsSorted (screen.ProjectsSorted.selectedItem.ProjectID);

};