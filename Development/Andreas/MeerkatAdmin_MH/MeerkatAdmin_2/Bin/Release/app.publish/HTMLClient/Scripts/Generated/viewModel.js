/// <reference path="data.js" />

(function (lightSwitchApplication) {

    var $Screen = msls.Screen,
        $defineScreen = msls._defineScreen,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString,
        $defineShowScreen = msls._defineShowScreen;

    function AdministrationHome(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AdministrationHome screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="details" type="msls.application.AdministrationHome.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AdministrationHome", parameters);
    }

    function BrowseActivities(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseActivities screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Activities" type="msls.VisualCollection" elementType="msls.application.Activity">
        /// Gets the activities for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseActivities.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseActivities", parameters);
    }

    function BrowseSubOutputs(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseSubOutputs screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="SubOutputs" type="msls.VisualCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputs for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseSubOutputs.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseSubOutputs", parameters);
    }

    function BrowseReportingPeriods(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseReportingPeriods screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="ReportingPeriods" type="msls.VisualCollection" elementType="msls.application.ReportingPeriod">
        /// Gets the reportingPeriods for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseReportingPeriods.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseReportingPeriods", parameters);
    }

    function BrowseProjects(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseProjects screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Projects" type="msls.VisualCollection" elementType="msls.application.Project">
        /// Gets the projects for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseProjects.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseProjects", parameters);
    }

    function BrowseOutputs(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseOutputs screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Outputs" type="msls.VisualCollection" elementType="msls.application.Output">
        /// Gets the outputs for this screen.
        /// </field>
        /// <field name="pOutcomeID" type="Number">
        /// Gets or sets the pOutcomeID for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseOutputs.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseOutputs", parameters);
    }

    function BrowseOutcomes(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseOutcomes screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Outcomes" type="msls.VisualCollection" elementType="msls.application.Outcome">
        /// Gets the outcomes for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseOutcomes.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseOutcomes", parameters);
    }

    function BrowseMilestones(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseMilestones screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Milestones" type="msls.VisualCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseMilestones.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseMilestones", parameters);
    }

    function BrowseMilestoneTypes(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseMilestoneTypes screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="MilestoneTypes" type="msls.VisualCollection" elementType="msls.application.MilestoneType">
        /// Gets the milestoneTypes for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseMilestoneTypes.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseMilestoneTypes", parameters);
    }

    function BrowseIndicatorTypes(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseIndicatorTypes screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="IndicatorTypes" type="msls.VisualCollection" elementType="msls.application.IndicatorType">
        /// Gets the indicatorTypes for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseIndicatorTypes.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseIndicatorTypes", parameters);
    }

    function BrowseIndicators(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseIndicators screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Indicators" type="msls.VisualCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseIndicators.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseIndicators", parameters);
    }

    function BrowseDataVersions(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDataVersions screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataVersions" type="msls.VisualCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersions for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDataVersions.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDataVersions", parameters);
    }

    function BrowseDataVersionLevels(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDataVersionLevels screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataVersionLevels" type="msls.VisualCollection" elementType="msls.application.DataVersionLevel">
        /// Gets the dataVersionLevels for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDataVersionLevels.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDataVersionLevels", parameters);
    }

    function BrowseDataSources(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseDataSources screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSources" type="msls.VisualCollection" elementType="msls.application.DataSource">
        /// Gets the dataSources for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseDataSources.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseDataSources", parameters);
    }

    function AddEditActivity(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditActivity screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Activity" type="msls.application.Activity">
        /// Gets or sets the activity for this screen.
        /// </field>
        /// <field name="Milestones" type="msls.VisualCollection" elementType="msls.application.Milestone">
        /// Gets the milestones for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditActivity.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditActivity", parameters);
    }

    function AddEditIndicator(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditIndicator screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Indicator" type="msls.application.Indicator">
        /// Gets or sets the indicator for this screen.
        /// </field>
        /// <field name="IndicatorLocations" type="msls.VisualCollection" elementType="msls.application.IndicatorLocation">
        /// Gets the indicatorLocations for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditIndicator.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditIndicator", parameters);
    }

    function AddEditMilestone(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditMilestone screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Milestone" type="msls.application.Milestone">
        /// Gets or sets the milestone for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditMilestone.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditMilestone", parameters);
    }

    function AddEditOutcome(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditOutcome screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Outcome" type="msls.application.Outcome">
        /// Gets or sets the outcome for this screen.
        /// </field>
        /// <field name="Outputs" type="msls.VisualCollection" elementType="msls.application.Output">
        /// Gets the outputs for this screen.
        /// </field>
        /// <field name="Projects" type="msls.VisualCollection" elementType="msls.application.Project">
        /// Gets the projects for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditOutcome.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditOutcome", parameters);
    }

    function AddEditOutput(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditOutput screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Output" type="msls.application.Output">
        /// Gets or sets the output for this screen.
        /// </field>
        /// <field name="SubOutputs" type="msls.VisualCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputs for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditOutput.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditOutput", parameters);
    }

    function AddEditProject(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditProject screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="Project" type="msls.application.Project">
        /// Gets or sets the project for this screen.
        /// </field>
        /// <field name="Activities" type="msls.VisualCollection" elementType="msls.application.Activity">
        /// Gets the activities for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditProject.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditProject", parameters);
    }

    function AddEditSubOutput(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditSubOutput screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="SubOutput" type="msls.application.SubOutput">
        /// Gets or sets the subOutput for this screen.
        /// </field>
        /// <field name="Indicators" type="msls.VisualCollection" elementType="msls.application.Indicator">
        /// Gets the indicators for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditSubOutput.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditSubOutput", parameters);
    }

    function AddEditIndicatorLocation(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditIndicatorLocation screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="IndicatorLocation" type="msls.application.IndicatorLocation">
        /// Gets or sets the indicatorLocation for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditIndicatorLocation.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditIndicatorLocation", parameters);
    }

    function AddEditDataSource(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDataSource screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataSource" type="msls.application.DataSource">
        /// Gets or sets the dataSource for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDataSource.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDataSource", parameters);
    }

    function AddEditDataVersionLevel(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDataVersionLevel screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataVersionLevel" type="msls.application.DataVersionLevel">
        /// Gets or sets the dataVersionLevel for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDataVersionLevel.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDataVersionLevel", parameters);
    }

    function AddEditDataVersion(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditDataVersion screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="DataVersion" type="msls.application.DataVersion">
        /// Gets or sets the dataVersion for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditDataVersion.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditDataVersion", parameters);
    }

    function AddEditIndicatorType(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditIndicatorType screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="IndicatorType" type="msls.application.IndicatorType">
        /// Gets or sets the indicatorType for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditIndicatorType.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditIndicatorType", parameters);
    }

    msls._addToNamespace("msls.application", {

        AdministrationHome: $defineScreen(AdministrationHome, [
        ], [
        ]),

        BrowseActivities: $defineScreen(BrowseActivities, [
            {
                name: "Activities", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Activities.filter("ActiveType/ID ge 0").expand("Project").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseSubOutputs: $defineScreen(BrowseSubOutputs, [
            {
                name: "SubOutputs", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.SubOutputs.filter("ActiveType/ID ge 0").expand("Output").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseReportingPeriods: $defineScreen(BrowseReportingPeriods, [
            {
                name: "ReportingPeriods", kind: "collection", elementType: lightSwitchApplication.ReportingPeriod,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.ReportingPeriods.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseProjects: $defineScreen(BrowseProjects, [
            {
                name: "Projects", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Projects.filter("ActiveType/ID ge 0").expand("Outcome").expand("Project1").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseOutputs: $defineScreen(BrowseOutputs, [
            {
                name: "Outputs", kind: "collection", elementType: lightSwitchApplication.Output,
                createQuery: function (OutcomeID) {
                    return this.dataWorkspace.MeerkatData.Outputs.filter("(ActiveType/ID ge 0) and " + ((OutcomeID === undefined || OutcomeID === null) ? "true" : "(Outcome/OutcomeID eq " + $toODataString(OutcomeID, "Int32?") + ")") + "").expand("Outcome").expand("ActiveType");
                }
            },
            { name: "pOutcomeID", kind: "local", type: Number }
        ], [
        ]),

        BrowseOutcomes: $defineScreen(BrowseOutcomes, [
            {
                name: "Outcomes", kind: "collection", elementType: lightSwitchApplication.Outcome,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Outcomes.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
            { name: "BrowseRelatedOutputs" }
        ]),

        BrowseMilestones: $defineScreen(BrowseMilestones, [
            {
                name: "Milestones", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Milestones.filter("ActiveType/ID ge 0").expand("Activity").expand("MilestoneType").expand("Outcome").expand("Project").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseMilestoneTypes: $defineScreen(BrowseMilestoneTypes, [
            {
                name: "MilestoneTypes", kind: "collection", elementType: lightSwitchApplication.MilestoneType,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.MilestoneTypes.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseIndicatorTypes: $defineScreen(BrowseIndicatorTypes, [
            {
                name: "IndicatorTypes", kind: "collection", elementType: lightSwitchApplication.IndicatorType,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.IndicatorTypes.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseIndicators: $defineScreen(BrowseIndicators, [
            {
                name: "Indicators", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Indicators.filter("ActiveType/ID ge 0").expand("Activity").expand("IndicatorType").expand("Outcome").expand("Output").expand("SubOutput").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseDataVersions: $defineScreen(BrowseDataVersions, [
            {
                name: "DataVersions", kind: "collection", elementType: lightSwitchApplication.DataVersion,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataVersions.filter("ActiveType/ID ge 0").expand("DataVersion1").expand("DataVersionLevel").expand("Outcome").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseDataVersionLevels: $defineScreen(BrowseDataVersionLevels, [
            {
                name: "DataVersionLevels", kind: "collection", elementType: lightSwitchApplication.DataVersionLevel,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataVersionLevels.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
        ]),

        BrowseDataSources: $defineScreen(BrowseDataSources, [
            {
                name: "DataSources", kind: "collection", elementType: lightSwitchApplication.DataSource,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataSources.filter("ActiveType/ID ge 0").expand("ActiveType");
                }
            }
        ], [
        ]),

        AddEditActivity: $defineScreen(AddEditActivity, [
            { name: "Activity", kind: "local", type: lightSwitchApplication.Activity },
            {
                name: "Milestones", kind: "collection", elementType: lightSwitchApplication.Milestone,
                getNavigationProperty: function () {
                    if (this.owner.Activity) {
                        return this.owner.Activity.details.properties.Milestones;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("MilestoneType").expand("Outcome").expand("Project").expand("ActiveType");
                }
            }
        ], [
            { name: "Activity_Delete" }
        ]),

        AddEditIndicator: $defineScreen(AddEditIndicator, [
            { name: "Indicator", kind: "local", type: lightSwitchApplication.Indicator },
            {
                name: "IndicatorLocations", kind: "collection", elementType: lightSwitchApplication.IndicatorLocation,
                getNavigationProperty: function () {
                    if (this.owner.Indicator) {
                        return this.owner.Indicator.details.properties.IndicatorLocations;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("Location").expand("ActiveType");
                }
            }
        ], [
            { name: "Indicator_Delete" }
        ]),

        AddEditMilestone: $defineScreen(AddEditMilestone, [
            { name: "Milestone", kind: "local", type: lightSwitchApplication.Milestone }
        ], [
            { name: "Milestone_Delete" }
        ]),

        AddEditOutcome: $defineScreen(AddEditOutcome, [
            { name: "Outcome", kind: "local", type: lightSwitchApplication.Outcome },
            {
                name: "Outputs", kind: "collection", elementType: lightSwitchApplication.Output,
                getNavigationProperty: function () {
                    if (this.owner.Outcome) {
                        return this.owner.Outcome.details.properties.Outputs;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("ActiveType");
                }
            },
            {
                name: "Projects", kind: "collection", elementType: lightSwitchApplication.Project,
                getNavigationProperty: function () {
                    if (this.owner.Outcome) {
                        return this.owner.Outcome.details.properties.Projects;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("Project1").expand("ActiveType");
                }
            }
        ], [
            { name: "Outcome_Delete" }
        ]),

        AddEditOutput: $defineScreen(AddEditOutput, [
            { name: "Output", kind: "local", type: lightSwitchApplication.Output },
            {
                name: "SubOutputs", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                getNavigationProperty: function () {
                    if (this.owner.Output) {
                        return this.owner.Output.details.properties.SubOutputs;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("ActiveType");
                }
            }
        ], [
            { name: "Output_Delete" }
        ]),

        AddEditProject: $defineScreen(AddEditProject, [
            { name: "Project", kind: "local", type: lightSwitchApplication.Project },
            {
                name: "Activities", kind: "collection", elementType: lightSwitchApplication.Activity,
                getNavigationProperty: function () {
                    if (this.owner.Project) {
                        return this.owner.Project.details.properties.Activities;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("ActiveType");
                }
            }
        ], [
            { name: "Project_Delete" }
        ]),

        AddEditSubOutput: $defineScreen(AddEditSubOutput, [
            { name: "SubOutput", kind: "local", type: lightSwitchApplication.SubOutput },
            {
                name: "Indicators", kind: "collection", elementType: lightSwitchApplication.Indicator,
                getNavigationProperty: function () {
                    if (this.owner.SubOutput) {
                        return this.owner.SubOutput.details.properties.Indicators;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("Activity").expand("IndicatorType").expand("Outcome").expand("Output").expand("SubOutput").expand("ActiveType");
                }
            }
        ], [
            { name: "Project_Delete" },
            { name: "SubOutput_Delete" }
        ]),

        AddEditIndicatorLocation: $defineScreen(AddEditIndicatorLocation, [
            { name: "IndicatorLocation", kind: "local", type: lightSwitchApplication.IndicatorLocation }
        ], [
            { name: "IndicatorLocation_delete" }
        ]),

        AddEditDataSource: $defineScreen(AddEditDataSource, [
            { name: "DataSource", kind: "local", type: lightSwitchApplication.DataSource }
        ], [
            { name: "DataSource_Delete" }
        ]),

        AddEditDataVersionLevel: $defineScreen(AddEditDataVersionLevel, [
            { name: "DataVersionLevel", kind: "local", type: lightSwitchApplication.DataVersionLevel }
        ], [
            { name: "DataVersionLevel_delete" }
        ]),

        AddEditDataVersion: $defineScreen(AddEditDataVersion, [
            { name: "DataVersion", kind: "local", type: lightSwitchApplication.DataVersion }
        ], [
            { name: "DataVersion_delete" }
        ]),

        AddEditIndicatorType: $defineScreen(AddEditIndicatorType, [
            { name: "IndicatorType", kind: "local", type: lightSwitchApplication.IndicatorType }
        ], [
            { name: "IndicatorType_delete" }
        ]),

        showAdministrationHome: $defineShowScreen(function showAdministrationHome(options) {
            /// <summary>
            /// Asynchronously navigates forward to the AdministrationHome screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("AdministrationHome", parameters, options);
        }),

        showBrowseActivities: $defineShowScreen(function showBrowseActivities(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseActivities screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseActivities", parameters, options);
        }),

        showBrowseSubOutputs: $defineShowScreen(function showBrowseSubOutputs(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseSubOutputs screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseSubOutputs", parameters, options);
        }),

        showBrowseReportingPeriods: $defineShowScreen(function showBrowseReportingPeriods(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseReportingPeriods screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseReportingPeriods", parameters, options);
        }),

        showBrowseProjects: $defineShowScreen(function showBrowseProjects(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseProjects screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseProjects", parameters, options);
        }),

        showBrowseOutputs: $defineShowScreen(function showBrowseOutputs(pOutcomeID, options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseOutputs screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("BrowseOutputs", parameters, options);
        }),

        showBrowseOutcomes: $defineShowScreen(function showBrowseOutcomes(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseOutcomes screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseOutcomes", parameters, options);
        }),

        showBrowseMilestones: $defineShowScreen(function showBrowseMilestones(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseMilestones screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseMilestones", parameters, options);
        }),

        showBrowseMilestoneTypes: $defineShowScreen(function showBrowseMilestoneTypes(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseMilestoneTypes screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseMilestoneTypes", parameters, options);
        }),

        showBrowseIndicatorTypes: $defineShowScreen(function showBrowseIndicatorTypes(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseIndicatorTypes screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseIndicatorTypes", parameters, options);
        }),

        showBrowseIndicators: $defineShowScreen(function showBrowseIndicators(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseIndicators screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseIndicators", parameters, options);
        }),

        showBrowseDataVersions: $defineShowScreen(function showBrowseDataVersions(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDataVersions screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDataVersions", parameters, options);
        }),

        showBrowseDataVersionLevels: $defineShowScreen(function showBrowseDataVersionLevels(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDataVersionLevels screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDataVersionLevels", parameters, options);
        }),

        showBrowseDataSources: $defineShowScreen(function showBrowseDataSources(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseDataSources screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseDataSources", parameters, options);
        }),

        showAddEditActivity: $defineShowScreen(function showAddEditActivity(Activity, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditActivity screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditActivity", parameters, options);
        }),

        showAddEditIndicator: $defineShowScreen(function showAddEditIndicator(Indicator, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditIndicator screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditIndicator", parameters, options);
        }),

        showAddEditMilestone: $defineShowScreen(function showAddEditMilestone(Milestone, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditMilestone screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditMilestone", parameters, options);
        }),

        showAddEditOutcome: $defineShowScreen(function showAddEditOutcome(Outcome, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditOutcome screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditOutcome", parameters, options);
        }),

        showAddEditOutput: $defineShowScreen(function showAddEditOutput(Output, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditOutput screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditOutput", parameters, options);
        }),

        showAddEditProject: $defineShowScreen(function showAddEditProject(Project, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditProject screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditProject", parameters, options);
        }),

        showAddEditSubOutput: $defineShowScreen(function showAddEditSubOutput(SubOutput, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditSubOutput screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditSubOutput", parameters, options);
        }),

        showAddEditIndicatorLocation: $defineShowScreen(function showAddEditIndicatorLocation(IndicatorLocation, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditIndicatorLocation screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditIndicatorLocation", parameters, options);
        }),

        showAddEditDataSource: $defineShowScreen(function showAddEditDataSource(DataSource, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDataSource screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDataSource", parameters, options);
        }),

        showAddEditDataVersionLevel: $defineShowScreen(function showAddEditDataVersionLevel(DataVersionLevel, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDataVersionLevel screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDataVersionLevel", parameters, options);
        }),

        showAddEditDataVersion: $defineShowScreen(function showAddEditDataVersion(DataVersion, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditDataVersion screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditDataVersion", parameters, options);
        }),

        showAddEditIndicatorType: $defineShowScreen(function showAddEditIndicatorType(IndicatorType, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditIndicatorType screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditIndicatorType", parameters, options);
        })

    });

}(msls.application));
