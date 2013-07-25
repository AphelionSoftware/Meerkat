/// <reference path="../Scripts/msls-1.0.0.js" />

window.myapp = msls.application;

(function (lightSwitchApplication) {

    var $Entity = msls.Entity,
        $DataService = msls.DataService,
        $DataWorkspace = msls.DataWorkspace,
        $defineEntity = msls._defineEntity,
        $defineDataService = msls._defineDataService,
        $defineDataWorkspace = msls._defineDataWorkspace,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString;

    function Activity(entitySet) {
        /// <summary>
        /// Represents the Activity entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this activity.
        /// </param>
        /// <field name="ActivityID" type="Number">
        /// Gets or sets the activityID for this activity.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this activity.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this activity.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this activity.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this activity.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this activity.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this activity.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this activity.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this activity.
        /// </field>
        /// <field name="Project" type="msls.application.Project">
        /// Gets or sets the project for this activity.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this activity.
        /// </field>
        /// <field name="Milestones" type="msls.EntityCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this activity.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this activity.
        /// </field>
        /// <field name="ActivityType_ID" type="Number">
        /// Gets or sets the activityType_ID for this activity.
        /// </field>
        /// <field name="SubOutput" type="msls.application.SubOutput">
        /// Gets or sets the subOutput for this activity.
        /// </field>
        /// <field name="details" type="msls.application.Activity.Details">
        /// Gets the details for this activity.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Indicator(entitySet) {
        /// <summary>
        /// Represents the Indicator entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this indicator.
        /// </param>
        /// <field name="IndicatorID" type="Number">
        /// Gets or sets the indicatorID for this indicator.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this indicator.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this indicator.
        /// </field>
        /// <field name="Baseline" type="Number">
        /// Gets or sets the baseline for this indicator.
        /// </field>
        /// <field name="BaselineString" type="String">
        /// Gets or sets the baselineString for this indicator.
        /// </field>
        /// <field name="BaselineDate" type="Date">
        /// Gets or sets the baselineDate for this indicator.
        /// </field>
        /// <field name="Target" type="Number">
        /// Gets or sets the target for this indicator.
        /// </field>
        /// <field name="TargetString" type="String">
        /// Gets or sets the targetString for this indicator.
        /// </field>
        /// <field name="TargetDate" type="Date">
        /// Gets or sets the targetDate for this indicator.
        /// </field>
        /// <field name="ReleaseDate" type="Date">
        /// Gets or sets the releaseDate for this indicator.
        /// </field>
        /// <field name="ReportingDate" type="Date">
        /// Gets or sets the reportingDate for this indicator.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this indicator.
        /// </field>
        /// <field name="Notes" type="String">
        /// Gets or sets the notes for this indicator.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this indicator.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this indicator.
        /// </field>
        /// <field name="BaselineDate_ID" type="Number">
        /// Gets or sets the baselineDate_ID for this indicator.
        /// </field>
        /// <field name="TargetDate_ID" type="Number">
        /// Gets or sets the targetDate_ID for this indicator.
        /// </field>
        /// <field name="updated" type="String">
        /// Gets or sets the updated for this indicator.
        /// </field>
        /// <field name="IsKeyIndicator" type="Boolean">
        /// Gets or sets the isKeyIndicator for this indicator.
        /// </field>
        /// <field name="UnitOfMeasure" type="String">
        /// Gets or sets the unitOfMeasure for this indicator.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this indicator.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this indicator.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this indicator.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this indicator.
        /// </field>
        /// <field name="Activity" type="msls.application.Activity">
        /// Gets or sets the activity for this indicator.
        /// </field>
        /// <field name="IndicatorType" type="msls.application.IndicatorType">
        /// Gets or sets the indicatorType for this indicator.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this indicator.
        /// </field>
        /// <field name="Output" type="msls.application.Output">
        /// Gets or sets the output for this indicator.
        /// </field>
        /// <field name="SubOutput" type="msls.application.SubOutput">
        /// Gets or sets the subOutput for this indicator.
        /// </field>
        /// <field name="IndicatorLocations" type="msls.EntityCollection" elementType="msls.application.IndicatorLocation">
        /// Gets the indicatorLocations for this indicator.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this indicator.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this indicator.
        /// </field>
        /// <field name="Sharepoint_ID" type="String">
        /// Gets or sets the sharepoint_ID for this indicator.
        /// </field>
        /// <field name="projectID" type="Number">
        /// Gets or sets the projectID for this indicator.
        /// </field>
        /// <field name="details" type="msls.application.Indicator.Details">
        /// Gets the details for this indicator.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function IndicatorLocation(entitySet) {
        /// <summary>
        /// Represents the IndicatorLocation entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this indicatorLocation.
        /// </param>
        /// <field name="IndicatorLocation_ID" type="Number">
        /// Gets or sets the indicatorLocation_ID for this indicatorLocation.
        /// </field>
        /// <field name="Sharepoint_ID" type="String">
        /// Gets or sets the sharepoint_ID for this indicatorLocation.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this indicatorLocation.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this indicatorLocation.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this indicatorLocation.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this indicatorLocation.
        /// </field>
        /// <field name="Indicator" type="msls.application.Indicator">
        /// Gets or sets the indicator for this indicatorLocation.
        /// </field>
        /// <field name="Location" type="msls.application.Location">
        /// Gets or sets the location for this indicatorLocation.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this indicatorLocation.
        /// </field>
        /// <field name="details" type="msls.application.IndicatorLocation.Details">
        /// Gets the details for this indicatorLocation.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function IndicatorType(entitySet) {
        /// <summary>
        /// Represents the IndicatorType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this indicatorType.
        /// </param>
        /// <field name="IndicatorType_ID" type="Number">
        /// Gets or sets the indicatorType_ID for this indicatorType.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this indicatorType.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this indicatorType.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this indicatorType.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this indicatorType.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this indicatorType.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this indicatorType.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this indicatorType.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this indicatorType.
        /// </field>
        /// <field name="details" type="msls.application.IndicatorType.Details">
        /// Gets the details for this indicatorType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Milestone(entitySet) {
        /// <summary>
        /// Represents the Milestone entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this milestone.
        /// </param>
        /// <field name="MilestoneID" type="Number">
        /// Gets or sets the milestoneID for this milestone.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this milestone.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this milestone.
        /// </field>
        /// <field name="Baseline" type="Number">
        /// Gets or sets the baseline for this milestone.
        /// </field>
        /// <field name="BaselineString" type="String">
        /// Gets or sets the baselineString for this milestone.
        /// </field>
        /// <field name="BaselineDate" type="Date">
        /// Gets or sets the baselineDate for this milestone.
        /// </field>
        /// <field name="Target" type="Number">
        /// Gets or sets the target for this milestone.
        /// </field>
        /// <field name="TargetString" type="String">
        /// Gets or sets the targetString for this milestone.
        /// </field>
        /// <field name="TargetDate" type="Date">
        /// Gets or sets the targetDate for this milestone.
        /// </field>
        /// <field name="ReleaseDate" type="Date">
        /// Gets or sets the releaseDate for this milestone.
        /// </field>
        /// <field name="ReportingDate" type="Date">
        /// Gets or sets the reportingDate for this milestone.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this milestone.
        /// </field>
        /// <field name="Notes" type="String">
        /// Gets or sets the notes for this milestone.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this milestone.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this milestone.
        /// </field>
        /// <field name="BaselineDateID" type="Number">
        /// Gets or sets the baselineDateID for this milestone.
        /// </field>
        /// <field name="TargetDateID" type="Number">
        /// Gets or sets the targetDateID for this milestone.
        /// </field>
        /// <field name="IsKeyIndicator" type="Boolean">
        /// Gets or sets the isKeyIndicator for this milestone.
        /// </field>
        /// <field name="UnitOfMeasure" type="String">
        /// Gets or sets the unitOfMeasure for this milestone.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this milestone.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this milestone.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this milestone.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this milestone.
        /// </field>
        /// <field name="Activity" type="msls.application.Activity">
        /// Gets or sets the activity for this milestone.
        /// </field>
        /// <field name="MilestoneType" type="msls.application.MilestoneType">
        /// Gets or sets the milestoneType for this milestone.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this milestone.
        /// </field>
        /// <field name="Project" type="msls.application.Project">
        /// Gets or sets the project for this milestone.
        /// </field>
        /// <field name="MilestoneLocations" type="msls.EntityCollection" elementType="msls.application.MilestoneLocation">
        /// Gets the milestoneLocations for this milestone.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this milestone.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this milestone.
        /// </field>
        /// <field name="details" type="msls.application.Milestone.Details">
        /// Gets the details for this milestone.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function MilestoneLocation(entitySet) {
        /// <summary>
        /// Represents the MilestoneLocation entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this milestoneLocation.
        /// </param>
        /// <field name="MilestoneLocation_ID" type="Number">
        /// Gets or sets the milestoneLocation_ID for this milestoneLocation.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this milestoneLocation.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this milestoneLocation.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this milestoneLocation.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this milestoneLocation.
        /// </field>
        /// <field name="Location" type="msls.application.Location">
        /// Gets or sets the location for this milestoneLocation.
        /// </field>
        /// <field name="Milestone" type="msls.application.Milestone">
        /// Gets or sets the milestone for this milestoneLocation.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this milestoneLocation.
        /// </field>
        /// <field name="details" type="msls.application.MilestoneLocation.Details">
        /// Gets the details for this milestoneLocation.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function MilestoneType(entitySet) {
        /// <summary>
        /// Represents the MilestoneType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this milestoneType.
        /// </param>
        /// <field name="MilestoneTypeID" type="Number">
        /// Gets or sets the milestoneTypeID for this milestoneType.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this milestoneType.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this milestoneType.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this milestoneType.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this milestoneType.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this milestoneType.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this milestoneType.
        /// </field>
        /// <field name="Milestones" type="msls.EntityCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this milestoneType.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this milestoneType.
        /// </field>
        /// <field name="details" type="msls.application.MilestoneType.Details">
        /// Gets the details for this milestoneType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Outcome(entitySet) {
        /// <summary>
        /// Represents the Outcome entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this outcome.
        /// </param>
        /// <field name="OutcomeID" type="Number">
        /// Gets or sets the outcomeID for this outcome.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this outcome.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this outcome.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this outcome.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this outcome.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this outcome.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this outcome.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this outcome.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this outcome.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this outcome.
        /// </field>
        /// <field name="DataVersions" type="msls.EntityCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersions for this outcome.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this outcome.
        /// </field>
        /// <field name="Milestones" type="msls.EntityCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this outcome.
        /// </field>
        /// <field name="OutcomeOrganizations" type="msls.EntityCollection" elementType="msls.application.OutcomeOrganization">
        /// Gets the outcomeOrganizations for this outcome.
        /// </field>
        /// <field name="OutcomePersonRoles" type="msls.EntityCollection" elementType="msls.application.OutcomePersonRole">
        /// Gets the outcomePersonRoles for this outcome.
        /// </field>
        /// <field name="Outputs" type="msls.EntityCollection" elementType="msls.application.Output">
        /// Gets the outputs for this outcome.
        /// </field>
        /// <field name="Projects" type="msls.EntityCollection" elementType="msls.application.Project">
        /// Gets the projects for this outcome.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this outcome.
        /// </field>
        /// <field name="OutcomeSiteName" type="String">
        /// Gets or sets the outcomeSiteName for this outcome.
        /// </field>
        /// <field name="details" type="msls.application.Outcome.Details">
        /// Gets the details for this outcome.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function OutcomeOrganization(entitySet) {
        /// <summary>
        /// Represents the OutcomeOrganization entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this outcomeOrganization.
        /// </param>
        /// <field name="OutcomeOrganization_ID" type="Number">
        /// Gets or sets the outcomeOrganization_ID for this outcomeOrganization.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this outcomeOrganization.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this outcomeOrganization.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this outcomeOrganization.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this outcomeOrganization.
        /// </field>
        /// <field name="Organization" type="msls.application.Organization">
        /// Gets or sets the organization for this outcomeOrganization.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this outcomeOrganization.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this outcomeOrganization.
        /// </field>
        /// <field name="details" type="msls.application.OutcomeOrganization.Details">
        /// Gets the details for this outcomeOrganization.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function OutcomePersonRole(entitySet) {
        /// <summary>
        /// Represents the OutcomePersonRole entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this outcomePersonRole.
        /// </param>
        /// <field name="OutcomePersonRole_ID" type="Number">
        /// Gets or sets the outcomePersonRole_ID for this outcomePersonRole.
        /// </field>
        /// <field name="Person_ID" type="Number">
        /// Gets or sets the person_ID for this outcomePersonRole.
        /// </field>
        /// <field name="Role_ID" type="Number">
        /// Gets or sets the role_ID for this outcomePersonRole.
        /// </field>
        /// <field name="Sharepoint_ID" type="String">
        /// Gets or sets the sharepoint_ID for this outcomePersonRole.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this outcomePersonRole.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this outcomePersonRole.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this outcomePersonRole.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this outcomePersonRole.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this outcomePersonRole.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this outcomePersonRole.
        /// </field>
        /// <field name="details" type="msls.application.OutcomePersonRole.Details">
        /// Gets the details for this outcomePersonRole.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Output(entitySet) {
        /// <summary>
        /// Represents the Output entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this output.
        /// </param>
        /// <field name="Output_ID" type="Number">
        /// Gets or sets the output_ID for this output.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this output.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this output.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this output.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this output.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this output.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this output.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this output.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this output.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this output.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this output.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this output.
        /// </field>
        /// <field name="OutputPersonRoles" type="msls.EntityCollection" elementType="msls.application.OutputPersonRole">
        /// Gets the outputPersonRoles for this output.
        /// </field>
        /// <field name="SubOutputs" type="msls.EntityCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputs for this output.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this output.
        /// </field>
        /// <field name="details" type="msls.application.Output.Details">
        /// Gets the details for this output.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function OutputPersonRole(entitySet) {
        /// <summary>
        /// Represents the OutputPersonRole entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this outputPersonRole.
        /// </param>
        /// <field name="OutputPersonRole_ID" type="Number">
        /// Gets or sets the outputPersonRole_ID for this outputPersonRole.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this outputPersonRole.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this outputPersonRole.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this outputPersonRole.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this outputPersonRole.
        /// </field>
        /// <field name="Output" type="msls.application.Output">
        /// Gets or sets the output for this outputPersonRole.
        /// </field>
        /// <field name="Person" type="msls.application.Person">
        /// Gets or sets the person for this outputPersonRole.
        /// </field>
        /// <field name="Role" type="msls.application.Role">
        /// Gets or sets the role for this outputPersonRole.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this outputPersonRole.
        /// </field>
        /// <field name="details" type="msls.application.OutputPersonRole.Details">
        /// Gets the details for this outputPersonRole.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Project(entitySet) {
        /// <summary>
        /// Represents the Project entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this project.
        /// </param>
        /// <field name="ProjectID" type="Number">
        /// Gets or sets the projectID for this project.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this project.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this project.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this project.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this project.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this project.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this project.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this project.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this project.
        /// </field>
        /// <field name="Activities" type="msls.EntityCollection" elementType="msls.application.Activity">
        /// Gets the activities for this project.
        /// </field>
        /// <field name="Milestones" type="msls.EntityCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this project.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this project.
        /// </field>
        /// <field name="Projects" type="msls.EntityCollection" elementType="msls.application.Project">
        /// Gets the projects for this project.
        /// </field>
        /// <field name="Project1" type="msls.application.Project">
        /// Gets or sets the project1 for this project.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this project.
        /// </field>
        /// <field name="details" type="msls.application.Project.Details">
        /// Gets the details for this project.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function SubOutput(entitySet) {
        /// <summary>
        /// Represents the SubOutput entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this subOutput.
        /// </param>
        /// <field name="SubOutput_ID" type="Number">
        /// Gets or sets the subOutput_ID for this subOutput.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this subOutput.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this subOutput.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this subOutput.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this subOutput.
        /// </field>
        /// <field name="TextDescription" type="String">
        /// Gets or sets the textDescription for this subOutput.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this subOutput.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this subOutput.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this subOutput.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this subOutput.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this subOutput.
        /// </field>
        /// <field name="Output" type="msls.application.Output">
        /// Gets or sets the output for this subOutput.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this subOutput.
        /// </field>
        /// <field name="Activities" type="msls.EntityCollection" elementType="msls.application.Activity">
        /// Gets the activities for this subOutput.
        /// </field>
        /// <field name="details" type="msls.application.SubOutput.Details">
        /// Gets the details for this subOutput.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function DataSource(entitySet) {
        /// <summary>
        /// Represents the DataSource entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dataSource.
        /// </param>
        /// <field name="DataSource_ID" type="Number">
        /// Gets or sets the dataSource_ID for this dataSource.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this dataSource.
        /// </field>
        /// <field name="ContactDetails" type="String">
        /// Gets or sets the contactDetails for this dataSource.
        /// </field>
        /// <field name="Custodian" type="String">
        /// Gets or sets the custodian for this dataSource.
        /// </field>
        /// <field name="Format" type="String">
        /// Gets or sets the format for this dataSource.
        /// </field>
        /// <field name="CollectionMethod" type="String">
        /// Gets or sets the collectionMethod for this dataSource.
        /// </field>
        /// <field name="MetadataStatus" type="String">
        /// Gets or sets the metadataStatus for this dataSource.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this dataSource.
        /// </field>
        /// <field name="Sharepoint_ID" type="String">
        /// Gets or sets the sharepoint_ID for this dataSource.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this dataSource.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this dataSource.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this dataSource.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this dataSource.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this dataSource.
        /// </field>
        /// <field name="details" type="msls.application.DataSource.Details">
        /// Gets the details for this dataSource.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function DataVersion(entitySet) {
        /// <summary>
        /// Represents the DataVersion entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dataVersion.
        /// </param>
        /// <field name="DataVersion_ID" type="Number">
        /// Gets or sets the dataVersion_ID for this dataVersion.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this dataVersion.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this dataVersion.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this dataVersion.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this dataVersion.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this dataVersion.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this dataVersion.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this dataVersion.
        /// </field>
        /// <field name="DataVersions" type="msls.EntityCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersions for this dataVersion.
        /// </field>
        /// <field name="DataVersion1" type="msls.application.DataVersion">
        /// Gets or sets the dataVersion1 for this dataVersion.
        /// </field>
        /// <field name="DataVersionLevel" type="msls.application.DataVersionLevel">
        /// Gets or sets the dataVersionLevel for this dataVersion.
        /// </field>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this dataVersion.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this dataVersion.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this dataVersion.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this dataVersion.
        /// </field>
        /// <field name="details" type="msls.application.DataVersion.Details">
        /// Gets the details for this dataVersion.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function DataVersionLevel(entitySet) {
        /// <summary>
        /// Represents the DataVersionLevel entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dataVersionLevel.
        /// </param>
        /// <field name="DataVersionLevel_ID" type="Number">
        /// Gets or sets the dataVersionLevel_ID for this dataVersionLevel.
        /// </field>
        /// <field name="VersionLevelCode" type="String">
        /// Gets or sets the versionLevelCode for this dataVersionLevel.
        /// </field>
        /// <field name="VersionOrder" type="Number">
        /// Gets or sets the versionOrder for this dataVersionLevel.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this dataVersionLevel.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this dataVersionLevel.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this dataVersionLevel.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this dataVersionLevel.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this dataVersionLevel.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this dataVersionLevel.
        /// </field>
        /// <field name="DataVersions" type="msls.EntityCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersions for this dataVersionLevel.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this dataVersionLevel.
        /// </field>
        /// <field name="details" type="msls.application.DataVersionLevel.Details">
        /// Gets the details for this dataVersionLevel.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function DimDate(entitySet) {
        /// <summary>
        /// Represents the DimDate entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this dimDate.
        /// </param>
        /// <field name="DateID" type="Number">
        /// Gets or sets the dateID for this dimDate.
        /// </field>
        /// <field name="c_Date" type="Date">
        /// Gets or sets the c_Date for this dimDate.
        /// </field>
        /// <field name="Day" type="Number">
        /// Gets or sets the day for this dimDate.
        /// </field>
        /// <field name="DaySuffix" type="String">
        /// Gets or sets the daySuffix for this dimDate.
        /// </field>
        /// <field name="USDayOfWeek" type="String">
        /// Gets or sets the uSDayOfWeek for this dimDate.
        /// </field>
        /// <field name="DayOfWeek" type="String">
        /// Gets or sets the dayOfWeek for this dimDate.
        /// </field>
        /// <field name="DOWInMonth" type="Number">
        /// Gets or sets the dOWInMonth for this dimDate.
        /// </field>
        /// <field name="DayOfYear" type="Number">
        /// Gets or sets the dayOfYear for this dimDate.
        /// </field>
        /// <field name="WeekOfYear" type="Number">
        /// Gets or sets the weekOfYear for this dimDate.
        /// </field>
        /// <field name="WeekOfMonth" type="Number">
        /// Gets or sets the weekOfMonth for this dimDate.
        /// </field>
        /// <field name="MonthNumber" type="Number">
        /// Gets or sets the monthNumber for this dimDate.
        /// </field>
        /// <field name="MonthName" type="String">
        /// Gets or sets the monthName for this dimDate.
        /// </field>
        /// <field name="Quarter" type="Number">
        /// Gets or sets the quarter for this dimDate.
        /// </field>
        /// <field name="QuarterName" type="String">
        /// Gets or sets the quarterName for this dimDate.
        /// </field>
        /// <field name="YearName" type="String">
        /// Gets or sets the yearName for this dimDate.
        /// </field>
        /// <field name="YearNumber" type="Number">
        /// Gets or sets the yearNumber for this dimDate.
        /// </field>
        /// <field name="StandardDate" type="String">
        /// Gets or sets the standardDate for this dimDate.
        /// </field>
        /// <field name="IsPublicHoliday" type="Boolean">
        /// Gets or sets the isPublicHoliday for this dimDate.
        /// </field>
        /// <field name="HolidayText" type="String">
        /// Gets or sets the holidayText for this dimDate.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this dimDate.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this dimDate.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this dimDate.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this dimDate.
        /// </field>
        /// <field name="DateSK" type="Number">
        /// Gets or sets the dateSK for this dimDate.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this dimDate.
        /// </field>
        /// <field name="details" type="msls.application.DimDate.Details">
        /// Gets the details for this dimDate.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Location(entitySet) {
        /// <summary>
        /// Represents the Location entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this location.
        /// </param>
        /// <field name="Location_ID" type="Number">
        /// Gets or sets the location_ID for this location.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this location.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this location.
        /// </field>
        /// <field name="Area" type="String">
        /// Gets or sets the area for this location.
        /// </field>
        /// <field name="Density" type="String">
        /// Gets or sets the density for this location.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this location.
        /// </field>
        /// <field name="ParentLocation_ID" type="Number">
        /// Gets or sets the parentLocation_ID for this location.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this location.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this location.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this location.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this location.
        /// </field>
        /// <field name="IndicatorLocations" type="msls.EntityCollection" elementType="msls.application.IndicatorLocation">
        /// Gets the indicatorLocations for this location.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this location.
        /// </field>
        /// <field name="LocationType" type="msls.application.LocationType">
        /// Gets or sets the locationType for this location.
        /// </field>
        /// <field name="MilestoneLocations" type="msls.EntityCollection" elementType="msls.application.MilestoneLocation">
        /// Gets the milestoneLocations for this location.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this location.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this location.
        /// </field>
        /// <field name="details" type="msls.application.Location.Details">
        /// Gets the details for this location.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function LocationType(entitySet) {
        /// <summary>
        /// Represents the LocationType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this locationType.
        /// </param>
        /// <field name="LocationType_ID" type="Number">
        /// Gets or sets the locationType_ID for this locationType.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this locationType.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this locationType.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this locationType.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this locationType.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this locationType.
        /// </field>
        /// <field name="Locations" type="msls.EntityCollection" elementType="msls.application.Location">
        /// Gets the locations for this locationType.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this locationType.
        /// </field>
        /// <field name="details" type="msls.application.LocationType.Details">
        /// Gets the details for this locationType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Organization(entitySet) {
        /// <summary>
        /// Represents the Organization entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this organization.
        /// </param>
        /// <field name="Organization_ID" type="Number">
        /// Gets or sets the organization_ID for this organization.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this organization.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this organization.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this organization.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this organization.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this organization.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this organization.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this organization.
        /// </field>
        /// <field name="Organizations" type="msls.EntityCollection" elementType="msls.application.Organization">
        /// Gets the organizations for this organization.
        /// </field>
        /// <field name="Organization1" type="msls.application.Organization">
        /// Gets or sets the organization1 for this organization.
        /// </field>
        /// <field name="OrganizationType" type="msls.application.OrganizationType">
        /// Gets or sets the organizationType for this organization.
        /// </field>
        /// <field name="OutcomeOrganizations" type="msls.EntityCollection" elementType="msls.application.OutcomeOrganization">
        /// Gets the outcomeOrganizations for this organization.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this organization.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this organization.
        /// </field>
        /// <field name="details" type="msls.application.Organization.Details">
        /// Gets the details for this organization.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function OrganizationType(entitySet) {
        /// <summary>
        /// Represents the OrganizationType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this organizationType.
        /// </param>
        /// <field name="OrganizationType_ID" type="Number">
        /// Gets or sets the organizationType_ID for this organizationType.
        /// </field>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this organizationType.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this organizationType.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this organizationType.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this organizationType.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this organizationType.
        /// </field>
        /// <field name="Organizations" type="msls.EntityCollection" elementType="msls.application.Organization">
        /// Gets the organizations for this organizationType.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this organizationType.
        /// </field>
        /// <field name="details" type="msls.application.OrganizationType.Details">
        /// Gets the details for this organizationType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Person(entitySet) {
        /// <summary>
        /// Represents the Person entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this person.
        /// </param>
        /// <field name="Person_ID" type="Number">
        /// Gets or sets the person_ID for this person.
        /// </field>
        /// <field name="Title" type="String">
        /// Gets or sets the title for this person.
        /// </field>
        /// <field name="ContactDetails" type="String">
        /// Gets or sets the contactDetails for this person.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this person.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this person.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this person.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this person.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this person.
        /// </field>
        /// <field name="OutputPersonRoles" type="msls.EntityCollection" elementType="msls.application.OutputPersonRole">
        /// Gets the outputPersonRoles for this person.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this person.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this person.
        /// </field>
        /// <field name="Category" type="String">
        /// Gets or sets the category for this person.
        /// </field>
        /// <field name="UserDetails" type="String">
        /// Gets or sets the userDetails for this person.
        /// </field>
        /// <field name="Sharepoint_ID" type="String">
        /// Gets or sets the sharepoint_ID for this person.
        /// </field>
        /// <field name="details" type="msls.application.Person.Details">
        /// Gets the details for this person.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function ReportingPeriod(entitySet) {
        /// <summary>
        /// Represents the ReportingPeriod entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this reportingPeriod.
        /// </param>
        /// <field name="ID" type="Number">
        /// Gets or sets the iD for this reportingPeriod.
        /// </field>
        /// <field name="ReportingPeriod1" type="Number">
        /// Gets or sets the reportingPeriod1 for this reportingPeriod.
        /// </field>
        /// <field name="StartDateID" type="Number">
        /// Gets or sets the startDateID for this reportingPeriod.
        /// </field>
        /// <field name="EndDateID" type="Number">
        /// Gets or sets the endDateID for this reportingPeriod.
        /// </field>
        /// <field name="FirstCycleDate" type="Date">
        /// Gets or sets the firstCycleDate for this reportingPeriod.
        /// </field>
        /// <field name="LastCycleDate" type="Date">
        /// Gets or sets the lastCycleDate for this reportingPeriod.
        /// </field>
        /// <field name="YearName" type="String">
        /// Gets or sets the yearName for this reportingPeriod.
        /// </field>
        /// <field name="YearNumber" type="Number">
        /// Gets or sets the yearNumber for this reportingPeriod.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this reportingPeriod.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this reportingPeriod.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this reportingPeriod.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this reportingPeriod.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this reportingPeriod.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this reportingPeriod.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this reportingPeriod.
        /// </field>
        /// <field name="details" type="msls.application.ReportingPeriod.Details">
        /// Gets the details for this reportingPeriod.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function Role(entitySet) {
        /// <summary>
        /// Represents the Role entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this role.
        /// </param>
        /// <field name="Description" type="String">
        /// Gets or sets the description for this role.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this role.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this role.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this role.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this role.
        /// </field>
        /// <field name="OutputPersonRoles" type="msls.EntityCollection" elementType="msls.application.OutputPersonRole">
        /// Gets the outputPersonRoles for this role.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this role.
        /// </field>
        /// <field name="RoleID" type="Number">
        /// Gets or sets the roleID for this role.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this role.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this role.
        /// </field>
        /// <field name="details" type="msls.application.Role.Details">
        /// Gets the details for this role.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function IndicatorValue(entitySet) {
        /// <summary>
        /// Represents the IndicatorValue entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this indicatorValue.
        /// </param>
        /// <field name="IndicatorValues_ID" type="Number">
        /// Gets or sets the indicatorValues_ID for this indicatorValue.
        /// </field>
        /// <field name="ActualLabel" type="String">
        /// Gets or sets the actualLabel for this indicatorValue.
        /// </field>
        /// <field name="ActualValue" type="Number">
        /// Gets or sets the actualValue for this indicatorValue.
        /// </field>
        /// <field name="ActualValueString" type="String">
        /// Gets or sets the actualValueString for this indicatorValue.
        /// </field>
        /// <field name="ActualDate" type="Date">
        /// Gets or sets the actualDate for this indicatorValue.
        /// </field>
        /// <field name="ReleaseDate" type="Date">
        /// Gets or sets the releaseDate for this indicatorValue.
        /// </field>
        /// <field name="ReportingDate" type="Date">
        /// Gets or sets the reportingDate for this indicatorValue.
        /// </field>
        /// <field name="IndicatorReportingDate" type="Date">
        /// Gets or sets the indicatorReportingDate for this indicatorValue.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this indicatorValue.
        /// </field>
        /// <field name="Notes" type="String">
        /// Gets or sets the notes for this indicatorValue.
        /// </field>
        /// <field name="IndicatorStatusPercent" type="Number">
        /// Gets or sets the indicatorStatusPercent for this indicatorValue.
        /// </field>
        /// <field name="Title" type="String">
        /// Gets or sets the title for this indicatorValue.
        /// </field>
        /// <field name="ModifiedDate" type="Date">
        /// Gets or sets the modifiedDate for this indicatorValue.
        /// </field>
        /// <field name="Username" type="String">
        /// Gets or sets the username for this indicatorValue.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this indicatorValue.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this indicatorValue.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this indicatorValue.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this indicatorValue.
        /// </field>
        /// <field name="DataVersion" type="msls.application.DataVersion">
        /// Gets or sets the dataVersion for this indicatorValue.
        /// </field>
        /// <field name="Indicator" type="msls.application.Indicator">
        /// Gets or sets the indicator for this indicatorValue.
        /// </field>
        /// <field name="Location" type="msls.application.Location">
        /// Gets or sets the location for this indicatorValue.
        /// </field>
        /// <field name="Organization" type="msls.application.Organization">
        /// Gets or sets the organization for this indicatorValue.
        /// </field>
        /// <field name="ReportingPeriod" type="msls.application.ReportingPeriod">
        /// Gets or sets the reportingPeriod for this indicatorValue.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this indicatorValue.
        /// </field>
        /// <field name="details" type="msls.application.IndicatorValue.Details">
        /// Gets the details for this indicatorValue.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function MilestoneValue(entitySet) {
        /// <summary>
        /// Represents the MilestoneValue entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this milestoneValue.
        /// </param>
        /// <field name="MilestoneValues_ID" type="Number">
        /// Gets or sets the milestoneValues_ID for this milestoneValue.
        /// </field>
        /// <field name="ActualLabel" type="String">
        /// Gets or sets the actualLabel for this milestoneValue.
        /// </field>
        /// <field name="ActualValue" type="Number">
        /// Gets or sets the actualValue for this milestoneValue.
        /// </field>
        /// <field name="ActualValueString" type="String">
        /// Gets or sets the actualValueString for this milestoneValue.
        /// </field>
        /// <field name="ActualDate" type="Date">
        /// Gets or sets the actualDate for this milestoneValue.
        /// </field>
        /// <field name="BusinessKey" type="String">
        /// Gets or sets the businessKey for this milestoneValue.
        /// </field>
        /// <field name="Notes" type="String">
        /// Gets or sets the notes for this milestoneValue.
        /// </field>
        /// <field name="MilestoneStatusPercent" type="Number">
        /// Gets or sets the milestoneStatusPercent for this milestoneValue.
        /// </field>
        /// <field name="Title" type="String">
        /// Gets or sets the title for this milestoneValue.
        /// </field>
        /// <field name="ModifiedDate" type="Date">
        /// Gets or sets the modifiedDate for this milestoneValue.
        /// </field>
        /// <field name="Username" type="String">
        /// Gets or sets the username for this milestoneValue.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this milestoneValue.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this milestoneValue.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this milestoneValue.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this milestoneValue.
        /// </field>
        /// <field name="DataVersion" type="msls.application.DataVersion">
        /// Gets or sets the dataVersion for this milestoneValue.
        /// </field>
        /// <field name="Location" type="msls.application.Location">
        /// Gets or sets the location for this milestoneValue.
        /// </field>
        /// <field name="Milestone" type="msls.application.Milestone">
        /// Gets or sets the milestone for this milestoneValue.
        /// </field>
        /// <field name="ReportingPeriod" type="msls.application.ReportingPeriod">
        /// Gets or sets the reportingPeriod for this milestoneValue.
        /// </field>
        /// <field name="ActiveType" type="msls.application.ActiveType">
        /// Gets or sets the activeType for this milestoneValue.
        /// </field>
        /// <field name="Organization" type="msls.application.Organization">
        /// Gets or sets the organization for this milestoneValue.
        /// </field>
        /// <field name="details" type="msls.application.MilestoneValue.Details">
        /// Gets the details for this milestoneValue.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function ActiveType(entitySet) {
        /// <summary>
        /// Represents the ActiveType entity type.
        /// </summary>
        /// <param name="entitySet" type="msls.EntitySet" optional="true">
        /// The entity set that should contain this activeType.
        /// </param>
        /// <field name="ID" type="Number">
        /// Gets or sets the iD for this activeType.
        /// </field>
        /// <field name="Code" type="String">
        /// Gets or sets the code for this activeType.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this activeType.
        /// </field>
        /// <field name="Activities" type="msls.EntityCollection" elementType="msls.application.Activity">
        /// Gets the activities for this activeType.
        /// </field>
        /// <field name="DataSources" type="msls.EntityCollection" elementType="msls.application.DataSource">
        /// Gets the dataSources for this activeType.
        /// </field>
        /// <field name="DataVersions" type="msls.EntityCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersions for this activeType.
        /// </field>
        /// <field name="DataVersionLevels" type="msls.EntityCollection" elementType="msls.application.DataVersionLevel">
        /// Gets the dataVersionLevels for this activeType.
        /// </field>
        /// <field name="DimDates" type="msls.EntityCollection" elementType="msls.application.DimDate">
        /// Gets the dimDates for this activeType.
        /// </field>
        /// <field name="Indicators" type="msls.EntityCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this activeType.
        /// </field>
        /// <field name="IndicatorLocations" type="msls.EntityCollection" elementType="msls.application.IndicatorLocation">
        /// Gets the indicatorLocations for this activeType.
        /// </field>
        /// <field name="IndicatorTypes" type="msls.EntityCollection" elementType="msls.application.IndicatorType">
        /// Gets the indicatorTypes for this activeType.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntityCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this activeType.
        /// </field>
        /// <field name="Locations" type="msls.EntityCollection" elementType="msls.application.Location">
        /// Gets the locations for this activeType.
        /// </field>
        /// <field name="LocationTypes" type="msls.EntityCollection" elementType="msls.application.LocationType">
        /// Gets the locationTypes for this activeType.
        /// </field>
        /// <field name="Milestones" type="msls.EntityCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this activeType.
        /// </field>
        /// <field name="MilestoneLocations" type="msls.EntityCollection" elementType="msls.application.MilestoneLocation">
        /// Gets the milestoneLocations for this activeType.
        /// </field>
        /// <field name="MilestoneTypes" type="msls.EntityCollection" elementType="msls.application.MilestoneType">
        /// Gets the milestoneTypes for this activeType.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntityCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this activeType.
        /// </field>
        /// <field name="Organizations" type="msls.EntityCollection" elementType="msls.application.Organization">
        /// Gets the organizations for this activeType.
        /// </field>
        /// <field name="OrganizationTypes" type="msls.EntityCollection" elementType="msls.application.OrganizationType">
        /// Gets the organizationTypes for this activeType.
        /// </field>
        /// <field name="Outcomes" type="msls.EntityCollection" elementType="msls.application.Outcome">
        /// Gets the outcomes for this activeType.
        /// </field>
        /// <field name="OutcomeOrganizations" type="msls.EntityCollection" elementType="msls.application.OutcomeOrganization">
        /// Gets the outcomeOrganizations for this activeType.
        /// </field>
        /// <field name="OutcomePersonRoles" type="msls.EntityCollection" elementType="msls.application.OutcomePersonRole">
        /// Gets the outcomePersonRoles for this activeType.
        /// </field>
        /// <field name="Outputs" type="msls.EntityCollection" elementType="msls.application.Output">
        /// Gets the outputs for this activeType.
        /// </field>
        /// <field name="OutputPersonRoles" type="msls.EntityCollection" elementType="msls.application.OutputPersonRole">
        /// Gets the outputPersonRoles for this activeType.
        /// </field>
        /// <field name="People" type="msls.EntityCollection" elementType="msls.application.Person">
        /// Gets the people for this activeType.
        /// </field>
        /// <field name="Projects" type="msls.EntityCollection" elementType="msls.application.Project">
        /// Gets the projects for this activeType.
        /// </field>
        /// <field name="ReportingPeriods" type="msls.EntityCollection" elementType="msls.application.ReportingPeriod">
        /// Gets the reportingPeriods for this activeType.
        /// </field>
        /// <field name="Roles" type="msls.EntityCollection" elementType="msls.application.Role">
        /// Gets the roles for this activeType.
        /// </field>
        /// <field name="SubOutputs" type="msls.EntityCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputs for this activeType.
        /// </field>
        /// <field name="sys_CreatedBy" type="String">
        /// Gets or sets the sys_CreatedBy for this activeType.
        /// </field>
        /// <field name="sys_CreatedOn" type="Date">
        /// Gets or sets the sys_CreatedOn for this activeType.
        /// </field>
        /// <field name="sys_ModifiedBy" type="String">
        /// Gets or sets the sys_ModifiedBy for this activeType.
        /// </field>
        /// <field name="sys_ModifiedOn" type="Date">
        /// Gets or sets the sys_ModifiedOn for this activeType.
        /// </field>
        /// <field name="details" type="msls.application.ActiveType.Details">
        /// Gets the details for this activeType.
        /// </field>
        $Entity.call(this, entitySet);
    }

    function MeerkatData(dataWorkspace) {
        /// <summary>
        /// Represents the MeerkatData data service.
        /// </summary>
        /// <param name="dataWorkspace" type="msls.DataWorkspace">
        /// The data workspace that created this data service.
        /// </param>
        /// <field name="Activities" type="msls.EntitySet">
        /// Gets the Activities entity set.
        /// </field>
        /// <field name="Indicators" type="msls.EntitySet">
        /// Gets the Indicators entity set.
        /// </field>
        /// <field name="IndicatorLocations" type="msls.EntitySet">
        /// Gets the IndicatorLocations entity set.
        /// </field>
        /// <field name="IndicatorTypes" type="msls.EntitySet">
        /// Gets the IndicatorTypes entity set.
        /// </field>
        /// <field name="Milestones" type="msls.EntitySet">
        /// Gets the Milestones entity set.
        /// </field>
        /// <field name="MilestoneLocations" type="msls.EntitySet">
        /// Gets the MilestoneLocations entity set.
        /// </field>
        /// <field name="MilestoneTypes" type="msls.EntitySet">
        /// Gets the MilestoneTypes entity set.
        /// </field>
        /// <field name="Outcomes" type="msls.EntitySet">
        /// Gets the Outcomes entity set.
        /// </field>
        /// <field name="OutcomeOrganizations" type="msls.EntitySet">
        /// Gets the OutcomeOrganizations entity set.
        /// </field>
        /// <field name="OutcomePersonRoles" type="msls.EntitySet">
        /// Gets the OutcomePersonRoles entity set.
        /// </field>
        /// <field name="Outputs" type="msls.EntitySet">
        /// Gets the Outputs entity set.
        /// </field>
        /// <field name="OutputPersonRoles" type="msls.EntitySet">
        /// Gets the OutputPersonRoles entity set.
        /// </field>
        /// <field name="Projects" type="msls.EntitySet">
        /// Gets the Projects entity set.
        /// </field>
        /// <field name="SubOutputs" type="msls.EntitySet">
        /// Gets the SubOutputs entity set.
        /// </field>
        /// <field name="DataSources" type="msls.EntitySet">
        /// Gets the DataSources entity set.
        /// </field>
        /// <field name="DataVersions" type="msls.EntitySet">
        /// Gets the DataVersions entity set.
        /// </field>
        /// <field name="DataVersionLevels" type="msls.EntitySet">
        /// Gets the DataVersionLevels entity set.
        /// </field>
        /// <field name="DimDates" type="msls.EntitySet">
        /// Gets the DimDates entity set.
        /// </field>
        /// <field name="Locations" type="msls.EntitySet">
        /// Gets the Locations entity set.
        /// </field>
        /// <field name="LocationTypes" type="msls.EntitySet">
        /// Gets the LocationTypes entity set.
        /// </field>
        /// <field name="Organizations" type="msls.EntitySet">
        /// Gets the Organizations entity set.
        /// </field>
        /// <field name="OrganizationTypes" type="msls.EntitySet">
        /// Gets the OrganizationTypes entity set.
        /// </field>
        /// <field name="People" type="msls.EntitySet">
        /// Gets the People entity set.
        /// </field>
        /// <field name="ReportingPeriods" type="msls.EntitySet">
        /// Gets the ReportingPeriods entity set.
        /// </field>
        /// <field name="Roles" type="msls.EntitySet">
        /// Gets the Roles entity set.
        /// </field>
        /// <field name="IndicatorValues" type="msls.EntitySet">
        /// Gets the IndicatorValues entity set.
        /// </field>
        /// <field name="MilestoneValues" type="msls.EntitySet">
        /// Gets the MilestoneValues entity set.
        /// </field>
        /// <field name="ActiveTypes" type="msls.EntitySet">
        /// Gets the ActiveTypes entity set.
        /// </field>
        /// <field name="details" type="msls.application.MeerkatData.Details">
        /// Gets the details for this data service.
        /// </field>
        $DataService.call(this, dataWorkspace);
    };
    function DataWorkspace() {
        /// <summary>
        /// Represents the data workspace.
        /// </summary>
        /// <field name="MeerkatData" type="msls.application.MeerkatData">
        /// Gets the MeerkatData data service.
        /// </field>
        /// <field name="details" type="msls.application.DataWorkspace.Details">
        /// Gets the details for this data workspace.
        /// </field>
        $DataWorkspace.call(this);
    };

    msls._addToNamespace("msls.application", {

        Activity: $defineEntity(Activity, [
            { name: "ActivityID", type: Number },
            { name: "ShortName", type: String },
            { name: "LongName", type: String },
            { name: "TextDescription", type: String },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedBy", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_ModifiedOn", type: Date },
            { name: "Code", type: String },
            { name: "Project", kind: "reference", type: Project },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "Milestones", kind: "collection", elementType: Milestone },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "ActivityType_ID", type: Number },
            { name: "SubOutput", kind: "reference", type: SubOutput }
        ]),

        Indicator: $defineEntity(Indicator, [
            { name: "IndicatorID", type: Number },
            { name: "LongName", type: String },
            { name: "TextDescription", type: String },
            { name: "Baseline", type: Number },
            { name: "BaselineString", type: String },
            { name: "BaselineDate", type: Date },
            { name: "Target", type: Number },
            { name: "TargetString", type: String },
            { name: "TargetDate", type: Date },
            { name: "ReleaseDate", type: Date },
            { name: "ReportingDate", type: Date },
            { name: "BusinessKey", type: String },
            { name: "Notes", type: String },
            { name: "Code", type: String },
            { name: "ShortName", type: String },
            { name: "BaselineDate_ID", type: Number },
            { name: "TargetDate_ID", type: Number },
            { name: "updated", type: String },
            { name: "IsKeyIndicator", type: Boolean },
            { name: "UnitOfMeasure", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Activity", kind: "reference", type: Activity },
            { name: "IndicatorType", kind: "reference", type: IndicatorType },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "Output", kind: "reference", type: Output },
            { name: "SubOutput", kind: "reference", type: SubOutput },
            { name: "IndicatorLocations", kind: "collection", elementType: IndicatorLocation },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "Sharepoint_ID", type: String },
            { name: "projectID", type: Number }
        ]),

        IndicatorLocation: $defineEntity(IndicatorLocation, [
            { name: "IndicatorLocation_ID", type: Number },
            { name: "Sharepoint_ID", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Indicator", kind: "reference", type: Indicator },
            { name: "Location", kind: "reference", type: Location },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        IndicatorType: $defineEntity(IndicatorType, [
            { name: "IndicatorType_ID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Milestone: $defineEntity(Milestone, [
            { name: "MilestoneID", type: Number },
            { name: "LongName", type: String },
            { name: "TextDescription", type: String },
            { name: "Baseline", type: Number },
            { name: "BaselineString", type: String },
            { name: "BaselineDate", type: Date },
            { name: "Target", type: Number },
            { name: "TargetString", type: String },
            { name: "TargetDate", type: Date },
            { name: "ReleaseDate", type: Date },
            { name: "ReportingDate", type: Date },
            { name: "BusinessKey", type: String },
            { name: "Notes", type: String },
            { name: "Code", type: String },
            { name: "ShortName", type: String },
            { name: "BaselineDateID", type: Number },
            { name: "TargetDateID", type: Number },
            { name: "IsKeyIndicator", type: Boolean },
            { name: "UnitOfMeasure", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Activity", kind: "reference", type: Activity },
            { name: "MilestoneType", kind: "reference", type: MilestoneType },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "Project", kind: "reference", type: Project },
            { name: "MilestoneLocations", kind: "collection", elementType: MilestoneLocation },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        MilestoneLocation: $defineEntity(MilestoneLocation, [
            { name: "MilestoneLocation_ID", type: Number },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Location", kind: "reference", type: Location },
            { name: "Milestone", kind: "reference", type: Milestone },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        MilestoneType: $defineEntity(MilestoneType, [
            { name: "MilestoneTypeID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Milestones", kind: "collection", elementType: Milestone },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Outcome: $defineEntity(Outcome, [
            { name: "OutcomeID", type: Number },
            { name: "Code", type: String },
            { name: "LongName", type: String },
            { name: "BusinessKey", type: String },
            { name: "ShortName", type: String },
            { name: "TextDescription", type: String },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedBy", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_ModifiedOn", type: Date },
            { name: "DataVersions", kind: "collection", elementType: DataVersion },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "Milestones", kind: "collection", elementType: Milestone },
            { name: "OutcomeOrganizations", kind: "collection", elementType: OutcomeOrganization },
            { name: "OutcomePersonRoles", kind: "collection", elementType: OutcomePersonRole },
            { name: "Outputs", kind: "collection", elementType: Output },
            { name: "Projects", kind: "collection", elementType: Project },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "OutcomeSiteName", type: String }
        ]),

        OutcomeOrganization: $defineEntity(OutcomeOrganization, [
            { name: "OutcomeOrganization_ID", type: Number },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Organization", kind: "reference", type: Organization },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        OutcomePersonRole: $defineEntity(OutcomePersonRole, [
            { name: "OutcomePersonRole_ID", type: Number },
            { name: "Person_ID", type: Number },
            { name: "Role_ID", type: Number },
            { name: "Sharepoint_ID", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Output: $defineEntity(Output, [
            { name: "Output_ID", type: Number },
            { name: "Code", type: String },
            { name: "LongName", type: String },
            { name: "BusinessKey", type: String },
            { name: "ShortName", type: String },
            { name: "TextDescription", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "OutputPersonRoles", kind: "collection", elementType: OutputPersonRole },
            { name: "SubOutputs", kind: "collection", elementType: SubOutput },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        OutputPersonRole: $defineEntity(OutputPersonRole, [
            { name: "OutputPersonRole_ID", type: Number },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Output", kind: "reference", type: Output },
            { name: "Person", kind: "reference", type: Person },
            { name: "Role", kind: "reference", type: Role },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Project: $defineEntity(Project, [
            { name: "ProjectID", type: Number },
            { name: "Code", type: String },
            { name: "ShortName", type: String },
            { name: "LongName", type: String },
            { name: "TextDescription", type: String },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedBy", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_ModifiedOn", type: Date },
            { name: "Activities", kind: "collection", elementType: Activity },
            { name: "Milestones", kind: "collection", elementType: Milestone },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "Projects", kind: "collection", elementType: Project },
            { name: "Project1", kind: "reference", type: Project },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        SubOutput: $defineEntity(SubOutput, [
            { name: "SubOutput_ID", type: Number },
            { name: "Code", type: String },
            { name: "ShortName", type: String },
            { name: "BusinessKey", type: String },
            { name: "LongName", type: String },
            { name: "TextDescription", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "Output", kind: "reference", type: Output },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "Activities", kind: "collection", elementType: Activity }
        ]),

        DataSource: $defineEntity(DataSource, [
            { name: "DataSource_ID", type: Number },
            { name: "Name", type: String },
            { name: "ContactDetails", type: String },
            { name: "Custodian", type: String },
            { name: "Format", type: String },
            { name: "CollectionMethod", type: String },
            { name: "MetadataStatus", type: String },
            { name: "BusinessKey", type: String },
            { name: "Sharepoint_ID", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        DataVersion: $defineEntity(DataVersion, [
            { name: "DataVersion_ID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String },
            { name: "Description", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "DataVersions", kind: "collection", elementType: DataVersion },
            { name: "DataVersion1", kind: "reference", type: DataVersion },
            { name: "DataVersionLevel", kind: "reference", type: DataVersionLevel },
            { name: "Outcome", kind: "reference", type: Outcome },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        DataVersionLevel: $defineEntity(DataVersionLevel, [
            { name: "DataVersionLevel_ID", type: Number },
            { name: "VersionLevelCode", type: String },
            { name: "VersionOrder", type: Number },
            { name: "Name", type: String },
            { name: "Description", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "DataVersions", kind: "collection", elementType: DataVersion },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        DimDate: $defineEntity(DimDate, [
            { name: "DateID", type: Number },
            { name: "c_Date", type: Date },
            { name: "Day", type: Number },
            { name: "DaySuffix", type: String },
            { name: "USDayOfWeek", type: String },
            { name: "DayOfWeek", type: String },
            { name: "DOWInMonth", type: Number },
            { name: "DayOfYear", type: Number },
            { name: "WeekOfYear", type: Number },
            { name: "WeekOfMonth", type: Number },
            { name: "MonthNumber", type: Number },
            { name: "MonthName", type: String },
            { name: "Quarter", type: Number },
            { name: "QuarterName", type: String },
            { name: "YearName", type: String },
            { name: "YearNumber", type: Number },
            { name: "StandardDate", type: String },
            { name: "IsPublicHoliday", type: Boolean },
            { name: "HolidayText", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "DateSK", type: Number },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Location: $defineEntity(Location, [
            { name: "Location_ID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String },
            { name: "Area", type: String },
            { name: "Density", type: String },
            { name: "BusinessKey", type: String },
            { name: "ParentLocation_ID", type: Number },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "IndicatorLocations", kind: "collection", elementType: IndicatorLocation },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "LocationType", kind: "reference", type: LocationType },
            { name: "MilestoneLocations", kind: "collection", elementType: MilestoneLocation },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        LocationType: $defineEntity(LocationType, [
            { name: "LocationType_ID", type: Number },
            { name: "Description", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Locations", kind: "collection", elementType: Location },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Organization: $defineEntity(Organization, [
            { name: "Organization_ID", type: Number },
            { name: "Code", type: String },
            { name: "BusinessKey", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "Organizations", kind: "collection", elementType: Organization },
            { name: "Organization1", kind: "reference", type: Organization },
            { name: "OrganizationType", kind: "reference", type: OrganizationType },
            { name: "OutcomeOrganizations", kind: "collection", elementType: OutcomeOrganization },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue }
        ]),

        OrganizationType: $defineEntity(OrganizationType, [
            { name: "OrganizationType_ID", type: Number },
            { name: "Description", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "Organizations", kind: "collection", elementType: Organization },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Person: $defineEntity(Person, [
            { name: "Person_ID", type: Number },
            { name: "Title", type: String },
            { name: "ContactDetails", type: String },
            { name: "BusinessKey", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "OutputPersonRoles", kind: "collection", elementType: OutputPersonRole },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "Name", type: String },
            { name: "Category", type: String },
            { name: "UserDetails", type: String },
            { name: "Sharepoint_ID", type: String }
        ]),

        ReportingPeriod: $defineEntity(ReportingPeriod, [
            { name: "ID", type: Number },
            { name: "ReportingPeriod1", type: Number },
            { name: "StartDateID", type: Number },
            { name: "EndDateID", type: Number },
            { name: "FirstCycleDate", type: Date },
            { name: "LastCycleDate", type: Date },
            { name: "YearName", type: String },
            { name: "YearNumber", type: Number },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        Role: $defineEntity(Role, [
            { name: "Description", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "OutputPersonRoles", kind: "collection", elementType: OutputPersonRole },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "RoleID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String }
        ]),

        IndicatorValue: $defineEntity(IndicatorValue, [
            { name: "IndicatorValues_ID", type: Number },
            { name: "ActualLabel", type: String },
            { name: "ActualValue", type: Number },
            { name: "ActualValueString", type: String },
            { name: "ActualDate", type: Date },
            { name: "ReleaseDate", type: Date },
            { name: "ReportingDate", type: Date },
            { name: "IndicatorReportingDate", type: Date },
            { name: "BusinessKey", type: String },
            { name: "Notes", type: String },
            { name: "IndicatorStatusPercent", type: Number },
            { name: "Title", type: String },
            { name: "ModifiedDate", type: Date },
            { name: "Username", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "DataVersion", kind: "reference", type: DataVersion },
            { name: "Indicator", kind: "reference", type: Indicator },
            { name: "Location", kind: "reference", type: Location },
            { name: "Organization", kind: "reference", type: Organization },
            { name: "ReportingPeriod", kind: "reference", type: ReportingPeriod },
            { name: "ActiveType", kind: "reference", type: ActiveType }
        ]),

        MilestoneValue: $defineEntity(MilestoneValue, [
            { name: "MilestoneValues_ID", type: Number },
            { name: "ActualLabel", type: String },
            { name: "ActualValue", type: Number },
            { name: "ActualValueString", type: String },
            { name: "ActualDate", type: Date },
            { name: "BusinessKey", type: String },
            { name: "Notes", type: String },
            { name: "MilestoneStatusPercent", type: Number },
            { name: "Title", type: String },
            { name: "ModifiedDate", type: Date },
            { name: "Username", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_ModifiedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "DataVersion", kind: "reference", type: DataVersion },
            { name: "Location", kind: "reference", type: Location },
            { name: "Milestone", kind: "reference", type: Milestone },
            { name: "ReportingPeriod", kind: "reference", type: ReportingPeriod },
            { name: "ActiveType", kind: "reference", type: ActiveType },
            { name: "Organization", kind: "reference", type: Organization }
        ]),

        ActiveType: $defineEntity(ActiveType, [
            { name: "ID", type: Number },
            { name: "Code", type: String },
            { name: "Name", type: String },
            { name: "Activities", kind: "collection", elementType: Activity },
            { name: "DataSources", kind: "collection", elementType: DataSource },
            { name: "DataVersions", kind: "collection", elementType: DataVersion },
            { name: "DataVersionLevels", kind: "collection", elementType: DataVersionLevel },
            { name: "DimDates", kind: "collection", elementType: DimDate },
            { name: "Indicators", kind: "collection", elementType: Indicator },
            { name: "IndicatorLocations", kind: "collection", elementType: IndicatorLocation },
            { name: "IndicatorTypes", kind: "collection", elementType: IndicatorType },
            { name: "IndicatorValues", kind: "collection", elementType: IndicatorValue },
            { name: "Locations", kind: "collection", elementType: Location },
            { name: "LocationTypes", kind: "collection", elementType: LocationType },
            { name: "Milestones", kind: "collection", elementType: Milestone },
            { name: "MilestoneLocations", kind: "collection", elementType: MilestoneLocation },
            { name: "MilestoneTypes", kind: "collection", elementType: MilestoneType },
            { name: "MilestoneValues", kind: "collection", elementType: MilestoneValue },
            { name: "Organizations", kind: "collection", elementType: Organization },
            { name: "OrganizationTypes", kind: "collection", elementType: OrganizationType },
            { name: "Outcomes", kind: "collection", elementType: Outcome },
            { name: "OutcomeOrganizations", kind: "collection", elementType: OutcomeOrganization },
            { name: "OutcomePersonRoles", kind: "collection", elementType: OutcomePersonRole },
            { name: "Outputs", kind: "collection", elementType: Output },
            { name: "OutputPersonRoles", kind: "collection", elementType: OutputPersonRole },
            { name: "People", kind: "collection", elementType: Person },
            { name: "Projects", kind: "collection", elementType: Project },
            { name: "ReportingPeriods", kind: "collection", elementType: ReportingPeriod },
            { name: "Roles", kind: "collection", elementType: Role },
            { name: "SubOutputs", kind: "collection", elementType: SubOutput },
            { name: "sys_CreatedBy", type: String },
            { name: "sys_CreatedOn", type: Date },
            { name: "sys_ModifiedBy", type: String },
            { name: "sys_ModifiedOn", type: Date }
        ]),

        MeerkatData: $defineDataService(MeerkatData, lightSwitchApplication.rootUri + "/MeerkatData.svc", [
            { name: "Activities", elementType: Activity },
            { name: "Indicators", elementType: Indicator },
            { name: "IndicatorLocations", elementType: IndicatorLocation },
            { name: "IndicatorTypes", elementType: IndicatorType },
            { name: "Milestones", elementType: Milestone },
            { name: "MilestoneLocations", elementType: MilestoneLocation },
            { name: "MilestoneTypes", elementType: MilestoneType },
            { name: "Outcomes", elementType: Outcome },
            { name: "OutcomeOrganizations", elementType: OutcomeOrganization },
            { name: "OutcomePersonRoles", elementType: OutcomePersonRole },
            { name: "Outputs", elementType: Output },
            { name: "OutputPersonRoles", elementType: OutputPersonRole },
            { name: "Projects", elementType: Project },
            { name: "SubOutputs", elementType: SubOutput },
            { name: "DataSources", elementType: DataSource },
            { name: "DataVersions", elementType: DataVersion },
            { name: "DataVersionLevels", elementType: DataVersionLevel },
            { name: "DimDates", elementType: DimDate },
            { name: "Locations", elementType: Location },
            { name: "LocationTypes", elementType: LocationType },
            { name: "Organizations", elementType: Organization },
            { name: "OrganizationTypes", elementType: OrganizationType },
            { name: "People", elementType: Person },
            { name: "ReportingPeriods", elementType: ReportingPeriod },
            { name: "Roles", elementType: Role },
            { name: "IndicatorValues", elementType: IndicatorValue },
            { name: "MilestoneValues", elementType: MilestoneValue },
            { name: "ActiveTypes", elementType: ActiveType }
        ], [
            {
                name: "Activities_SingleOrDefault", value: function (ActivityID) {
                    return new $DataServiceQuery({ _entitySet: this.Activities },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Activities(" + "ActivityID=" + $toODataString(ActivityID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Indicators_SingleOrDefault", value: function (IndicatorID) {
                    return new $DataServiceQuery({ _entitySet: this.Indicators },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Indicators(" + "IndicatorID=" + $toODataString(IndicatorID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "IndicatorLocations_SingleOrDefault", value: function (IndicatorLocation_ID) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorLocations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorLocations(" + "IndicatorLocation_ID=" + $toODataString(IndicatorLocation_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "IndicatorTypes_SingleOrDefault", value: function (IndicatorType_ID) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorTypes(" + "IndicatorType_ID=" + $toODataString(IndicatorType_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Milestones_SingleOrDefault", value: function (MilestoneID) {
                    return new $DataServiceQuery({ _entitySet: this.Milestones },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Milestones(" + "MilestoneID=" + $toODataString(MilestoneID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "MilestoneLocations_SingleOrDefault", value: function (MilestoneLocation_ID) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneLocations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestoneLocations(" + "MilestoneLocation_ID=" + $toODataString(MilestoneLocation_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "MilestoneTypes_SingleOrDefault", value: function (MilestoneTypeID) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestoneTypes(" + "MilestoneTypeID=" + $toODataString(MilestoneTypeID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Outcomes_SingleOrDefault", value: function (OutcomeID) {
                    return new $DataServiceQuery({ _entitySet: this.Outcomes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Outcomes(" + "OutcomeID=" + $toODataString(OutcomeID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "OutcomeOrganizations_SingleOrDefault", value: function (OutcomeOrganization_ID) {
                    return new $DataServiceQuery({ _entitySet: this.OutcomeOrganizations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutcomeOrganizations(" + "OutcomeOrganization_ID=" + $toODataString(OutcomeOrganization_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "OutcomePersonRoles_SingleOrDefault", value: function (OutcomePersonRole_ID) {
                    return new $DataServiceQuery({ _entitySet: this.OutcomePersonRoles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutcomePersonRoles(" + "OutcomePersonRole_ID=" + $toODataString(OutcomePersonRole_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Outputs_SingleOrDefault", value: function (Output_ID) {
                    return new $DataServiceQuery({ _entitySet: this.Outputs },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Outputs(" + "Output_ID=" + $toODataString(Output_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "OutputPersonRoles_SingleOrDefault", value: function (OutputPersonRole_ID) {
                    return new $DataServiceQuery({ _entitySet: this.OutputPersonRoles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutputPersonRoles(" + "OutputPersonRole_ID=" + $toODataString(OutputPersonRole_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Projects_SingleOrDefault", value: function (ProjectID) {
                    return new $DataServiceQuery({ _entitySet: this.Projects },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Projects(" + "ProjectID=" + $toODataString(ProjectID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "SubOutputs_SingleOrDefault", value: function (SubOutput_ID) {
                    return new $DataServiceQuery({ _entitySet: this.SubOutputs },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/SubOutputs(" + "SubOutput_ID=" + $toODataString(SubOutput_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "DataSources_SingleOrDefault", value: function (DataSource_ID) {
                    return new $DataServiceQuery({ _entitySet: this.DataSources },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DataSources(" + "DataSource_ID=" + $toODataString(DataSource_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "DataVersions_SingleOrDefault", value: function (DataVersion_ID) {
                    return new $DataServiceQuery({ _entitySet: this.DataVersions },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DataVersions(" + "DataVersion_ID=" + $toODataString(DataVersion_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "DataVersionLevels_SingleOrDefault", value: function (DataVersionLevel_ID) {
                    return new $DataServiceQuery({ _entitySet: this.DataVersionLevels },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DataVersionLevels(" + "DataVersionLevel_ID=" + $toODataString(DataVersionLevel_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "DimDates_SingleOrDefault", value: function (DateID) {
                    return new $DataServiceQuery({ _entitySet: this.DimDates },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DimDates(" + "DateID=" + $toODataString(DateID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Locations_SingleOrDefault", value: function (Location_ID) {
                    return new $DataServiceQuery({ _entitySet: this.Locations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Locations(" + "Location_ID=" + $toODataString(Location_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "LocationTypes_SingleOrDefault", value: function (LocationType_ID) {
                    return new $DataServiceQuery({ _entitySet: this.LocationTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/LocationTypes(" + "LocationType_ID=" + $toODataString(LocationType_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Organizations_SingleOrDefault", value: function (Organization_ID) {
                    return new $DataServiceQuery({ _entitySet: this.Organizations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Organizations(" + "Organization_ID=" + $toODataString(Organization_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "OrganizationTypes_SingleOrDefault", value: function (OrganizationType_ID) {
                    return new $DataServiceQuery({ _entitySet: this.OrganizationTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OrganizationTypes(" + "OrganizationType_ID=" + $toODataString(OrganizationType_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "People_SingleOrDefault", value: function (Person_ID) {
                    return new $DataServiceQuery({ _entitySet: this.People },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/People(" + "Person_ID=" + $toODataString(Person_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "ReportingPeriods_SingleOrDefault", value: function (ID) {
                    return new $DataServiceQuery({ _entitySet: this.ReportingPeriods },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ReportingPeriods(" + "ID=" + $toODataString(ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "Roles_SingleOrDefault", value: function (RoleID) {
                    return new $DataServiceQuery({ _entitySet: this.Roles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/Roles(" + "RoleID=" + $toODataString(RoleID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "IndicatorValues_SingleOrDefault", value: function (IndicatorValues_ID) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorValues },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorValues(" + "IndicatorValues_ID=" + $toODataString(IndicatorValues_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "MilestoneValues_SingleOrDefault", value: function (MilestoneValues_ID) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneValues },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestoneValues(" + "MilestoneValues_ID=" + $toODataString(MilestoneValues_ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "ActiveTypes_SingleOrDefault", value: function (ID) {
                    return new $DataServiceQuery({ _entitySet: this.ActiveTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ActiveTypes(" + "ID=" + $toODataString(ID, "Int32?") + ")"
                    );
                }
            },
            {
                name: "ActivitiesSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.Activities },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ActivitiesSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "ActiveTypesSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.ActiveTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ActiveTypesSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "IndicatorLocationsSorted", value: function (Area) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorLocations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorLocationsSorted()",
                        {
                            Area: $toODataString(Area, "String?")
                        });
                }
            },
            {
                name: "IndicatorsSorted", value: function (Code) {
                    return new $DataServiceQuery({ _entitySet: this.Indicators },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorsSorted()",
                        {
                            Code: $toODataString(Code, "String?")
                        });
                }
            },
            {
                name: "DatasourcesSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.DataSources },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DatasourcesSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "DataVersionLevelsSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.DataVersionLevels },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DataVersionLevelsSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "DataVersionsSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.DataVersions },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DataVersionsSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "IndicatorTypesSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorTypesSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "IndicatorValuesSorted", value: function (Title) {
                    return new $DataServiceQuery({ _entitySet: this.IndicatorValues },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/IndicatorValuesSorted()",
                        {
                            Title: $toODataString(Title, "String?")
                        });
                }
            },
            {
                name: "LocationsSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.Locations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/LocationsSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "LocationTypesSorted", value: function (Description) {
                    return new $DataServiceQuery({ _entitySet: this.LocationTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/LocationTypesSorted()",
                        {
                            Description: $toODataString(Description, "String?")
                        });
                }
            },
            {
                name: "MilestoneLocationsSorted", value: function (LongName) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneLocations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestoneLocationsSorted()",
                        {
                            LongName: $toODataString(LongName, "String?")
                        });
                }
            },
            {
                name: "MilestonesSorted", value: function (LongName) {
                    return new $DataServiceQuery({ _entitySet: this.Milestones },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestonesSorted()",
                        {
                            LongName: $toODataString(LongName, "String?")
                        });
                }
            },
            {
                name: "MilestoneTypesSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MilestoneTypesSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "MileStoneValuesSorted", value: function (ActualLabel) {
                    return new $DataServiceQuery({ _entitySet: this.MilestoneValues },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/MileStoneValuesSorted()",
                        {
                            ActualLabel: $toODataString(ActualLabel, "String?")
                        });
                }
            },
            {
                name: "OrganizationsSorted", value: function (Code) {
                    return new $DataServiceQuery({ _entitySet: this.Organizations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OrganizationsSorted()",
                        {
                            Code: $toODataString(Code, "String?")
                        });
                }
            },
            {
                name: "OrganizationTypesSorted", value: function (Description) {
                    return new $DataServiceQuery({ _entitySet: this.OrganizationTypes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OrganizationTypesSorted()",
                        {
                            Description: $toODataString(Description, "String?")
                        });
                }
            },
            {
                name: "OutcomeOrganizationsSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.OutcomeOrganizations },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutcomeOrganizationsSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "OutcomePersonRolesSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.OutcomePersonRoles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutcomePersonRolesSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "OutcomesSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.Outcomes },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutcomesSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "OutputPersonRolesSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.OutputPersonRoles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutputPersonRolesSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "OutputsSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.Outputs },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/OutputsSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "PeopleSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.People },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/PeopleSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "DimDateSorted", value: function () {
                    return new $DataServiceQuery({ _entitySet: this.DimDates },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/DimDateSorted()",
                        {
                        });
                }
            },
            {
                name: "ProjectsSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.Projects },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ProjectsSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            },
            {
                name: "ReportingPeriodsSorted", value: function (YearName) {
                    return new $DataServiceQuery({ _entitySet: this.ReportingPeriods },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/ReportingPeriodsSorted()",
                        {
                            YearName: $toODataString(YearName, "String?")
                        });
                }
            },
            {
                name: "RolesSorted", value: function (Name) {
                    return new $DataServiceQuery({ _entitySet: this.Roles },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/RolesSorted()",
                        {
                            Name: $toODataString(Name, "String?")
                        });
                }
            },
            {
                name: "SubOutputsSorted", value: function (ShortName) {
                    return new $DataServiceQuery({ _entitySet: this.SubOutputs },
                        lightSwitchApplication.rootUri + "/MeerkatData.svc" + "/SubOutputsSorted()",
                        {
                            ShortName: $toODataString(ShortName, "String?")
                        });
                }
            }
        ]),

        DataWorkspace: $defineDataWorkspace(DataWorkspace, [
            { name: "MeerkatData", type: MeerkatData }
        ])

    });

}(msls.application));
