/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditFormResponse.RowTemplate1_postRender = function (element, contentItem) {
    // Write code here.

   
};
myapp.AddEditFormResponse.Responses1Template_postRender = function (element, contentItem) {

    var x = element;

    
    contentItem.children[2].isVisible = false;//true;
    contentItem.children[3].isVisible = false;//true;
    contentItem.children[4].isVisible = false;//true;
    contentItem.children[5].isVisible = false;//true;
    contentItem.children[6].isVisible = false;//true;
    contentItem.children[7].isVisible = false;//true;

    contentItem.data.Question.getQuestionType().then(function(QT) {
        var type = QT.Code;
        switch (type) {
            case "TR":
                {
                    contentItem.children[2].isVisible = true;
                    break;
                }
            case "INT":
                {
                    contentItem.children[3].isVisible = true;
                    break;
                }
            case "DEC":
                {
                    contentItem.children[4].isVisible = true;
                    break;
                }

            case "TF":
            case "BOOL":
                {
                    contentItem.children[5].isVisible = true;
                    break;
                }
            case "RB":
            case "MCQ":
                {
                    contentItem.children[6].isVisible = true;
                    break;
                }
            case "DATE":
                {
                    contentItem.children[7].isVisible = true;
                    break;
                }
            case "CNT":
                {
                    break;
                }

            default:
                {
                    alert("Unknown question type: " + type);
                }
        }
    })
    
    
};
myapp.AddEditFormResponse.Response1_postRender = function (element, contentItem) {
    // Write code here.

};
myapp.AddEditFormResponse.Responses1_postRender = function (element, contentItem) {
    // Write code here.
    tableElement = $(element).find("table")[0];
    $(tableElement).off("keyup");

};
myapp.AddEditFormResponse.CompleteForm_execute = function (screen) {
    screen.FormResponse.isComplete = true;
    myapp.activeDataWorkspace.MeerkatData.saveChanges();
    myapp.applyChanges();

};
myapp.AddEditFormResponse.CategoriesByForm_ItemTap_execute = function (screen) {
    try {
        myapp.activeDataWorkspace.MeerkatData.saveChanges();
        myapp.applyChanges().then(
            function () {
                var location_ID = screen.FormResponse.Location ? screen.FormResponse.Location.Location_ID : null;
                var age_ID = screen.FormResponse.Age == null ? null : screen.FormResponse.Age.Age_ID;
                var ageBand_ID = screen.FormResponse.AgeBand == null ? null : screen.FormResponse.AgeBand.AgeBand_ID;
                var communityType_ID = screen.FormResponse.CommunityType == null ? null : screen.FormResponse.CommunityType.CommunityType_ID;
                var gender_ID = screen.FormResponse.Gender == null ? null : screen.FormResponse.Gender.Gender_ID;
                var groups_ID = screen.FormResponse.Groups == null ? null : screen.FormResponse.Groups.Group_ID;
                var institution_ID = screen.FormResponse.Institution == null ? null : screen.FormResponse.Institution.Institution_ID;
                var isConfidential = screen.FormResponse.isConfidential;
                //var isComplete = screen.Form.isComplete == null ? false : screen.Form.Form_isComplete;
                var project_id = screen.FormResponse.Project.ProjectID;

                if (!project_id) {
                    msls.showMessageBox("Project is required");
                    return;
                }

                var FNV1a = screen.FormResponse.FormResponse_FNVID;
                myapp.showViewCategory(
                    screen.CategoriesByForm.selectedItem
                    , isConfidential
                    , FNV1a
                    , location_ID
                    , age_ID
                    , ageBand_ID
                    , communityType_ID
                    , gender_ID
                    , groups_ID
                    , institution_ID
                    , project_id
                    //, isComplete

                    ,
                    {
                        afterClosed: function (addEditScreen, navigationAction) {
                            // If the user commits the change,
                            // Save
                            if (navigationAction === msls.NavigateBackAction.commit) {

                                myapp.activeDataWorkspace.MeerkatData.saveChanges();
                                screen.CompletedCategories++;
                                myapp.applyChanges().then(
                                    function () {
                                        screen.strCategoryToHide = screen.Categories.selectedItem.Name;
                                        if (screen.CompletedCategories == screen.Categories.count) {
                                            //ANd here we have finished the form, so back to home screen
                                            myapp.navigateHome();
                                        }

                                    })
                                ;

                            }
                        }
                    }


                    );

            }
            );

    }
    catch (ValidationException) {
        //this.ShowMessageBox("Please correct data entry errors and try to save again.");
        var x = 1;
    }

};
myapp.AddEditFormResponse.created = function (screen) {
    // Write code here.
    
};