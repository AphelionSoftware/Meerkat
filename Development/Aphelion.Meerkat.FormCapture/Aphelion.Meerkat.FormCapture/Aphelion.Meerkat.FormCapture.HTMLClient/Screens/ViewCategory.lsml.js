/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.ViewCategory.RowTemplate_postRender = function (element, contentItem) {
    // Write code here.
    
    //Setting isConfidential
    contentItem.data.isConfidential = contentItem.screen.isConfidential;
    contentItem.data.FormResponse_FNVID = contentItem.screen.FNV1a;
    contentItem.data.isComplete = contentItem.screen.isComplete;

    myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(contentItem.screen.ProjectID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setProject(res);
        }
    );
    myapp.activeDataWorkspace.MeerkatData.Locations_SingleOrDefault(contentItem.screen.Location_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setLocation(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.Ages_SingleOrDefault(contentItem.screen.Age_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setAge(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.AgeBands_SingleOrDefault(contentItem.screen.AgeBand_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setAgeBand(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.CommunityTypes_SingleOrDefault(contentItem.screen.CommunityType_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setCommunityType(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.Genders_SingleOrDefault(contentItem.screen.Gender_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setGender(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.Groups_SingleOrDefault(contentItem.screen.Group_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setGroup(res);
        }
    );

    myapp.activeDataWorkspace.MeerkatData.Institutions_SingleOrDefault(contentItem.screen.Institution_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setInstitution(res);
        }
    );
    myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(contentItem.screen.ReportingPeriod_ID).execute().then(
        function (x) {
            var res = x.results[0];
            contentItem.data.setReportingPeriod(res);
        }
    );
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
myapp.ViewCategory.Questions1_postRender = function (element, contentItem) {
    // Write code here.
    tableElement = $(element).find("table")[0];
    $(tableElement).off("keyup");

    /*tableElement = $(element).find("div");
    $(tableElement).off("keyup");*/

    tableHead = $(element).find("thead")[0];
    $(tableHead).hide();

};