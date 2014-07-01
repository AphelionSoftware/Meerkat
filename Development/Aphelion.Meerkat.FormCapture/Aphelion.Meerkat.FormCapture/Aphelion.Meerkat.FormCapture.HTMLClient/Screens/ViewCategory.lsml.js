/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.ViewCategory.RowTemplate_postRender = function (element, contentItem) {
    // Write code here.
    
    //Setting isConfidential
    contentItem.data.isConfidential = contentItem.screen.isConfidential;
    contentItem.data.FormResponse_FNVID = contentItem.screen.FNV1a;
    //Question type
    var type = contentItem.data.QuestionType.Code;
    var x = element;

    contentItem.children[2].isVisible = false;
    contentItem.children[3].isVisible = false;
    contentItem.children[4].isVisible = false;
    contentItem.children[5].isVisible = false;
    contentItem.children[6].isVisible = false;
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
        case "MCQ" :
            {
                contentItem.children[6].isVisible = true;
                break;
            }
        
       
        default:
            {
                alert ("Unknown question type: " + type);
            }
    }

    
    };
myapp.ViewCategory.QuestionType_postRender = function (element, contentItem) {
    // Write code here.
    var type = contentItem.data.QuestionType.Code;
    var x = element;
    switch (type) {
        case "TR":
            {

                break;
            }
    }
    /*
    //Capture example
    contentItem.dataBind("value", function (newValue) {

        var indicatorGroup = contentItem.screen.findContentItem("SubIndicators");
        $.each(indicatorGroup.children, function (index, child) {
            child.isVisible = false;
        });

        if (newValue === undefined) {
            return;
        }

        var target = undefined;
        switch (newValue.Code) {
            case "Outcome":
                {
                    target = contentItem.screen.findContentItem("OutcomeGroup");
                    break;
                }
            case "Output":
                {
                    target = contentItem.screen.findContentItem("OutputGroup");
                    break;
                }
            case "SubOutput":
                {
                    target = contentItem.screen.findContentItem("SubOutpuGroupt");
                    break;
                }
            default:
                {
                    console.log(newValue.Code);
                    break;
                }

        }

        if (target !== undefined) {
            target.isVisible = true;
        }
    });
    */
};