/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.ViewCustomReports_CalendarSortedItem.Details_postRender = function (element, contentItem) {
    // Write code here.
    var name = contentItem.screen.CustomReport_Calendar.details.getModel()[':@SummaryProperty'].property.name;
    contentItem.dataBind("screen.CustomReport_Calendar." + name, function (value) {
        contentItem.screen.details.displayName = value;
    });
}

