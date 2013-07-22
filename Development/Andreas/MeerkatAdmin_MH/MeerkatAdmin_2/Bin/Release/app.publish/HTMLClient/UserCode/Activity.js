/// <reference path="../GeneratedArtifacts/viewModel.js" />

myapp.Activity.created = function (entity) {
    // Write code here.
    entity.sys_CreatedBy = "NA";
    entity.sys_CreatedOn = "1999/01/01";
    entity.sys_ModifiedBy = "NA";
    entity.sys_ModifiedOn = "1999/01/01";
    //entity.setActiveType (myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(0));
    //entity.Active = myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
    //entity.ActiveTypes = myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);

    myapp.activeDataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1).execute().then(function (ActiveTypesQuery) {
        entity.setActiveType = ActiveTypesQuery.results[0];
        entity.ActiveType = ActiveTypesQuery.results[0];
    });
};