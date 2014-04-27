/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />


myapp.AddEditCategory.created = function (screen) {
    // Set Active Types
    msls.application.lightswitchTools.configureCaptureForm(screen);


    screen.details.dataWorkspace.MeerkatData.Forms.filter("Form_ID eq " + screen.FormID).execute().then(function (x) {
        //thisObject.setActiveType(x.results[0]);
        screen.Category.setForm(x.results[0]);
    }, function (x) {
        msls.showMessageBox(x, {
            title: "Setting Form ID failed"
        });
    });

    screen.details.dataWorkspace.MeerkatData.Categories.filter("Form_ID eq " + screen.FormID).orderByDescending("CategoryOrder")
    .execute().then(function (x) {
        screen.Category.CategoryOrder = Math.round( (x.results[0].CategoryOrder + 100) / 100) * 100; //Setting to next whole hundred
    }
    )
    
};