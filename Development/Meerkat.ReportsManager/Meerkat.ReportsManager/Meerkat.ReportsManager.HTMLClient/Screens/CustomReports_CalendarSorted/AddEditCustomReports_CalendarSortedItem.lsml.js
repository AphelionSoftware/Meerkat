/// <reference path="~/GeneratedArtifacts/viewModel.js" />
/// <reference path="../Scripts/LightSwitchTools.js" />

myapp.AddEditCustomReports_CalendarSortedItem.created = function (screen) {
    msls.application.lightswitchTools.configureForm(screen);
    Date.prototype.addDays = function (days) {
        var dat = new Date(this.valueOf());
        dat.setDate(dat.getDate() + days);
        return dat;
    }
    var rptDue = screen.findContentItem("ReportDueDate");
    rptDue.dataBind("value", function () {
        
        if (rptDue.value) {
            var rptDate = new Date(rptDue.value.getFullYear(), rptDue.value.getMonth(), rptDue.value.getDate());
            if (screen.CustomReportsSorted.selectedItem) {
                var rptDeadline = screen.findContentItem("ReportDeadlineStartDate");
                var rptWarning = screen.findContentItem("ReportWarningStartDate");
                var rptNotice = screen.findContentItem("ReportNoticeStartDate");


                if (rptDeadline != undefined) {
                    var currentLength = 0;
                    if (rptDeadline.value !== undefined) {
                        currentLength = rptDeadline.stringValue.length;
                    }
                    if (currentLength === 0) {
                        myapp.activeDataWorkspace.MeerkatData.CustomReports_SingleOrDefault(screen.CustomReportsSorted.selectedItem.CustomReport_ID).execute().then(
                            function (report) {
                                try {
                                    report.results[0].getCustomReportType().then(
                                        function (type) {
                                            //screen.CustomReport_Calendar.setReportDeadlineStartDate(new Date(rptDate - type.DeadlineDays));
                                            screen.CustomReport_Calendar.setReportDeadlineStartDate(rptDate.addDays( type.DeadlineDays * -1));
                                        }
                                        );

                                    
                                }
                                catch (exception) {
                                    var y = 1;
                                }
                            });


                    }
                }
                if (rptWarning != undefined) {
                    var currentLength = 0;
                    if (rptWarning.value !== undefined) {
                        currentLength = rptWarning.stringValue.length;
                    }
                    if (currentLength === 0) {

                        myapp.activeDataWorkspace.MeerkatData.CustomReports_SingleOrDefault(screen.CustomReportsSorted.selectedItem.CustomReport_ID).execute().then(
                            function (report) {
                                report.results[0].getCustomReportType().then(
                                                                        function (type) {
                                                                            screen.CustomReport_Calendar.setReportWarningStartDate(rptDate.addDays((type.DeadlineDays + type.WarningDays) * -1));
                                                                        }
                                                                        );

                            });

                    }
                }
                if (rptNotice != undefined) {
                    var currentLength = 0;
                    if (rptNotice.value !== undefined) {
                        currentLength = rptNotice.stringValue.length;
                    }
                    if (currentLength === 0) {

                        myapp.activeDataWorkspace.MeerkatData.CustomReports_SingleOrDefault(screen.CustomReportsSorted.selectedItem.CustomReport_ID).execute().then(
                                                function (report) {
                                                    report.results[0].getCustomReportType().then(
                                                                                            function (type) {
                                                                                                screen.CustomReport_Calendar.setReportNoticeStartDate(rptDate.addDays((type.DeadlineDays + type.WarningDays + type.NoticeDays ) * -1));
                                                                                            }
                                                                                            );

                                                });

                    }
                }
            }
        }
    });
};