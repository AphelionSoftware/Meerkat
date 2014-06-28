/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.Home.VersionNumber_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};

function addStatusValue(screen, type) {

    if (type == "Outcome") {
        screen.getOutcomes().then(function (outcomes) {
            var data = {};

            if (outcomes.selectedItem !== undefined) {
                data.Outcome = outcomes.selectedItem;
            }
            else {
                data.DataType = "Outcome";
            }

            data.Type = type;

            myapp.showAddEditStatusValue(undefined, data, {});
        });
    } else if (type == "Programme") {
        screen.getProgrammeSorted().then(function (Programmes) {
            var data = {};

            if (Programmes.selectedItem !== undefined) {
                data.Programme = Programmes.selectedItem;
            }
            else {
                data.DataType = "Programme";
            }

            data.Type = type;

            myapp.showAddEditStatusValue(undefined, data, {});
        });
    }
}

myapp.Home.AddOutputStatusValue_execute = function (screen) {
    addStatusValue(screen, "Output");
};



myapp.Home.AddProjectStatusValue_execute = function (screen) {
    addStatusValue(screen, "Project");
};
myapp.Home.ShowOutcomeIndicators_Tap_canExecute = function (screen) {
    // Write code here.

};
myapp.Home.AddProgrammeStatus_execute = function (screen) {
    // Write code here.
    myapp.Home.AddProjectStatusValue_execute = function (screen) {
        addStatusValue(screen, "Programme");
    };
};
myapp.Home.AddOutcomeStatusValue_Tap_execute = function (screen) {
    // Write code here.
    addStatusValue(screen, "Outcome");
};
myapp.Home.AddProgrammeStatus_Tap_execute = function (screen) {
    // Write code here.
    addStatusValue(screen, "Programme");
};