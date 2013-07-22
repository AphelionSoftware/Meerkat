/// <reference path="data.js" />

(function (lightSwitchApplication) {

    msls._addEntryPoints(lightSwitchApplication.Activity, {
        /// <field>
        /// Called when a new activity is created.
        /// <br/>created(msls.application.Activity entity)
        /// </field>
        created: [lightSwitchApplication.Activity]
    });

    msls._addEntryPoints(lightSwitchApplication.Indicator, {
        /// <field>
        /// Called when a new indicator is created.
        /// <br/>created(msls.application.Indicator entity)
        /// </field>
        created: [lightSwitchApplication.Indicator]
    });

    msls._addEntryPoints(lightSwitchApplication.IndicatorLocation, {
        /// <field>
        /// Called when a new indicatorLocation is created.
        /// <br/>created(msls.application.IndicatorLocation entity)
        /// </field>
        created: [lightSwitchApplication.IndicatorLocation]
    });

    msls._addEntryPoints(lightSwitchApplication.IndicatorType, {
        /// <field>
        /// Called when a new indicatorType is created.
        /// <br/>created(msls.application.IndicatorType entity)
        /// </field>
        created: [lightSwitchApplication.IndicatorType]
    });

    msls._addEntryPoints(lightSwitchApplication.Milestone, {
        /// <field>
        /// Called when a new milestone is created.
        /// <br/>created(msls.application.Milestone entity)
        /// </field>
        created: [lightSwitchApplication.Milestone]
    });

    msls._addEntryPoints(lightSwitchApplication.MilestoneLocation, {
        /// <field>
        /// Called when a new milestoneLocation is created.
        /// <br/>created(msls.application.MilestoneLocation entity)
        /// </field>
        created: [lightSwitchApplication.MilestoneLocation]
    });

    msls._addEntryPoints(lightSwitchApplication.MilestoneType, {
        /// <field>
        /// Called when a new milestoneType is created.
        /// <br/>created(msls.application.MilestoneType entity)
        /// </field>
        created: [lightSwitchApplication.MilestoneType]
    });

    msls._addEntryPoints(lightSwitchApplication.Outcome, {
        /// <field>
        /// Called when a new outcome is created.
        /// <br/>created(msls.application.Outcome entity)
        /// </field>
        created: [lightSwitchApplication.Outcome]
    });

    msls._addEntryPoints(lightSwitchApplication.OutcomeOrganization, {
        /// <field>
        /// Called when a new outcomeOrganization is created.
        /// <br/>created(msls.application.OutcomeOrganization entity)
        /// </field>
        created: [lightSwitchApplication.OutcomeOrganization]
    });

    msls._addEntryPoints(lightSwitchApplication.OutcomePersonRole, {
        /// <field>
        /// Called when a new outcomePersonRole is created.
        /// <br/>created(msls.application.OutcomePersonRole entity)
        /// </field>
        created: [lightSwitchApplication.OutcomePersonRole]
    });

    msls._addEntryPoints(lightSwitchApplication.Output, {
        /// <field>
        /// Called when a new output is created.
        /// <br/>created(msls.application.Output entity)
        /// </field>
        created: [lightSwitchApplication.Output]
    });

    msls._addEntryPoints(lightSwitchApplication.OutputPersonRole, {
        /// <field>
        /// Called when a new outputPersonRole is created.
        /// <br/>created(msls.application.OutputPersonRole entity)
        /// </field>
        created: [lightSwitchApplication.OutputPersonRole]
    });

    msls._addEntryPoints(lightSwitchApplication.Project, {
        /// <field>
        /// Called when a new project is created.
        /// <br/>created(msls.application.Project entity)
        /// </field>
        created: [lightSwitchApplication.Project]
    });

    msls._addEntryPoints(lightSwitchApplication.SubOutput, {
        /// <field>
        /// Called when a new subOutput is created.
        /// <br/>created(msls.application.SubOutput entity)
        /// </field>
        created: [lightSwitchApplication.SubOutput]
    });

    msls._addEntryPoints(lightSwitchApplication.DataSource, {
        /// <field>
        /// Called when a new dataSource is created.
        /// <br/>created(msls.application.DataSource entity)
        /// </field>
        created: [lightSwitchApplication.DataSource]
    });

    msls._addEntryPoints(lightSwitchApplication.DataVersion, {
        /// <field>
        /// Called when a new dataVersion is created.
        /// <br/>created(msls.application.DataVersion entity)
        /// </field>
        created: [lightSwitchApplication.DataVersion]
    });

    msls._addEntryPoints(lightSwitchApplication.DataVersionLevel, {
        /// <field>
        /// Called when a new dataVersionLevel is created.
        /// <br/>created(msls.application.DataVersionLevel entity)
        /// </field>
        created: [lightSwitchApplication.DataVersionLevel]
    });

    msls._addEntryPoints(lightSwitchApplication.DimDate, {
        /// <field>
        /// Called when a new dimDate is created.
        /// <br/>created(msls.application.DimDate entity)
        /// </field>
        created: [lightSwitchApplication.DimDate]
    });

    msls._addEntryPoints(lightSwitchApplication.Location, {
        /// <field>
        /// Called when a new location is created.
        /// <br/>created(msls.application.Location entity)
        /// </field>
        created: [lightSwitchApplication.Location]
    });

    msls._addEntryPoints(lightSwitchApplication.LocationType, {
        /// <field>
        /// Called when a new locationType is created.
        /// <br/>created(msls.application.LocationType entity)
        /// </field>
        created: [lightSwitchApplication.LocationType]
    });

    msls._addEntryPoints(lightSwitchApplication.Organization, {
        /// <field>
        /// Called when a new organization is created.
        /// <br/>created(msls.application.Organization entity)
        /// </field>
        created: [lightSwitchApplication.Organization]
    });

    msls._addEntryPoints(lightSwitchApplication.OrganizationType, {
        /// <field>
        /// Called when a new organizationType is created.
        /// <br/>created(msls.application.OrganizationType entity)
        /// </field>
        created: [lightSwitchApplication.OrganizationType]
    });

    msls._addEntryPoints(lightSwitchApplication.Person, {
        /// <field>
        /// Called when a new person is created.
        /// <br/>created(msls.application.Person entity)
        /// </field>
        created: [lightSwitchApplication.Person]
    });

    msls._addEntryPoints(lightSwitchApplication.ReportingPeriod, {
        /// <field>
        /// Called when a new reportingPeriod is created.
        /// <br/>created(msls.application.ReportingPeriod entity)
        /// </field>
        created: [lightSwitchApplication.ReportingPeriod]
    });

    msls._addEntryPoints(lightSwitchApplication.Role, {
        /// <field>
        /// Called when a new role is created.
        /// <br/>created(msls.application.Role entity)
        /// </field>
        created: [lightSwitchApplication.Role]
    });

    msls._addEntryPoints(lightSwitchApplication.IndicatorValue, {
        /// <field>
        /// Called when a new indicatorValue is created.
        /// <br/>created(msls.application.IndicatorValue entity)
        /// </field>
        created: [lightSwitchApplication.IndicatorValue]
    });

    msls._addEntryPoints(lightSwitchApplication.MilestoneValue, {
        /// <field>
        /// Called when a new milestoneValue is created.
        /// <br/>created(msls.application.MilestoneValue entity)
        /// </field>
        created: [lightSwitchApplication.MilestoneValue]
    });

    msls._addEntryPoints(lightSwitchApplication.ActiveType, {
        /// <field>
        /// Called when a new activeType is created.
        /// <br/>created(msls.application.ActiveType entity)
        /// </field>
        created: [lightSwitchApplication.ActiveType]
    });

}(msls.application));
