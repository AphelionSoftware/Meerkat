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

    contentItem.children[1].children[2].isVisible = false;
    contentItem.children[1].children[3].isVisible = false;
    contentItem.children[1].children[4].isVisible = false;
    contentItem.children[1].children[5].isVisible = false;
    contentItem.children[1].children[6].isVisible = false;
    contentItem.children[1].children[7].isVisible = false;
    contentItem.children[1].children[8].isVisible = false;
    contentItem.children[1].children.isVisible = false;
    switch (type) {
        case "TR":
            {
                contentItem.children[1].children[2].isVisible = true;
                break;
            }
        case "INT":
            {
                contentItem.children[1].children[3].isVisible = true;
                var x = $(contentItem.children[3]);


                $(contentItem.children[1].children[3]).keypress(function () {
                    if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
                        this.value = this.value.replace(/[^0-9\.]/g, '');
                    }
                });
                break;
            }
        case "DEC":
            {
                contentItem.children[1].children[4].isVisible = true;
                break;
            }
        case "TF":
        case "BOOL":
            {
                contentItem.children[1].children[5].isVisible = true;
                break;
            }
        case "RB":
            {
                contentItem.children[1].children[6].isVisible = true;
                break;
            }
       
        case "DATE":
            {
                contentItem.children[1].children[7].isVisible = true;
                break;
            }
        case "MCQ":
            {
                //contentItem.children[2].isVisible = true;

                contentItem.children[1].children[8].isVisible = true;
                if (!contentItem.screen.mcqList) contentItem.screen.mcqList = [];
                contentItem.screen.mcqList.push({ id: 'select2-mcq' + element.uniqueID, tr: contentItem.children[1].children[2] });

                //myapp.activeDataWorkspace.MeerkatData.Questions_SingleOrDefault( 
                //contentItem.data.Question_ID).execute().then(function (result) {
                    //var question = result.results[0];
                myapp.activeDataWorkspace.MeerkatData.PotentialResponses.filter("Question_ID eq " + contentItem.data.Question_ID).execute().then(
                    function (items) {
                    //question.getPotentialResponses().then(function (items, idx) {

                        //var data = [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];
                        var data = [];
                        $.each(items.results, function (idx, item) {
                            data.push({ id: item.PotentialResponse_ID, text: item.Name });
                        });
                        //var data = item.results;
                        //element.innerHTML = "";
                        //Create a template
                        var itemTemplate = $('<select class="select2-mcq" id="select2-mcq' + element.uniqueID + '"  style="width:100%">\
             </select>');
                         itemTemplate.appendTo($(element));
                         $('#select2-mcq' + element.uniqueID).select2({ data: data, multiple: true });

                      
                        //$('#select2-mcq' + "ms__id" + (element.uniqueID.replace("ms__id", "") - 1)).select2({ data: data, multiple: true });

                    }
                    ) ;
                break;
            }
        case "CNT":
            {
                break;
                //Do nothing as we simply count
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
myapp.ViewCategory.MultipleChoice_render = function (element, contentItem) {
    var sel = '<select class="select2-mcq" id="select2-mcq' + element.uniqueID  +'"  style="width:100%;opacity:0">\
  </select>\
 ';
   // $(element).html(sel);

 //var data = [{ id: 0, text: 'enhancement' }, { id: 1, text: 'bug' }, { id: 2, text: 'duplicate' }, { id: 3, text: 'invalid' }, { id: 4, text: 'wontfix' }];
 //
 //$(element).html(sel);
 //
 //$('#select2-mcq').select2({ data: data, multiple: 'multiple' });
 
};
 
myapp.ViewCategory.beforeApplyChanges = function (screen) {
    if (screen.mcqList) {

        //screen.mcqList[0].tr.value = "Test change";
        var idList = ""
        $.each(screen.mcqList, function (idx, item) {
            idList = "";
            //"Test item";
            $.each(
                $('#' + item.id).val()
                , function (sel2idx, sel2item) {
                    idList += "," + sel2item;
                }
                )
            item.tr.value = idList.substring(1, idList.length);

        });
    }

};
myapp.ViewCategory.Extract_execute = function (screen) {
    if (screen.mcqList) {

        //screen.mcqList[0].tr.value = "Test change";
        var idList = ""
        $.each(screen.mcqList, function (idx, item) {
            idList = "";
            //"Test item";
            $.each(
                $('#' + item.id).val()
                , function (sel2idx, sel2item) {
                    idList += "," + sel2item;
                }
                )
            item.tr.value = idList.substring(1, idList.length);
 
        });
    }
};
myapp.ViewCategory.IntegerResponse_postRender = function (element, contentItem) {
    contentItem.dataBind("stringValue", function (value) {
        if (value) {
            //$(element).text(value.toFixed(0));
            contentItem.value = parseInt(value);
            contentItem.stringValue = String(parseInt(value));
            $(element).val(parseInt(value));
        }
    });/*
    contentItem.dataBind("value", function (value) {
        if (value) {
            $(element).text(value.toFixed(0));
        }
    });*/

};
myapp.ViewCategory.DecimalResponse_postRender = function (element, contentItem) {
    contentItem.dataBind("stringValue", function (value) {
        if (value) {
            //$(element).text(value.toFixed(0));
            contentItem.value = parseFloat(contentItem.value);
            contentItem.stringValue = String(parseFloat(contentItem.value));
            $(element).val(parseFloat(contentItem.value));
        }
    });

};