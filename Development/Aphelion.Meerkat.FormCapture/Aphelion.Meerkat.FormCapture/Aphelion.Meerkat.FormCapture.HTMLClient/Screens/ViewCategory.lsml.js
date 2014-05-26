﻿/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.ViewCategory.RowTemplate_postRender = function (element, contentItem) {
    // Write code here.
    
    var type = contentItem.data.QuestionType.Code;
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
        case "TF", "BOOL":
            {
                contentItem.children[3].isVisible = true;
                break;
            }
        case "MCQ", "RB":
            {
                contentItem.children[4].isVisible = true;
                break;
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