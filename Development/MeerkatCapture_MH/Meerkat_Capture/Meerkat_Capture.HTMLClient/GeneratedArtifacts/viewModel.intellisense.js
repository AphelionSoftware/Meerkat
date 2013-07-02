/// <reference path="viewModel.js" />

(function (lightSwitchApplication) {

    var $parameters = [document.createElement("div"), msls.ContentItem];

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
        /// Called to determine if the ShowOutcomeIndicators_Tap method can be executed.
        /// <br/>canExecute(msls.application.BrowseOutcomes screen)
        /// </field>
        ShowOutcomeIndicators_Tap_canExecute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called to execute the ShowOutcomeIndicators_Tap method.
        /// <br/>execute(msls.application.BrowseOutcomes screen)
        /// </field>
        ShowOutcomeIndicators_Tap_execute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called to determine if the ShowBrowseOutputs_Tap method can be executed.
        /// <br/>canExecute(msls.application.BrowseOutcomes screen)
        /// </field>
        ShowBrowseOutputs_Tap_canExecute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called to execute the ShowBrowseOutputs_Tap method.
        /// <br/>execute(msls.application.BrowseOutcomes screen)
        /// </field>
        ShowBrowseOutputs_Tap_execute: [lightSwitchApplication.BrowseOutcomes],
        /// <field>
        /// Called after the OutcomeList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        OutcomeList_postRender: $parameters,
        /// <field>
        /// Called after the Outcome content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Outcome_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the Output content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Output_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the SubOutput content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        SubOutput_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the Indicator content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Indicator_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the Project content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Project_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the Activity content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Activity_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
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
        /// Called after the Milestone content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Milestone_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseMilestoneValues, {
        /// <field>
        /// Called when a new BrowseMilestoneValues screen is created.
        /// <br/>created(msls.application.BrowseMilestoneValues screen)
        /// </field>
        created: [lightSwitchApplication.BrowseMilestoneValues],
        /// <field>
        /// Called before changes on an active BrowseMilestoneValues screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseMilestoneValues screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseMilestoneValues],
        /// <field>
        /// Called after the MilestoneValueList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneValueList_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneValue content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneValue_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.BrowseIndicatorValues, {
        /// <field>
        /// Called when a new BrowseIndicatorValues screen is created.
        /// <br/>created(msls.application.BrowseIndicatorValues screen)
        /// </field>
        created: [lightSwitchApplication.BrowseIndicatorValues],
        /// <field>
        /// Called before changes on an active BrowseIndicatorValues screen are applied.
        /// <br/>beforeApplyChanges(msls.application.BrowseIndicatorValues screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.BrowseIndicatorValues],
        /// <field>
        /// Called after the IndicatorValueList content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorValueList_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorValue content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorValue_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate_postRender: $parameters
    });

    msls._addEntryPoints(lightSwitchApplication.AddEditMilestoneValue, {
        /// <field>
        /// Called when a new AddEditMilestoneValue screen is created.
        /// <br/>created(msls.application.AddEditMilestoneValue screen)
        /// </field>
        created: [lightSwitchApplication.AddEditMilestoneValue],
        /// <field>
        /// Called before changes on an active AddEditMilestoneValue screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditMilestoneValue screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditMilestoneValue],
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
        /// Called after the MilestoneInfo content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneInfo_postRender: $parameters,
        /// <field>
        /// Called after the Milestone content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Milestone_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate3 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate3_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriod content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriod_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate4 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate4_postRender: $parameters,
        /// <field>
        /// Called after the Location content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Location_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate2_postRender: $parameters,
        /// <field>
        /// Called after the DataVersion content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersion_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the Organization content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Organization_postRender: $parameters,
        /// <field>
        /// Called after the Organization1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Organization1_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneActualValues content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneActualValues_postRender: $parameters,
        /// <field>
        /// Called after the ActualLabel content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualLabel_postRender: $parameters,
        /// <field>
        /// Called after the ActualValue content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualValue_postRender: $parameters,
        /// <field>
        /// Called after the ActualValueString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualValueString_postRender: $parameters,
        /// <field>
        /// Called after the ActualDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualDate_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneAdditionalInfo content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneAdditionalInfo_postRender: $parameters,
        /// <field>
        /// Called after the Notes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Notes_postRender: $parameters,
        /// <field>
        /// Called after the MilestoneStatusPercent content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        MilestoneStatusPercent_postRender: $parameters,
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

    msls._addEntryPoints(lightSwitchApplication.AddEditIndicatorValue, {
        /// <field>
        /// Called when a new AddEditIndicatorValue screen is created.
        /// <br/>created(msls.application.AddEditIndicatorValue screen)
        /// </field>
        created: [lightSwitchApplication.AddEditIndicatorValue],
        /// <field>
        /// Called before changes on an active AddEditIndicatorValue screen are applied.
        /// <br/>beforeApplyChanges(msls.application.AddEditIndicatorValue screen)
        /// </field>
        beforeApplyChanges: [lightSwitchApplication.AddEditIndicatorValue],
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
        /// Called after the IndicatorInfo content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorInfo_postRender: $parameters,
        /// <field>
        /// Called after the Indicator content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Indicator_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate2 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate2_postRender: $parameters,
        /// <field>
        /// Called after the ReportingPeriod content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReportingPeriod_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate5 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate5_postRender: $parameters,
        /// <field>
        /// Called after the Organization content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Organization_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate4 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate4_postRender: $parameters,
        /// <field>
        /// Called after the Location content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Location_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate3 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate3_postRender: $parameters,
        /// <field>
        /// Called after the DataVersion content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        DataVersion_postRender: $parameters,
        /// <field>
        /// Called after the RowTemplate1 content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        RowTemplate1_postRender: $parameters,
        /// <field>
        /// Called after the ReleaseDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ReleaseDate_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorActualValues content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorActualValues_postRender: $parameters,
        /// <field>
        /// Called after the ActualLabel content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualLabel_postRender: $parameters,
        /// <field>
        /// Called after the ActualValue content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualValue_postRender: $parameters,
        /// <field>
        /// Called after the ActualValueString content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualValueString_postRender: $parameters,
        /// <field>
        /// Called after the ActualDate content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ActualDate_postRender: $parameters,
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
        /// Called after the IndicatorAdditionalValues content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorAdditionalValues_postRender: $parameters,
        /// <field>
        /// Called after the BusinessKey content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        BusinessKey_postRender: $parameters,
        /// <field>
        /// Called after the IndicatorStatusPercent content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        IndicatorStatusPercent_postRender: $parameters,
        /// <field>
        /// Called after the Notes content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        Notes_postRender: $parameters,
        /// <field>
        /// Called after the ContributingVersions content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        ContributingVersions_postRender: $parameters,
        /// <field>
        /// Called after the PreviousValues content item has been rendered.
        /// <br/>postRender(HTMLElement element, msls.ContentItem contentItem)
        /// </field>
        PreviousValues_postRender: $parameters
    });

}(msls.application));
