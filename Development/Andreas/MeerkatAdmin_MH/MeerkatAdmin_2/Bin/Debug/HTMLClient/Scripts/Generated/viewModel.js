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
        /// <field name="ActivitiesSorted" type="msls.VisualCollection" elementType="msls.application.Activity">
        /// Gets the activitiesSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="ActivityShortName" type="String">
        /// Gets or sets the activityShortName for this screen.
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
        /// <field name="SubOutputsSorted" type="msls.VisualCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputsSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
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
        /// <field name="ReportingPeriodsSorted" type="msls.VisualCollection" elementType="msls.application.ReportingPeriod">
        /// Gets the reportingPeriodsSorted for this screen.
        /// </field>
        /// <field name="YearName" type="String">
        /// Gets or sets the yearName for this screen.
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
        /// <field name="ProjectsSorted" type="msls.VisualCollection" elementType="msls.application.Project">
        /// Gets the projectsSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
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
        /// <field name="pOutcomeID" type="Number">
        /// Gets or sets the pOutcomeID for this screen.
        /// </field>
        /// <field name="OutputsSorted" type="msls.VisualCollection" elementType="msls.application.Output">
        /// Gets the outputsSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
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
        /// <field name="OutcomesSorted" type="msls.VisualCollection" elementType="msls.application.Outcome">
        /// Gets the outcomesSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="OutcomeShortName" type="String">
        /// Gets or sets the outcomeShortName for this screen.
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
        /// <field name="MilestonesSorted" type="msls.VisualCollection" elementType="msls.application.Milestone">
        /// Gets the milestonesSorted for this screen.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this screen.
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
        /// <field name="MilestoneTypesSorted" type="msls.VisualCollection" elementType="msls.application.MilestoneType">
        /// Gets the milestoneTypesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="IndicatorTypesSorted" type="msls.VisualCollection" elementType="msls.application.IndicatorType">
        /// Gets the indicatorTypesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="IndicatorsSorted" type="msls.VisualCollection" elementType="msls.application.Indicator">
        /// Gets the indicatorsSorted for this screen.
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
        /// <field name="DataVersionsSorted" type="msls.VisualCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersionsSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="DataVersionLevelsSorted" type="msls.VisualCollection" elementType="msls.application.DataVersionLevel">
        /// Gets the dataVersionLevelsSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="DatasourcesSorted" type="msls.VisualCollection" elementType="msls.application.DataSource">
        /// Gets the datasourcesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="MilestonesSorted" type="msls.VisualCollection" elementType="msls.application.Milestone">
        /// Gets the milestonesSorted for this screen.
        /// </field>
        /// <field name="LongName" type="String">
        /// Gets or sets the longName for this screen.
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
        /// <field name="IndicatorLocationsSorted" type="msls.VisualCollection" elementType="msls.application.IndicatorLocation">
        /// Gets the indicatorLocationsSorted for this screen.
        /// </field>
        /// <field name="Area" type="String">
        /// Gets or sets the area for this screen.
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
        /// <field name="OutputsSorted" type="msls.VisualCollection" elementType="msls.application.Output">
        /// Gets the outputsSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="ProjectsSorted" type="msls.VisualCollection" elementType="msls.application.Project">
        /// Gets the projectsSorted for this screen.
        /// </field>
        /// <field name="ShortName1" type="String">
        /// Gets or sets the shortName1 for this screen.
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
        /// <field name="SubOutputsSorted" type="msls.VisualCollection" elementType="msls.application.SubOutput">
        /// Gets the subOutputsSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
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
        /// <field name="ActiveTypesSorted" type="msls.VisualCollection" elementType="msls.application.ActiveType">
        /// Gets the activeTypesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
        /// </field>
        /// <field name="ActivitiesSorted" type="msls.VisualCollection" elementType="msls.application.Activity">
        /// Gets the activitiesSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
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
        /// <field name="IndicatorsSorted" type="msls.VisualCollection" elementType="msls.application.Indicator">
        /// Gets the indicatorsSorted for this screen.
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
        /// <field name="ActiveTypesSorted" type="msls.VisualCollection" elementType="msls.application.ActiveType">
        /// Gets the activeTypesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="ActiveTypesSorted" type="msls.VisualCollection" elementType="msls.application.ActiveType">
        /// Gets the activeTypesSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
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
        /// <field name="DataVersionsSorted" type="msls.VisualCollection" elementType="msls.application.DataVersion">
        /// Gets the dataVersionsSorted for this screen.
        /// </field>
        /// <field name="Name" type="String">
        /// Gets or sets the name for this screen.
        /// </field>
        /// <field name="DataVersionLevelsSorted" type="msls.VisualCollection" elementType="msls.application.DataVersionLevel">
        /// Gets the dataVersionLevelsSorted for this screen.
        /// </field>
        /// <field name="Name1" type="String">
        /// Gets or sets the name1 for this screen.
        /// </field>
        /// <field name="OutcomesSorted" type="msls.VisualCollection" elementType="msls.application.Outcome">
        /// Gets the outcomesSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="ActivitiesSorted" type="msls.VisualCollection" elementType="msls.application.Activity">
        /// Gets the activitiesSorted for this screen.
        /// </field>
        /// <field name="ShortName1" type="String">
        /// Gets or sets the shortName1 for this screen.
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

    function AddEditMilestoneType(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditMilestoneType screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="MilestoneType" type="msls.application.MilestoneType">
        /// Gets or sets the milestoneType for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditMilestoneType.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditMilestoneType", parameters);
    }

    function AddEditReportingPeriod(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditReportingPeriod screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="ReportingPeriod" type="msls.application.ReportingPeriod">
        /// Gets or sets the reportingPeriod for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditReportingPeriod.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditReportingPeriod", parameters);
    }

    msls._addToNamespace("msls.application", {

        AdministrationHome: $defineScreen(AdministrationHome, [
        ], [
        ]),

        BrowseActivities: $defineScreen(BrowseActivities, [
            {
                name: "Activities", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ActivitiesSorted(ShortName);
                }
            },
            {
                name: "ActivitiesSorted", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ActivitiesSorted(ShortName).expand("Project").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String },
            { name: "ActivityShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseSubOutputs: $defineScreen(BrowseSubOutputs, [
            {
                name: "SubOutputs", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.SubOutputs.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "SubOutputsSorted", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.SubOutputsSorted(ShortName).expand("Output").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseReportingPeriods: $defineScreen(BrowseReportingPeriods, [
            {
                name: "ReportingPeriods", kind: "collection", elementType: lightSwitchApplication.ReportingPeriod,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.ReportingPeriods.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "ReportingPeriodsSorted", kind: "collection", elementType: lightSwitchApplication.ReportingPeriod,
                createQuery: function (YearName) {
                    return this.dataWorkspace.MeerkatData.ReportingPeriodsSorted(YearName);
                }
            },
            { name: "YearName", kind: "local", type: String }
        ], [
        ]),

        BrowseProjects: $defineScreen(BrowseProjects, [
            {
                name: "Projects", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Projects.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "ProjectsSorted", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ProjectsSorted(ShortName).expand("Outcome").expand("Project1").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseOutputs: $defineScreen(BrowseOutputs, [
            { name: "pOutcomeID", kind: "local", type: Number },
            {
                name: "OutputsSorted", kind: "collection", elementType: lightSwitchApplication.Output,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutputsSorted(ShortName).expand("Outcome").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseOutcomes: $defineScreen(BrowseOutcomes, [
            {
                name: "OutcomesSorted", kind: "collection", elementType: lightSwitchApplication.Outcome,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutcomesSorted(ShortName).expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String },
            { name: "OutcomeShortName", kind: "local", type: String }
        ], [
            { name: "BrowseRelatedOutputs" }
        ]),

        BrowseMilestones: $defineScreen(BrowseMilestones, [
            {
                name: "Milestones", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Milestones.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "MilestonesSorted", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function (LongName) {
                    return this.dataWorkspace.MeerkatData.MilestonesSorted(LongName).expand("Activity").expand("MilestoneType").expand("Outcome").expand("Project").expand("ActiveType");
                }
            },
            { name: "LongName", kind: "local", type: String }
        ], [
        ]),

        BrowseMilestoneTypes: $defineScreen(BrowseMilestoneTypes, [
            {
                name: "MilestoneTypes", kind: "collection", elementType: lightSwitchApplication.MilestoneType,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.MilestoneTypes.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "MilestoneTypesSorted", kind: "collection", elementType: lightSwitchApplication.MilestoneType,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.MilestoneTypesSorted(Name).expand("ActiveType");
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
        ]),

        BrowseIndicatorTypes: $defineScreen(BrowseIndicatorTypes, [
            {
                name: "IndicatorTypes", kind: "collection", elementType: lightSwitchApplication.IndicatorType,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.IndicatorTypes.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "IndicatorTypesSorted", kind: "collection", elementType: lightSwitchApplication.IndicatorType,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.IndicatorTypesSorted(Name).expand("ActiveType");
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
        ]),

        BrowseIndicators: $defineScreen(BrowseIndicators, [
            {
                name: "Indicators", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Indicators.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "IndicatorsSorted", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function (Code) {
                    return this.dataWorkspace.MeerkatData.IndicatorsSorted(Code);
                }
            }
        ], [
        ]),

        BrowseDataVersions: $defineScreen(BrowseDataVersions, [
            {
                name: "DataVersions", kind: "collection", elementType: lightSwitchApplication.DataVersion,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataVersions.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "DataVersionsSorted", kind: "collection", elementType: lightSwitchApplication.DataVersion,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.DataVersionsSorted(Name).expand("DataVersion1").expand("DataVersionLevel").expand("Outcome").expand("ActiveType");
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
        ]),

        BrowseDataVersionLevels: $defineScreen(BrowseDataVersionLevels, [
            {
                name: "DataVersionLevels", kind: "collection", elementType: lightSwitchApplication.DataVersionLevel,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataVersionLevels.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "DataVersionLevelsSorted", kind: "collection", elementType: lightSwitchApplication.DataVersionLevel,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.DataVersionLevelsSorted(Name).expand("ActiveType");
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
        ]),

        BrowseDataSources: $defineScreen(BrowseDataSources, [
            {
                name: "DataSources", kind: "collection", elementType: lightSwitchApplication.DataSource,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.DataSources.filter("ActiveType/ID ge 0");
                }
            },
            {
                name: "DatasourcesSorted", kind: "collection", elementType: lightSwitchApplication.DataSource,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.DatasourcesSorted(Name);
                }
            },
            { name: "Name", kind: "local", type: String }
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
                    return this;
                }
            },
            {
                name: "MilestonesSorted", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function (LongName) {
                    return this.dataWorkspace.MeerkatData.MilestonesSorted(LongName);
                }
            },
            { name: "LongName", kind: "local", type: String }
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
                    return this;
                }
            },
            {
                name: "IndicatorLocationsSorted", kind: "collection", elementType: lightSwitchApplication.IndicatorLocation,
                createQuery: function (Area) {
                    return this.dataWorkspace.MeerkatData.IndicatorLocationsSorted(Area).expand("Indicator").expand("Location").expand("ActiveType");
                }
            },
            { name: "Area", kind: "local", type: String }
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
                    return this;
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
                    return this;
                }
            },
            {
                name: "OutputsSorted", kind: "collection", elementType: lightSwitchApplication.Output,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutputsSorted(ShortName).expand("Outcome").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String },
            {
                name: "ProjectsSorted", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ProjectsSorted(ShortName).expand("Outcome").expand("Project1").expand("ActiveType");
                }
            },
            { name: "ShortName1", kind: "local", type: String }
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
                    return this;
                }
            },
            {
                name: "SubOutputsSorted", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.SubOutputsSorted(ShortName).expand("Output").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
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
                    return this;
                }
            },
            {
                name: "ActiveTypesSorted", kind: "collection", elementType: lightSwitchApplication.ActiveType,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.ActiveTypesSorted(Name);
                }
            },
            { name: "Name", kind: "local", type: String },
            {
                name: "ActivitiesSorted", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ActivitiesSorted(ShortName).expand("Project").expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
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
                    return this;
                }
            },
            {
                name: "IndicatorsSorted", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function (Code) {
                    return this.dataWorkspace.MeerkatData.IndicatorsSorted(Code).expand("Activity").expand("IndicatorType").expand("Outcome").expand("Output").expand("SubOutput").expand("ActiveType");
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
            { name: "DataSource", kind: "local", type: lightSwitchApplication.DataSource },
            {
                name: "ActiveTypesSorted", kind: "collection", elementType: lightSwitchApplication.ActiveType,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.ActiveTypesSorted(Name);
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
            { name: "DataSource_Delete" }
        ]),

        AddEditDataVersionLevel: $defineScreen(AddEditDataVersionLevel, [
            { name: "DataVersionLevel", kind: "local", type: lightSwitchApplication.DataVersionLevel },
            {
                name: "ActiveTypesSorted", kind: "collection", elementType: lightSwitchApplication.ActiveType,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.ActiveTypesSorted(Name);
                }
            },
            { name: "Name", kind: "local", type: String }
        ], [
            { name: "DataVersionLevel_delete" }
        ]),

        AddEditDataVersion: $defineScreen(AddEditDataVersion, [
            { name: "DataVersion", kind: "local", type: lightSwitchApplication.DataVersion },
            {
                name: "DataVersionsSorted", kind: "collection", elementType: lightSwitchApplication.DataVersion,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.DataVersionsSorted(Name);
                }
            },
            { name: "Name", kind: "local", type: String },
            {
                name: "DataVersionLevelsSorted", kind: "collection", elementType: lightSwitchApplication.DataVersionLevel,
                createQuery: function (Name) {
                    return this.dataWorkspace.MeerkatData.DataVersionLevelsSorted(Name);
                }
            },
            { name: "Name1", kind: "local", type: String },
            {
                name: "OutcomesSorted", kind: "collection", elementType: lightSwitchApplication.Outcome,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutcomesSorted(ShortName);
                }
            },
            { name: "ShortName", kind: "local", type: String },
            {
                name: "ActivitiesSorted", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ActivitiesSorted(ShortName);
                }
            },
            { name: "ShortName1", kind: "local", type: String }
        ], [
            { name: "DataVersion_delete" }
        ]),

        AddEditIndicatorType: $defineScreen(AddEditIndicatorType, [
            { name: "IndicatorType", kind: "local", type: lightSwitchApplication.IndicatorType }
        ], [
            { name: "IndicatorType_delete" }
        ]),

        AddEditMilestoneType: $defineScreen(AddEditMilestoneType, [
            { name: "MilestoneType", kind: "local", type: lightSwitchApplication.MilestoneType }
        ], [
        ]),

        AddEditReportingPeriod: $defineScreen(AddEditReportingPeriod, [
            { name: "ReportingPeriod", kind: "local", type: lightSwitchApplication.ReportingPeriod }
        ], [
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
        }),

        showAddEditMilestoneType: $defineShowScreen(function showAddEditMilestoneType(MilestoneType, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditMilestoneType screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditMilestoneType", parameters, options);
        }),

        showAddEditReportingPeriod: $defineShowScreen(function showAddEditReportingPeriod(ReportingPeriod, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditReportingPeriod screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditReportingPeriod", parameters, options);
        })

    });

}(msls.application));
