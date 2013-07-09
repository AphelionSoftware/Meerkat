/// <reference path="viewModel.js" />

(function (lightSwitchApplication) {

    var $parameters = [document.createElement("div"), msls.ContentItem];

    msls._addEntryPoints(lightSwitchApplication.AdministrationHome, {
        /// <field>
        /// Called when a new AdministrationHome screen is created.
        /// <br/>created(msls.application.AdministrationHome screen)
        /// </field>
        created: [lightSwitchApplication.AdministrationHome],
        /// <field>
        /// Called before changes on an active AdministrationHome screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AdministrationHome screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AdministrationHome],
        /// <field>
        /// Called after the ManageOutcomes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ManageOutcomes_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseOutcomes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseOutcomes_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseOutputs content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseOutputs_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseSubOutputs content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseSubOutputs_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseIndicators content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseIndicators_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseProjects content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseProjects_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseActivities content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseActivities_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseMilestones content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseMilestones_postRender: $parameters,
        /// <field>
        /// Called after the Administration content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Administration_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseDataSources content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseDataSources_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseDataVersionLevels content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseDataVersionLevels_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseDataVersions content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseDataVersions_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseIndicatorTypes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseIndicatorTypes_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseMilestoneTypes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseMilestoneTypes_postRender: $parameters,
        /// <field>
        /// Called after the ShowBrowseReportingPeriods content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShowBrowseReportingPeriods_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseActivities, {
        /// <field>
        /// Called when a new BrowseActivities screen is created.
        /// <br/>created(msls.application.BrowseActivities screen)
        /// </field>
        created: [lightSwitchApplication.BrowseActivities],
        /// <field>
        /// Called before changes on an active BrowseActivities screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseActivities screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseActivities],
        /// <field>
        /// Called after the ActivityList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActivityList_postRender: $parameters,
        /// <field>
        /// Called after the ActivitiesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActivitiesSorted_postRender: $parameters,
        /// <field>
        /// Called after the ActivitiesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActivitiesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseSubOutputs, {
        /// <field>
        /// Called when a new BrowseSubOutputs screen is created.
        /// <br/>created(msls.application.BrowseSubOutputs screen)
        /// </field>
        created: [lightSwitchApplication.BrowseSubOutputs],
        /// <field>
        /// Called before changes on an active BrowseSubOutputs screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseSubOutputs screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseSubOutputs],
        /// <field>
        /// Called after the SubOutputList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputList_postRender: $parameters,
        /// <field>
        /// Called after the SubOutputsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputsSorted_postRender: $parameters,
        /// <field>
        /// Called after the SubOutputsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseReportingPeriods, {
        /// <field>
        /// Called when a new BrowseReportingPeriods screen is created.
        /// <br/>created(msls.application.BrowseReportingPeriods screen)
        /// </field>
        created: [lightSwitchApplication.BrowseReportingPeriods],
        /// <field>
        /// Called before changes on an active BrowseReportingPeriods screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseReportingPeriods screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseReportingPeriods],
        /// <field>
        /// Called after the ReportingPeriodList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriodList_postRender: $parameters,
        /// <field>
        /// Called after the YearName1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        YearName1_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriodsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriodsSorted_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriodsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriodsSortedTemplate_postRender: $parameters,
        /// <field>
        /// Called after the YearName2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        YearName2_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriod11 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriod11_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseProjects, {
        /// <field>
        /// Called when a new BrowseProjects screen is created.
        /// <br/>created(msls.application.BrowseProjects screen)
        /// </field>
        created: [lightSwitchApplication.BrowseProjects],
        /// <field>
        /// Called before changes on an active BrowseProjects screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseProjects screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseProjects],
        /// <field>
        /// Called after the ProjectList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ProjectList_postRender: $parameters,
        /// <field>
        /// Called after the ProjectsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ProjectsSorted_postRender: $parameters,
        /// <field>
        /// Called after the ProjectsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ProjectsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseOutputs, {
        /// <field>
        /// Called when a new BrowseOutputs screen is created.
        /// <br/>created(msls.application.BrowseOutputs screen)
        /// </field>
        created: [lightSwitchApplication.BrowseOutputs],
        /// <field>
        /// Called before changes on an active BrowseOutputs screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseOutputs screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseOutputs],
        /// <field>
        /// Called after the OutputList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutputList_postRender: $parameters,
        /// <field>
        /// Called after the OutputsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutputsSorted_postRender: $parameters,
        /// <field>
        /// Called after the OutputsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutputsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseOutcomes, {
        /// <field>
        /// Called when a new BrowseOutcomes screen is created.
        /// <br/>created(msls.application.BrowseOutcomes screen)
        /// </field>
        created: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called before changes on an active BrowseOutcomes screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseOutcomes screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called to determine if the BrowseRelatedOutputs method can be executed.
        /// <br/>canExecute(msls.application.BrowseOutcomes screen)
        /// </field>
        BrowseRelatedOutputs_canExecute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called to execute the BrowseRelatedOutputs method.
        /// <br/>execute(msls.application.BrowseOutcomes screen)
        /// </field>
        BrowseRelatedOutputs_execute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called after the OutcomeList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutcomeList_postRender: $parameters,
        /// <field>
        /// Called after the OutcomesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutcomesSorted_postRender: $parameters,
        /// <field>
        /// Called after the OutcomesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutcomesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseMilestones, {
        /// <field>
        /// Called when a new BrowseMilestones screen is created.
        /// <br/>created(msls.application.BrowseMilestones screen)
        /// </field>
        created: [lightSwitchApplication.BrowseMilestones],
        /// <field>
        /// Called before changes on an active BrowseMilestones screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseMilestones screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseMilestones],
        /// <field>
        /// Called after the MilestoneList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneList_postRender: $parameters,
        /// <field>
        /// Called after the MilestonesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestonesSorted_postRender: $parameters,
        /// <field>
        /// Called after the MilestonesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestonesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseMilestoneTypes, {
        /// <field>
        /// Called when a new BrowseMilestoneTypes screen is created.
        /// <br/>created(msls.application.BrowseMilestoneTypes screen)
        /// </field>
        created: [lightSwitchApplication.BrowseMilestoneTypes],
        /// <field>
        /// Called before changes on an active BrowseMilestoneTypes screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseMilestoneTypes screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseMilestoneTypes],
        /// <field>
        /// Called after the MilestoneTypeList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneTypeList_postRender: $parameters,
        /// <field>
        /// Called after the Name1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name1_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneTypesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneTypesSorted_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneTypesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneTypesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseIndicatorTypes, {
        /// <field>
        /// Called when a new BrowseIndicatorTypes screen is created.
        /// <br/>created(msls.application.BrowseIndicatorTypes screen)
        /// </field>
        created: [lightSwitchApplication.BrowseIndicatorTypes],
        /// <field>
        /// Called before changes on an active BrowseIndicatorTypes screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseIndicatorTypes screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseIndicatorTypes],
        /// <field>
        /// Called after the IndicatorTypeList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorTypeList_postRender: $parameters,
        /// <field>
        /// Called after the Name1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name1_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorTypesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorTypesSorted_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorTypesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorTypesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseIndicators, {
        /// <field>
        /// Called when a new BrowseIndicators screen is created.
        /// <br/>created(msls.application.BrowseIndicators screen)
        /// </field>
        created: [lightSwitchApplication.BrowseIndicators],
        /// <field>
        /// Called before changes on an active BrowseIndicators screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseIndicators screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseIndicators],
        /// <field>
        /// Called after the IndicatorList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorList_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorsSorted_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseDataVersions, {
        /// <field>
        /// Called when a new BrowseDataVersions screen is created.
        /// <br/>created(msls.application.BrowseDataVersions screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDataVersions],
        /// <field>
        /// Called before changes on an active BrowseDataVersions screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDataVersions screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDataVersions],
        /// <field>
        /// Called after the DataVersionList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionList_postRender: $parameters,
        /// <field>
        /// Called after the DataVersionsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionsSorted_postRender: $parameters,
        /// <field>
        /// Called after the DataVersionsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseDataVersionLevels, {
        /// <field>
        /// Called when a new BrowseDataVersionLevels screen is created.
        /// <br/>created(msls.application.BrowseDataVersionLevels screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDataVersionLevels],
        /// <field>
        /// Called before changes on an active BrowseDataVersionLevels screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDataVersionLevels screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDataVersionLevels],
        /// <field>
        /// Called after the DataVersionLevelList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionLevelList_postRender: $parameters,
        /// <field>
        /// Called after the DataVersionLevelsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionLevelsSorted_postRender: $parameters,
        /// <field>
        /// Called after the DataVersionLevelsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersionLevelsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseDataSources, {
        /// <field>
        /// Called when a new BrowseDataSources screen is created.
        /// <br/>created(msls.application.BrowseDataSources screen)
        /// </field>
        created: [lightSwitchApplication.BrowseDataSources],
        /// <field>
        /// Called before changes on an active BrowseDataSources screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseDataSources screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseDataSources],
        /// <field>
        /// Called after the DataSourceList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataSourceList_postRender: $parameters,
        /// <field>
        /// Called after the Name1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name1_postRender: $parameters,
        /// <field>
        /// Called after the DatasourcesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DatasourcesSorted_postRender: $parameters,
        /// <field>
        /// Called after the DatasourcesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DatasourcesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditActivity, {
        /// <field>
        /// Called when a new AddEditActivity screen is created.
        /// <br/>created(msls.application.AddEditActivity screen)
        /// </field>
        created: [lightSwitchApplication.AddEditActivity],
        /// <field>
        /// Called before changes on an active AddEditActivity screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditActivity screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditActivity],
        /// <field>
        /// Called to determine if the Activity_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditActivity screen)
        /// </field>
        Activity_Delete_canExecute: [lightSwitchApplication.AddEditActivity],
        /// <field>
        /// Called to execute the Activity_Delete method.
        /// <br/>execute(msls.application.AddEditActivity screen)
        /// </field>
        Activity_Delete_execute: [lightSwitchApplication.AddEditActivity],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Project content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Project_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the Milestones content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Milestones_postRender: $parameters,
        /// <field>
        /// Called after the MilestonesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestonesSorted_postRender: $parameters,
        /// <field>
        /// Called after the MilestonesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestonesSortedTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Code2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code2_postRender: $parameters,
        /// <field>
        /// Called after the ShortName2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName2_postRender: $parameters,
        /// <field>
        /// Called after the LongName3 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName3_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditIndicator, {
        /// <field>
        /// Called when a new AddEditIndicator screen is created.
        /// <br/>created(msls.application.AddEditIndicator screen)
        /// </field>
        created: [lightSwitchApplication.AddEditIndicator],
        /// <field>
        /// Called before changes on an active AddEditIndicator screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditIndicator screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditIndicator],
        /// <field>
        /// Called to determine if the Indicator_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditIndicator screen)
        /// </field>
        Indicator_Delete_canExecute: [lightSwitchApplication.AddEditIndicator],
        /// <field>
        /// Called to execute the Indicator_Delete method.
        /// <br/>execute(msls.application.AddEditIndicator screen)
        /// </field>
        Indicator_Delete_execute: [lightSwitchApplication.AddEditIndicator],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the InfoGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        InfoGroup_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the UnitOfMeasure content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        UnitOfMeasure_postRender: $parameters,
        /// <field>
        /// Called after the DetailsGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DetailsGroup_postRender: $parameters,
        /// <field>
        /// Called after the IsKeyIndicator content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IsKeyIndicator_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the SubOutput content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutput_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate4 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate4_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate5 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate5_postRender: $parameters,
        /// <field>
        /// Called after the Notes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Notes_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the BaselineGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineGroup_postRender: $parameters,
        /// <field>
        /// Called after the Baseline content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Baseline_postRender: $parameters,
        /// <field>
        /// Called after the BaselineString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineString_postRender: $parameters,
        /// <field>
        /// Called after the BaselineDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineDate_postRender: $parameters,
        /// <field>
        /// Called after the TargetGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetGroup_postRender: $parameters,
        /// <field>
        /// Called after the Target content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Target_postRender: $parameters,
        /// <field>
        /// Called after the TargetString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetString_postRender: $parameters,
        /// <field>
        /// Called after the TargetDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetDate_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorLocations content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorLocations_postRender: $parameters,
        /// <field>
        /// Called after the Area content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Area_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorLocationsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorLocationsSorted_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorLocationsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorLocationsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditMilestone, {
        /// <field>
        /// Called when a new AddEditMilestone screen is created.
        /// <br/>created(msls.application.AddEditMilestone screen)
        /// </field>
        created: [lightSwitchApplication.AddEditMilestone],
        /// <field>
        /// Called before changes on an active AddEditMilestone screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditMilestone screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditMilestone],
        /// <field>
        /// Called to determine if the Milestone_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditMilestone screen)
        /// </field>
        Milestone_Delete_canExecute: [lightSwitchApplication.AddEditMilestone],
        /// <field>
        /// Called to execute the Milestone_Delete method.
        /// <br/>execute(msls.application.AddEditMilestone screen)
        /// </field>
        Milestone_Delete_execute: [lightSwitchApplication.AddEditMilestone],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the InfoGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        InfoGroup_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the UnitOfMeasure content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        UnitOfMeasure_postRender: $parameters,
        /// <field>
        /// Called after the DetailsGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DetailsGroup_postRender: $parameters,
        /// <field>
        /// Called after the IsKeyIndicator content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IsKeyIndicator_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the Activity content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Activity_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate4 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate4_postRender: $parameters,
        /// <field>
        /// Called after the Notes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Notes_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the BaselineGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineGroup_postRender: $parameters,
        /// <field>
        /// Called after the Baseline content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Baseline_postRender: $parameters,
        /// <field>
        /// Called after the BaselineString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineString_postRender: $parameters,
        /// <field>
        /// Called after the BaselineDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BaselineDate_postRender: $parameters,
        /// <field>
        /// Called after the TargetGroup content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetGroup_postRender: $parameters,
        /// <field>
        /// Called after the Target content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Target_postRender: $parameters,
        /// <field>
        /// Called after the TargetString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetString_postRender: $parameters,
        /// <field>
        /// Called after the TargetDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TargetDate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditOutcome, {
        /// <field>
        /// Called when a new AddEditOutcome screen is created.
        /// <br/>created(msls.application.AddEditOutcome screen)
        /// </field>
        created: [lightSwitchApplication.AddEditOutcome],
        /// <field>
        /// Called before changes on an active AddEditOutcome screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditOutcome screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditOutcome],
        /// <field>
        /// Called to determine if the Outcome_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditOutcome screen)
        /// </field>
        Outcome_Delete_canExecute: [lightSwitchApplication.AddEditOutcome],
        /// <field>
        /// Called to execute the Outcome_Delete method.
        /// <br/>execute(msls.application.AddEditOutcome screen)
        /// </field>
        Outcome_Delete_execute: [lightSwitchApplication.AddEditOutcome],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the OutcomeSiteName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutcomeSiteName_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Outputs content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Outputs_postRender: $parameters,
        /// <field>
        /// Called after the ShortName3 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName3_postRender: $parameters,
        /// <field>
        /// Called after the OutputsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutputsSorted_postRender: $parameters,
        /// <field>
        /// Called after the OutputsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutputsSortedTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Projects content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Projects_postRender: $parameters,
        /// <field>
        /// Called after the ShortName1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName1_postRender: $parameters,
        /// <field>
        /// Called after the ProjectsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ProjectsSorted_postRender: $parameters,
        /// <field>
        /// Called after the ProjectsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ProjectsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditOutput, {
        /// <field>
        /// Called when a new AddEditOutput screen is created.
        /// <br/>created(msls.application.AddEditOutput screen)
        /// </field>
        created: [lightSwitchApplication.AddEditOutput],
        /// <field>
        /// Called before changes on an active AddEditOutput screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditOutput screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditOutput],
        /// <field>
        /// Called to determine if the Output_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditOutput screen)
        /// </field>
        Output_Delete_canExecute: [lightSwitchApplication.AddEditOutput],
        /// <field>
        /// Called to execute the Output_Delete method.
        /// <br/>execute(msls.application.AddEditOutput screen)
        /// </field>
        Output_Delete_execute: [lightSwitchApplication.AddEditOutput],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Outcome content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Outcome_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the SubOutputs content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputs_postRender: $parameters,
        /// <field>
        /// Called after the ShortName2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName2_postRender: $parameters,
        /// <field>
        /// Called after the SubOutputsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputsSorted_postRender: $parameters,
        /// <field>
        /// Called after the SubOutputsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutputsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditProject, {
        /// <field>
        /// Called when a new AddEditProject screen is created.
        /// <br/>created(msls.application.AddEditProject screen)
        /// </field>
        created: [lightSwitchApplication.AddEditProject],
        /// <field>
        /// Called before changes on an active AddEditProject screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditProject screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditProject],
        /// <field>
        /// Called to determine if the Project_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditProject screen)
        /// </field>
        Project_Delete_canExecute: [lightSwitchApplication.AddEditProject],
        /// <field>
        /// Called to execute the Project_Delete method.
        /// <br/>execute(msls.application.AddEditProject screen)
        /// </field>
        Project_Delete_execute: [lightSwitchApplication.AddEditProject],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Outcome content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Outcome_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate2_postRender: $parameters,
        /// <field>
        /// Called after the Activities content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Activities_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the ActivitiesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActivitiesSorted_postRender: $parameters,
        /// <field>
        /// Called after the ActivitiesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActivitiesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditSubOutput, {
        /// <field>
        /// Called when a new AddEditSubOutput screen is created.
        /// <br/>created(msls.application.AddEditSubOutput screen)
        /// </field>
        created: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called before changes on an active AddEditSubOutput screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditSubOutput screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called to determine if the Project_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditSubOutput screen)
        /// </field>
        Project_Delete_canExecute: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called to execute the Project_Delete method.
        /// <br/>execute(msls.application.AddEditSubOutput screen)
        /// </field>
        Project_Delete_execute: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called to determine if the SubOutput_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditSubOutput screen)
        /// </field>
        SubOutput_Delete_canExecute: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called to execute the SubOutput_Delete method.
        /// <br/>execute(msls.application.AddEditSubOutput screen)
        /// </field>
        SubOutput_Delete_execute: [lightSwitchApplication.AddEditSubOutput],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Output content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Output_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the ShortName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ShortName_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the LongName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LongName_postRender: $parameters,
        /// <field>
        /// Called after the TextDescription content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        TextDescription_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the Indicators content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Indicators_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorsSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorsSorted_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorsSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorsSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditIndicatorLocation, {
        /// <field>
        /// Called when a new AddEditIndicatorLocation screen is created.
        /// <br/>created(msls.application.AddEditIndicatorLocation screen)
        /// </field>
        created: [lightSwitchApplication.AddEditIndicatorLocation],
        /// <field>
        /// Called before changes on an active AddEditIndicatorLocation screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditIndicatorLocation screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditIndicatorLocation],
        /// <field>
        /// Called to determine if the IndicatorLocation_delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditIndicatorLocation screen)
        /// </field>
        IndicatorLocation_delete_canExecute: [lightSwitchApplication.AddEditIndicatorLocation],
        /// <field>
        /// Called to execute the IndicatorLocation_delete method.
        /// <br/>execute(msls.application.AddEditIndicatorLocation screen)
        /// </field>
        IndicatorLocation_delete_execute: [lightSwitchApplication.AddEditIndicatorLocation],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Sharepoint_ID content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Sharepoint_ID_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedOn_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedBy_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedOn_postRender: $parameters,
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedBy_postRender: $parameters,
        /// <field>
        /// Called after the Indicator content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Indicator_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters,
        /// <field>
        /// Called after the Location content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Location_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate2_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditDataSource, {
        /// <field>
        /// Called when a new AddEditDataSource screen is created.
        /// <br/>created(msls.application.AddEditDataSource screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called before changes on an active AddEditDataSource screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDataSource screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called to determine if the DataSource_Delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditDataSource screen)
        /// </field>
        DataSource_Delete_canExecute: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called to execute the DataSource_Delete method.
        /// <br/>execute(msls.application.AddEditDataSource screen)
        /// </field>
        DataSource_Delete_execute: [lightSwitchApplication.AddEditDataSource],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the ContactDetails content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ContactDetails_postRender: $parameters,
        /// <field>
        /// Called after the Custodian content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Custodian_postRender: $parameters,
        /// <field>
        /// Called after the Format content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Format_postRender: $parameters,
        /// <field>
        /// Called after the CollectionMethod content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        CollectionMethod_postRender: $parameters,
        /// <field>
        /// Called after the MetadataStatus content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MetadataStatus_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the ActiveTypesSorted content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveTypesSorted_postRender: $parameters,
        /// <field>
        /// Called after the ActiveTypesSortedTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveTypesSortedTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditDataVersionLevel, {
        /// <field>
        /// Called when a new AddEditDataVersionLevel screen is created.
        /// <br/>created(msls.application.AddEditDataVersionLevel screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDataVersionLevel],
        /// <field>
        /// Called before changes on an active AddEditDataVersionLevel screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDataVersionLevel screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDataVersionLevel],
        /// <field>
        /// Called to determine if the DataVersionLevel_delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditDataVersionLevel screen)
        /// </field>
        DataVersionLevel_delete_canExecute: [lightSwitchApplication.AddEditDataVersionLevel],
        /// <field>
        /// Called to execute the DataVersionLevel_delete method.
        /// <br/>execute(msls.application.AddEditDataVersionLevel screen)
        /// </field>
        DataVersionLevel_delete_execute: [lightSwitchApplication.AddEditDataVersionLevel],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the VersionLevelCode content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        VersionLevelCode_postRender: $parameters,
        /// <field>
        /// Called after the VersionOrder content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        VersionOrder_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditDataVersion, {
        /// <field>
        /// Called when a new AddEditDataVersion screen is created.
        /// <br/>created(msls.application.AddEditDataVersion screen)
        /// </field>
        created: [lightSwitchApplication.AddEditDataVersion],
        /// <field>
        /// Called before changes on an active AddEditDataVersion screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditDataVersion screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditDataVersion],
        /// <field>
        /// Called to determine if the DataVersion_delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditDataVersion screen)
        /// </field>
        DataVersion_delete_canExecute: [lightSwitchApplication.AddEditDataVersion],
        /// <field>
        /// Called to execute the DataVersion_delete method.
        /// <br/>execute(msls.application.AddEditDataVersion screen)
        /// </field>
        DataVersion_delete_execute: [lightSwitchApplication.AddEditDataVersion],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the Description content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Description_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditIndicatorType, {
        /// <field>
        /// Called when a new AddEditIndicatorType screen is created.
        /// <br/>created(msls.application.AddEditIndicatorType screen)
        /// </field>
        created: [lightSwitchApplication.AddEditIndicatorType],
        /// <field>
        /// Called before changes on an active AddEditIndicatorType screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditIndicatorType screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditIndicatorType],
        /// <field>
        /// Called to determine if the IndicatorType_delete method can be executed.
        /// <br/>canExecute(msls.application.AddEditIndicatorType screen)
        /// </field>
        IndicatorType_delete_canExecute: [lightSwitchApplication.AddEditIndicatorType],
        /// <field>
        /// Called to execute the IndicatorType_delete method.
        /// <br/>execute(msls.application.AddEditIndicatorType screen)
        /// </field>
        IndicatorType_delete_execute: [lightSwitchApplication.AddEditIndicatorType],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditMilestoneType, {
        /// <field>
        /// Called when a new AddEditMilestoneType screen is created.
        /// <br/>created(msls.application.AddEditMilestoneType screen)
        /// </field>
        created: [lightSwitchApplication.AddEditMilestoneType],
        /// <field>
        /// Called before changes on an active AddEditMilestoneType screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditMilestoneType screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditMilestoneType],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the Code content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Code_postRender: $parameters,
        /// <field>
        /// Called after the Name content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Name_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedOn_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedBy_postRender: $parameters,
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedOn_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedBy_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditReportingPeriod, {
        /// <field>
        /// Called when a new AddEditReportingPeriod screen is created.
        /// <br/>created(msls.application.AddEditReportingPeriod screen)
        /// </field>
        created: [lightSwitchApplication.AddEditReportingPeriod],
        /// <field>
        /// Called before changes on an active AddEditReportingPeriod screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditReportingPeriod screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditReportingPeriod],
        /// <field>
        /// Called after the Details content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Details_postRender: $parameters,
        /// <field>
        /// Called after the columns content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        columns_postRender: $parameters,
        /// <field>
        /// Called after the left content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        left_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriod1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriod1_postRender: $parameters,
        /// <field>
        /// Called after the StartDateID content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        StartDateID_postRender: $parameters,
        /// <field>
        /// Called after the EndDateID content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        EndDateID_postRender: $parameters,
        /// <field>
        /// Called after the FirstCycleDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        FirstCycleDate_postRender: $parameters,
        /// <field>
        /// Called after the LastCycleDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        LastCycleDate_postRender: $parameters,
        /// <field>
        /// Called after the YearName content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        YearName_postRender: $parameters,
        /// <field>
        /// Called after the right content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        right_postRender: $parameters,
        /// <field>
        /// Called after the YearNumber content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        YearNumber_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedOn_postRender: $parameters,
        /// <field>
        /// Called after the sys_CreatedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_CreatedBy_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedOn content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedOn_postRender: $parameters,
        /// <field>
        /// Called after the sys_ModifiedBy content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        sys_ModifiedBy_postRender: $parameters,
        /// <field>
        /// Called after the ActiveType content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActiveType_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

}(msls.application));
