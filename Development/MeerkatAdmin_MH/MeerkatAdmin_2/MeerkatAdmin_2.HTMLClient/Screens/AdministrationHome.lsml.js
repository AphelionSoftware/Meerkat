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