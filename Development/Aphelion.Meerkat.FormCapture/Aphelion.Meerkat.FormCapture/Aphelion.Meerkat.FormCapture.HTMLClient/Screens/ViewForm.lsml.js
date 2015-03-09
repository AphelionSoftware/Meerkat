/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightswitchTools.js" />
//var CompletedCategories = 1;
// Fowler/Noll/Vo hashing.
function fnv_1a(v) {
    var n = v.length,
        a = 2166136261,
        c,
        d,
        i = -1;
    while (++i < n) {
        c = v.charCodeAt(i);
        if (d = c & 0xff000000) {
            a ^= d >> 24;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        if (d = c & 0xff0000) {
            a ^= d >> 16;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        if (d = c & 0xff00) {
            a ^= d >> 8;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        a ^= c & 0xff;
        a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
    }
    // From http://home.comcast.net/~bretm/hash/6.html
    a += a << 13;
    a ^= a >> 7;
    a += a << 3;
    a ^= a >> 17;
    a += a << 5;
    return a & 0xffffffff;
}

myapp.ViewForm.Categories1_ItemTap_execute = function (screen) {

    try {
        myapp.activeDataWorkspace.MeerkatData.saveChanges();
        myapp.applyChanges().then(
            function () {
                var location_ID = screen.LocationsSorted.selectedItem == null ? null : screen.LocationsSorted.selectedItem.Location_ID;
                var age_ID = screen.AgesSorted.selectedItem == null ? null : screen.AgesSorted.selectedItem.Age_ID;
                var ageBand_ID = screen.AgeBandsSorted.selectedItem == null ? null : screen.AgeBandsSorted.selectedItem.AgeBandID;
                var communityType_ID = screen.CommunityTypesSorted.selectedItem == null ? null : screen.CommunityTypesSorted.selectedItem.CommunityType_ID;
                var gender_ID = screen.Genders.selectedItem == null ? null : screen.Genders.selectedItem.GenderID;
                var groups_ID = screen.GroupsSorted.selectedItem == null ? null : screen.GroupsSorted.selectedItem.Group_ID;
                var institution_ID = screen.InstitutionsSorted.selectedItem == null ? null : screen.InstitutionsSorted.selectedItem.Institution_ID;
                var isConfidential = screen.Form.isConfidential == null ? false : screen.Form.isConfidential;
                //var isComplete = screen.Form.isComplete == null ? false : screen.Form.Form_isComplete;
                var project_id = screen.ProjectsSorted.selectedItem == null ? null : screen.ProjectsSorted.selectedItem.ProjectID;
                if (!project_id) {
                    msls.showMessageBox("Project is required");
                    return;
                }
                var reportingPeriod_ID = screen.ReportingPeriodsSorted.selectedItem == null ? null : screen.ReportingPeriodsSorted.selectedItem.ID;
                if (!reportingPeriod_ID) {
                    //reportingPeriod_ID = screen.iReportingPeriodID;
                    ///TODO: This is a hack
                }
                if (!reportingPeriod_ID) {
                    msls.showMessageBox("Reporting period is required");
                    return;
                }
                myapp.showViewCategory(
                    screen.Categories.selectedItem
                    , isConfidential
                    , screen.FNV1a
                    , location_ID
                    , age_ID
                    , ageBand_ID
                    , communityType_ID
                    , gender_ID
                    , groups_ID
                    , institution_ID
                    , project_id
                    , reportingPeriod_ID
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
                                    function(){
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
myapp.ViewForm.created = function (screen) {

    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            screen.ReportingPeriodsSorted.selectedItem = reportingPeriod.results[0];
            screen.Form.setReportingPeriod(reportingPeriod.results[0]);
            screen.iReportingPeriodID = reportingPeriod.results[0].ID;
            //TODO: This is a hack
        });
    });

    var guid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });

    screen.FNV1a = fnv_1a(guid);
    screen.CompletedCategories = 0;
    
};
myapp.ViewForm.RowTemplate_postRender = function (element, contentItem) {
    contentItem.dataBind("screen.strCategoryToHide", 
        function () {
            var x = $(element)[0];
            if (contentItem.screen.strCategoryToHide && x.innerText == contentItem.screen.strCategoryToHide)
            {
               
                $(element).css("background", "#808080");

            }
        })

};
myapp.ViewForm.Form_Age_postRender = function (element, contentItem) {
    if (!contentItem.screen.Form.ShowAge) {
        contentItem.isVisible = false;
    }
};
myapp.ViewForm.Form_AgeBand_postRender = function (element, contentItem) {
    if (!contentItem.screen.Form.ShowAgeBand) {
        contentItem.isVisible = false;
    }
};
myapp.ViewForm.Form_CommunityType_postRender = function (element, contentItem) {
    
    if (!contentItem.screen.Form.ShowCommunityType) {
        contentItem.isVisible = false;
    }
};
myapp.ViewForm.Form_Gender_postRender = function (element, contentItem) {
    if (!contentItem.screen.Form.ShowGender) {
        contentItem.isVisible = false;
    }
};
myapp.ViewForm.Form_Group_postRender = function (element, contentItem) {
    if (!contentItem.screen.Form.ShowGroup) {
        contentItem.isVisible = false;
    }

};
myapp.ViewForm.Form_Institution_postRender = function (element, contentItem) {
    if (!contentItem.screen.Form.ShowInstitution) {
        contentItem.isVisible = false;
    }
};
myapp.ViewForm.Categories1_postRender = function (element, contentItem) {


};
myapp.ViewForm.VersionLabel_render = function (element, contentItem) {
    // Write code here.
   msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};
myapp.ViewForm.Form_Project_postRender = function (element, contentItem) {
    // Write code here.

};
myapp.ViewForm.CompleteForm_execute = function (screen) {
    screen.Form.isComplete = true;
    screen.Form.FormResponse_FNVID = screen.FNV1a;
    myapp.activeDataWorkspace.MeerkatData.saveChanges();
    myapp.applyChanges();

};
myapp.ViewForm.Form_ReportingPeriod_postRender = function (element, contentItem) {
    $.getJSON("/api/TodaysReportingPeriod", function (data) {
        myapp.activeDataWorkspace.MeerkatData.ReportingPeriods_SingleOrDefault(data).execute().then(function (reportingPeriod) {
            screen.MaxReportingRangeID = reportingPeriod.results[0].EndDateID;
            contentItem.screen.ReportingPeriodsSorted.selectedItem = reportingPeriod.results[0];
        });
    });
};