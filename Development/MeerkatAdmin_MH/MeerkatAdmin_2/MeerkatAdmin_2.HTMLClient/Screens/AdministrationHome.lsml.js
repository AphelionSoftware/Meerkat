/// <reference path="../GeneratedArtifacts/viewModel.js" />
/// <reference path="LightSwitchTools.js" />

myapp.AdministrationHome.VersionLabel_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })
};

myapp.AdministrationHome.created = function (screen) {

    /*if ( msls.application.lightswitchTools.sClient == "") {
        myapp.activeDataWorkspace.MeerkatData.GlobalSettings.filter("Code eq 'Client'").execute().then(function (x) {
            msls.application.lightswitchTools.sClient = x.results[0].Value;
            if (x.results[0].Value == "CARE Somalia") {

                myapp.showCAREHomeScreen();
            }
        });
    } else if (msls.application.lightswitchTools.sClient == "CARE Somalia") {
        myapp.cancelChanges();
        myapp.showCAREHomeScreen();
    }
    */

    if (document.location.hostname.toLocaleLowerCase() === "localhost") {    
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
        screen.findContentItem("ShowBrowseIndicatorTypes").isVisible = true;
    }
};
myapp.AdministrationHome.VersionLabel1_render = function (element, contentItem) {
    msls.application.lightswitchTools.getVersionInfo(function (version) {
        var smallElement = document.createElement("small");
        smallElement.innerText = version;
        element.appendChild(smallElement);
    })

};
myapp.AdministrationHome.TreeContent_render = function (element, contentItem) {
    div = $("<div class='treeviewProgramDiv' id='treeviewProgramDiv' ></div>");
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
    msls.application.lightswitchTools.vis.treeviewbyUrl(".treeviewProgramDiv", url
        , fnodeCall

        );
    //Finish tree view
};
myapp.AdministrationHome.TreeContentOM_render = function (element, contentItem) {
    div = $("<div class='treeviewOutcomeDiv' id='treeviewOutcomeDiv' ></div>");
    $(div).appendTo($(element));


    var fnodeCall = function (item) {
        if (item.ReportLevel) {
            switch (item.ReportLevel) {
                case "Outcome":
                    myapp.activeDataWorkspace.MeerkatData.Outcomes_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditOutcome(
                                x.results[0]
                                );
                        }
                        );
                    break;
                case "Output":
                    myapp.activeDataWorkspace.MeerkatData.Outputs_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditOutput(
                                x.results[0]
                                );
                        }
                        );
                    break;
                case "SubOutput":
                    myapp.activeDataWorkspace.MeerkatData.SubOutputs_SingleOrDefault(item.ID).execute().then(
                        function (x) {
                            myapp.showAddEditSubOutput(
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

    var url = contentItem.application.activeDataWorkspace.MeerkatData.vwOOSIs._requestUri + "?$format=json";
    msls.application.lightswitchTools.vis.treeviewbyUrl(".treeviewOutcomeDiv", url
        , fnodeCall

        );
    //Finish tree view

};