/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.AddEditFormResponse.RowTemplate1_postRender = function (element, contentItem) {
    // Write code here.

    var type = contentItem.data.Question.QuestionType.Code;
    var x = element;

    contentItem.children[2].isVisible = false;
    contentItem.children[3].isVisible = false;
    contentItem.children[4].isVisible = false;
    switch (type) {
        case "TR":
            {
                contentItem.children[2].isVisible = true;
                break;
            }
        case "TF":
        case "BOOL":
            {
                contentItem.children[3].isVisible = true;
                break;
            }
        case "RB":
        case "MCQ":
            {
                contentItem.children[4].isVisible = true;
                break;
            }


        default:
            {
                alert("Unknown question type: " + type);
            }
    }
};