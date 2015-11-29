/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="Scripts/LightSwitchTools.js" />

myapp.AddEditQuestion.created = function (screen) {
    // Write code here.
    var primaryKey = msls.application.lightswitchTools.configureCaptureForm(screen);

    //Default question type to Text response
    if (!primaryKey) {
        screen.details.dataWorkspace.MeerkatData.QuestionTypes.filter("Code eq 'TR'").execute().then(function (x) {
            screen.Question.setQuestionType(x.results[0]);
        }, function (x) {
            msls.showMessageBox(x, {
                title: "Default value for QuestionType failed"
            });
        });
    }

    screen.Question.isConfidential = false;
    //
    /*screen.details.dataWorkspace.MeerkatData.Questions.filter("Category_ID = " + screen.Question.Category.Category_ID).orderByDescending("QuestionOrder")
    .execute().then(function (x) {
        screen.Question.QuestionOrder = x.results[0] + 100;
    }
    )
    */



};
