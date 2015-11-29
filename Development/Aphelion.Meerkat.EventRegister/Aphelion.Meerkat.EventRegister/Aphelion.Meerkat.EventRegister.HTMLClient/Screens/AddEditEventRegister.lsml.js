/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AddEditEventRegister.created = function (screen) {
    // Write code here.
    msls.application.lightswitchTools.configureCaptureForm(screen);
    var _MS_PER_DAY = 1000 * 60 * 60 * 24;

    // a and b are javascript Date objects
    function dateDiffInDays(a, b) {
        // Discard the time and time-zone information.
        var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
        var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

        return Math.floor((utc2 - utc1) / _MS_PER_DAY);
    }
    
    // a and b are javascript Date objects
    function dateDiffInYears(a, b) {
        // Discard the time and time-zone information.
        var utc1 = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate());
        var utc2 = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());

        return Math.floor((utc2 - utc1) / _MS_PER_DAY / 365); //Hack. Fix.
    }
    var DOBField = screen.findContentItem("DateOfBirth");
    var AgeField = screen.findContentItem("Age");
    DOBField.dataBind("value", function () {
        if (DOBField.value !== undefined ) {
            var currentLength = 0;
            if (AgeField.stringValue !== undefined) {
                currentLength = AgeField.stringValue.length;
            }
            if (currentLength === 0) {

                var today = new Date();
                var dDiff = dateDiffInYears( DOBField.value, today);
                screen.details.dataWorkspace.MeerkatData.Ages.filter("Age_ID eq " + dDiff.toString()).execute().then(function (x) {
                    //  thisObject.setActiveType(x.results[0]);
                    AgeField.value = x.results[0];

                }, function (x) {
                    msls.showMessageBox(x, {
                        title: "Default value for ActiveType failed"
                    });
                });
                
            }
            
        }
    });
    ///TODO:


};

/**/