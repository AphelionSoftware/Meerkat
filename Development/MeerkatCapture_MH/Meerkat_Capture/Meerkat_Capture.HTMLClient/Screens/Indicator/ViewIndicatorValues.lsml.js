/// <reference path="../GeneratedArtifacts/viewModel.js" />

/*function ShowEditIndicatorScreen(iv, screen) {
    myapp.showAddIndicatorValue(iv, screen.IndicatorsSorted.selectedItem, {
        afterClose: function () {
            screen.details.properties.IndicatorValues.load();
        }
    });
}

myapp.ViewIndicator.AddIndicatorValue_execute = function (screen) {
    ShowEditIndicatorScreen(undefined, screen);
};*/

myapp.ViewIndicatorValues.ShowHome_postRender = function (element, contentItem) {
    msls.application.lightswitchTools.homeIcon(element); 
};
myapp.ViewIndicatorValues.IndicatorValuesSortedTemplate_postRender = function (element, contentItem) {
    //d3.selectAll(".msls-text")
    d3.select(element).selectAll(".msls-text")
               .attr("contenteditable", "true")


};
myapp.ViewIndicatorValues.created = function (screen) {
    // Write code here.

};
myapp.ViewIndicatorValues.IndicatorValuesSorted_postRender = function (element, contentItem) {

    d3.selectAll(".msls-text")
            .attr("contenteditable", "true")

};
myapp.ViewIndicatorValues.Group_postRender = function (element, contentItem) {
   
};