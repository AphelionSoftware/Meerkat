/// <reference path="data.js" />

(function (lightSwitchApplication) {

    var $Screen = msls.Screen,
        $defineScreen = msls._defineScreen,
        $DataServiceQuery = msls.DataServiceQuery,
        $toODataString = msls._toODataString,
        $defineShowScreen = msls._defineShowScreen;

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
        /// <field name="OutcomesSorted" type="msls.VisualCollection" elementType="msls.application.Outcome">
        /// Gets the outcomesSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseOutcomes.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseOutcomes", parameters);
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
        /// <field name="pOutput_ID" type="Number">
        /// Gets or sets the pOutput_ID for this screen.
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
        /// <field name="SubOutput_ID" type="Number">
        /// Gets or sets the subOutput_ID for this screen.
        /// </field>
        /// <field name="OutcomeID" type="Number">
        /// Gets or sets the outcomeID for this screen.
        /// </field>
        /// <field name="Output_ID" type="Number">
        /// Gets or sets the output_ID for this screen.
        /// </field>
        /// <field name="IndicatorSorted" type="msls.VisualCollection" elementType="msls.application.Indicator">
        /// Gets the indicatorSorted for this screen.
        /// </field>
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseIndicators.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseIndicators", parameters);
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
        /// <field name="details" type="msls.application.BrowseActivities.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseActivities", parameters);
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
        /// <field name="ShortName" type="String">
        /// Gets or sets the shortName for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseMilestones.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseMilestones", parameters);
    }

    function BrowseMilestoneValues(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseMilestoneValues screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="MilestoneValues" type="msls.VisualCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValues for this screen.
        /// </field>
        /// <field name="MilestoneValuesSorted" type="msls.VisualCollection" elementType="msls.application.MilestoneValue">
        /// Gets the milestoneValuesSorted for this screen.
        /// </field>
        /// <field name="ActualLabel" type="String">
        /// Gets or sets the actualLabel for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseMilestoneValues.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseMilestoneValues", parameters);
    }

    function BrowseIndicatorValues(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the BrowseIndicatorValues screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="IndicatorValues" type="msls.VisualCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this screen.
        /// </field>
        /// <field name="IndicatorValuesSorted" type="msls.VisualCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValuesSorted for this screen.
        /// </field>
        /// <field name="ActualLabel" type="String">
        /// Gets or sets the actualLabel for this screen.
        /// </field>
        /// <field name="details" type="msls.application.BrowseIndicatorValues.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "BrowseIndicatorValues", parameters);
    }

    function AddEditMilestoneValue(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditMilestoneValue screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="MilestoneValue" type="msls.application.MilestoneValue">
        /// Gets or sets the milestoneValue for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditMilestoneValue.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditMilestoneValue", parameters);
    }

    function AddEditIndicatorValue(parameters, dataWorkspace) {
        /// <summary>
        /// Represents the AddEditIndicatorValue screen.
        /// </summary>
        /// <param name="parameters" type="Array">
        /// An array of screen parameter values.
        /// </param>
        /// <param name="dataWorkspace" type="msls.application.DataWorkspace" optional="true">
        /// An existing data workspace for this screen to use. By default, a new data workspace is created.
        /// </param>
        /// <field name="IndicatorValue" type="msls.application.IndicatorValue">
        /// Gets or sets the indicatorValue for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditIndicatorValue.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditIndicatorValue", parameters);
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
        /// <field name="IndicatorValues" type="msls.VisualCollection" elementType="msls.application.IndicatorValue">
        /// Gets the indicatorValues for this screen.
        /// </field>
        /// <field name="details" type="msls.application.AddEditIndicator.Details">
        /// Gets the details for this screen.
        /// </field>
        if (!dataWorkspace) {
            dataWorkspace = new lightSwitchApplication.DataWorkspace();
        }
        $Screen.call(this, dataWorkspace, "AddEditIndicator", parameters);
    }

    msls._addToNamespace("msls.application", {

        BrowseOutcomes: $defineScreen(BrowseOutcomes, [
            {
                name: "Outcomes", kind: "collection", elementType: lightSwitchApplication.Outcome,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Outcomes;
                }
            },
            {
                name: "OutcomesSorted", kind: "collection", elementType: lightSwitchApplication.Outcome,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutcomesSorted(ShortName).expand("ActiveType");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
            { name: "ShowOutcomeIndicators_Tap" },
            { name: "ShowBrowseOutputs_Tap" }
        ]),

        BrowseOutputs: $defineScreen(BrowseOutputs, [
            {
                name: "Outputs", kind: "collection", elementType: lightSwitchApplication.Output,
                createQuery: function (OutcomeID) {
                    return this.dataWorkspace.MeerkatData.Outputs.filter("" + ((OutcomeID === undefined || OutcomeID === null) ? "false" : "(Outcome/OutcomeID eq " + $toODataString(OutcomeID, "Int32?") + ")") + "");
                }
            },
            { name: "pOutcomeID", kind: "local", type: Number },
            {
                name: "OutputsSorted", kind: "collection", elementType: lightSwitchApplication.Output,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.OutputsSorted(ShortName).expand("ActiveType").expand("Outcome");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseSubOutputs: $defineScreen(BrowseSubOutputs, [
            {
                name: "SubOutputs", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function (Output_ID) {
                    return this.dataWorkspace.MeerkatData.SubOutputs.filter("" + ((Output_ID === undefined || Output_ID === null) ? "false" : "(Output/Output_ID eq " + $toODataString(Output_ID, "Int32?") + ")") + "");
                }
            },
            { name: "pOutput_ID", kind: "local", type: Number },
            {
                name: "SubOutputsSorted", kind: "collection", elementType: lightSwitchApplication.SubOutput,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.SubOutputsSorted(ShortName).expand("ActiveType").expand("Output");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseIndicators: $defineScreen(BrowseIndicators, [
            {
                name: "Indicators", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function (SubOutput_ID, Output_ID, OutcomeID) {
                    return this.dataWorkspace.MeerkatData.Indicators.filter("(" + ((SubOutput_ID === undefined || SubOutput_ID === null) ? "false" : "(SubOutput/SubOutput_ID eq " + $toODataString(SubOutput_ID, "Int32?") + ")") + " and " + ((Output_ID === undefined || Output_ID === null) ? "false" : "(Output/Output_ID eq " + $toODataString(Output_ID, "Int32?") + ")") + ") and " + ((OutcomeID === undefined || OutcomeID === null) ? "false" : "(Outcome/OutcomeID eq " + $toODataString(OutcomeID, "Int32?") + ")") + "");
                }
            },
            { name: "SubOutput_ID", kind: "local", type: Number },
            { name: "OutcomeID", kind: "local", type: Number },
            { name: "Output_ID", kind: "local", type: Number },
            {
                name: "IndicatorSorted", kind: "collection", elementType: lightSwitchApplication.Indicator,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.IndicatorSorted(ShortName).expand("ActiveType").expand("Activity").expand("IndicatorType").expand("Outcome").expand("Output").expand("SubOutput");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseProjects: $defineScreen(BrowseProjects, [
            {
                name: "Projects", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Projects;
                }
            },
            {
                name: "ProjectsSorted", kind: "collection", elementType: lightSwitchApplication.Project,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ProjectsSorted(ShortName).expand("ActiveType").expand("Outcome").expand("Project1");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseActivities: $defineScreen(BrowseActivities, [
            {
                name: "Activities", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Activities;
                }
            },
            {
                name: "ActivitiesSorted", kind: "collection", elementType: lightSwitchApplication.Activity,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.ActivitiesSorted(ShortName);
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseMilestones: $defineScreen(BrowseMilestones, [
            {
                name: "Milestones", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.Milestones;
                }
            },
            {
                name: "MilestonesSorted", kind: "collection", elementType: lightSwitchApplication.Milestone,
                createQuery: function (ShortName) {
                    return this.dataWorkspace.MeerkatData.MilestonesSorted(ShortName).expand("ActiveType").expand("Activity").expand("MilestoneType").expand("Outcome").expand("Project");
                }
            },
            { name: "ShortName", kind: "local", type: String }
        ], [
        ]),

        BrowseMilestoneValues: $defineScreen(BrowseMilestoneValues, [
            {
                name: "MilestoneValues", kind: "collection", elementType: lightSwitchApplication.MilestoneValue,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.MilestoneValues;
                }
            },
            {
                name: "MilestoneValuesSorted", kind: "collection", elementType: lightSwitchApplication.MilestoneValue,
                createQuery: function (ActualLabel) {
                    return this.dataWorkspace.MeerkatData.MilestoneValuesSorted(ActualLabel).expand("ActiveType").expand("DataVersion").expand("Location").expand("Milestone").expand("ReportingPeriod").expand("Organization");
                }
            },
            { name: "ActualLabel", kind: "local", type: String }
        ], [
        ]),

        BrowseIndicatorValues: $defineScreen(BrowseIndicatorValues, [
            {
                name: "IndicatorValues", kind: "collection", elementType: lightSwitchApplication.IndicatorValue,
                createQuery: function () {
                    return this.dataWorkspace.MeerkatData.IndicatorValues;
                }
            },
            {
                name: "IndicatorValuesSorted", kind: "collection", elementType: lightSwitchApplication.IndicatorValue,
                createQuery: function (ActualLabel) {
                    return this.dataWorkspace.MeerkatData.IndicatorValuesSorted(ActualLabel).expand("ActiveType").expand("DataVersion").expand("Indicator").expand("Location").expand("Organization").expand("ReportingPeriod");
                }
            },
            { name: "ActualLabel", kind: "local", type: String }
        ], [
        ]),

        AddEditMilestoneValue: $defineScreen(AddEditMilestoneValue, [
            { name: "MilestoneValue", kind: "local", type: lightSwitchApplication.MilestoneValue }
        ], [
        ]),

        AddEditIndicatorValue: $defineScreen(AddEditIndicatorValue, [
            { name: "IndicatorValue", kind: "local", type: lightSwitchApplication.IndicatorValue }
        ], [
        ]),

        AddEditActivity: $defineScreen(AddEditActivity, [
            { name: "Activity", kind: "local", type: lightSwitchApplication.Activity }
        ], [
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
                    return this.expand("ActiveType").expand("Location");
                }
            },
            {
                name: "IndicatorValues", kind: "collection", elementType: lightSwitchApplication.IndicatorValue,
                getNavigationProperty: function () {
                    if (this.owner.Indicator) {
                        return this.owner.Indicator.details.properties.IndicatorValues;
                    }
                    return null;
                },
                appendQuery: function () {
                    return this.expand("ActiveType").expand("DataVersion").expand("Location").expand("Organization").expand("ReportingPeriod");
                }
            }
        ], [
        ]),

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

        showBrowseSubOutputs: $defineShowScreen(function showBrowseSubOutputs(pOutput_ID, options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseSubOutputs screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("BrowseSubOutputs", parameters, options);
        }),

        showBrowseIndicators: $defineShowScreen(function showBrowseIndicators(SubOutput_ID, OutcomeID, Output_ID, options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseIndicators screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 3);
            return lightSwitchApplication.showScreen("BrowseIndicators", parameters, options);
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

        showBrowseMilestoneValues: $defineShowScreen(function showBrowseMilestoneValues(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseMilestoneValues screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseMilestoneValues", parameters, options);
        }),

        showBrowseIndicatorValues: $defineShowScreen(function showBrowseIndicatorValues(options) {
            /// <summary>
            /// Asynchronously navigates forward to the BrowseIndicatorValues screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 0);
            return lightSwitchApplication.showScreen("BrowseIndicatorValues", parameters, options);
        }),

        showAddEditMilestoneValue: $defineShowScreen(function showAddEditMilestoneValue(MilestoneValue, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditMilestoneValue screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditMilestoneValue", parameters, options);
        }),

        showAddEditIndicatorValue: $defineShowScreen(function showAddEditIndicatorValue(IndicatorValue, options) {
            /// <summary>
            /// Asynchronously navigates forward to the AddEditIndicatorValue screen.
            /// </summary>
            /// <param name="options" optional="true">
            /// An object that provides one or more of the following options:<br/>- beforeShown: a function that is called after boundary behavior has been applied but before the screen is shown.<br/>+ Signature: beforeShown(screen)<br/>- afterClosed: a function that is called after boundary behavior has been applied and the screen has been closed.<br/>+ Signature: afterClosed(screen, action : msls.NavigateBackAction)
            /// </param>
            /// <returns type="WinJS.Promise" />
            var parameters = Array.prototype.slice.call(arguments, 0, 1);
            return lightSwitchApplication.showScreen("AddEditIndicatorValue", parameters, options);
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
        })

    });

}(msls.application));
