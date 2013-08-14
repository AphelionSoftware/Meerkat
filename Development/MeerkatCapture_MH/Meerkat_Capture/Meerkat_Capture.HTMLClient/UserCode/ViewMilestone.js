/// <reference path="../GeneratedArtifacts/viewModel.js" />

function ShowEditMVScreen(mv, screen) {
    myapp.showAddEditMilestoneValue(mv, screen.Milestone.MilestoneID, {
        afterClose: function () {
            screen.details.properties.MilestoneValues.load();
        }
    });
}

myapp.ViewMilestone.AddMilestoneValue_execute = function (screen) {
    ShowEditMVScreen(null, screen);
};

myapp.ViewMilestone.EditMilestoneValue_execute = function (screen) {
    screen.getMilestoneValues().then(function (result) {
        ShowEditMVScreen(result.selectedItem, screen);        
    });
};