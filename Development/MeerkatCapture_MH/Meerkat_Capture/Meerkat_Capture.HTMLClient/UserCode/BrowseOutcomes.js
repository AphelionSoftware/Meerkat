/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.BrowseOutcomes.showOutcomeIndicators_execute = function (screen) {
    // Write code here.
    screen.getOutcomesSorted().then(function (_) {
        if (_.selectedItem === null) {
            alert("You must select an outcome first.");
            return;
        }

        myapp.showBrowseIndicators(_.selectedItem.OutcomeID);
    });
};