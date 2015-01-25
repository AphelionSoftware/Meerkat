/// <reference path="~/GeneratedArtifacts/viewModel.js" />
/// <reference path="~/Scripts/d3/d3.js" />
/// <reference path="~/Scripts/d3/d3.Treeview.Indicators.js" />

myapp.ProgramProjectIndicatorTree.TreeContent_render = function (element, contentItem) {
    div = $("<div class='treeviewDiv' id='treeviewDiv' ></div>");
    $(div).appendTo($(element));


    var fnodeCall = function (item) {
        if (item.ReportLevel) {
            switch (item.ReportLevel) {
                case "Program":
                    myapp.activeDataWorkspace.MeerkatData.Programmes_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditProgramme(
                                x.results[0]
                                );
                        }
                        );
                    break;
                case "Project":
                    myapp.activeDataWorkspace.MeerkatData.Projects_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditProject(
                                x.results[0]
                                );
                        }
                        );
                    break;
                case "Indicator":
                    myapp.activeDataWorkspace.MeerkatData.Indicators_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditIndicator(
                                x.results[0]
                                );
                        }
                        );
                    break;

            }
        }
    };

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwPPIPCs._requestUri + "?$format=json";
    msls.application.lightswitchTools.vis.treeviewbyUrl(".treeviewDiv", url
        , fnodeCall
    
        );
    //Finish tree view
};