﻿window.myapp=msls.application,function(n){function b(n){i.call(this,n)}function e(n){i.call(this,n)}function it(n){i.call(this,n)}function st(n){i.call(this,n)}function h(n){i.call(this,n)}function rt(n){i.call(this,n)}function ht(n){i.call(this,n)}function o(n){i.call(this,n)}function ut(n){i.call(this,n)}function ct(n){i.call(this,n)}function c(n){i.call(this,n)}function ft(n){i.call(this,n)}function k(n){i.call(this,n)}function a(n){i.call(this,n)}function v(n){i.call(this,n)}function d(n){i.call(this,n)}function et(n){i.call(this,n)}function t(n){i.call(this,n)}function yt(n){i.call(this,n)}function l(n){i.call(this,n)}function lt(n){i.call(this,n)}function pt(n){i.call(this,n)}function y(n){i.call(this,n)}function at(n){i.call(this,n)}function s(n){i.call(this,n)}function g(n){i.call(this,n)}function vt(n){i.call(this,n)}function nt(n){i.call(this,n)}function ot(n){i.call(this,n)}function tt(n){i.call(this,n)}function p(n){i.call(this,n)}function w(n){i.call(this,n)}function wt(n){bt.call(this,n)}function ni(){kt.call(this)}var i=msls.Entity,bt=msls.DataService,kt=msls.DataWorkspace,r=msls._defineEntity,dt=msls._defineDataService,gt=msls._defineDataWorkspace,u=msls.DataServiceQuery,f=msls._toODataString;msls._addToNamespace("msls.application",{Activity:r(b,[{name:"ActivityID",type:Number},{name:"ShortName",type:String},{name:"LongName",type:String},{name:"TextDescription",type:String},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedBy",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_ModifiedOn",type:Date},{name:"Code",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Project",kind:"reference",type:a},{name:"Indicators",kind:"collection",elementType:e},{name:"Milestones",kind:"collection",elementType:h},{name:"SubOutput_ID",type:Number},{name:"ActivityType_ID",type:Number}]),Indicator:r(e,[{name:"IndicatorID",type:Number},{name:"LongName",type:String},{name:"TextDescription",type:String},{name:"Baseline",type:Number},{name:"BaselineString",type:String},{name:"BaselineDate",type:Date},{name:"Target",type:Number},{name:"TargetString",type:String},{name:"TargetDate",type:Date},{name:"ReleaseDate",type:Date},{name:"ReportingDate",type:Date},{name:"BusinessKey",type:String},{name:"Notes",type:String},{name:"Code",type:String},{name:"Sharepoint_ID",type:String},{name:"ShortName",type:String},{name:"BaselineDate_ID",type:Number},{name:"TargetDate_ID",type:Number},{name:"updated",type:String},{name:"IsKeyIndicator",type:Boolean},{name:"UnitOfMeasure",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Activity",kind:"reference",type:b},{name:"IndicatorType",kind:"reference",type:st},{name:"Outcome",kind:"reference",type:o},{name:"Output",kind:"reference",type:c},{name:"SubOutput",kind:"reference",type:v},{name:"IndicatorLocations",kind:"collection",elementType:it},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"projectID",type:Number}]),IndicatorLocation:r(it,[{name:"IndicatorLocation_ID",type:Number},{name:"Sharepoint_ID",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Indicator",kind:"reference",type:e},{name:"Location",kind:"reference",type:y}]),IndicatorType:r(st,[{name:"IndicatorType_ID",type:Number},{name:"Code",type:String},{name:"Name",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Indicators",kind:"collection",elementType:e},{name:"ActiveType",kind:"reference",type:t}]),Milestone:r(h,[{name:"MilestoneID",type:Number},{name:"LongName",type:String},{name:"TextDescription",type:String},{name:"Baseline",type:Number},{name:"BaselineString",type:String},{name:"BaselineDate",type:Date},{name:"Target",type:Number},{name:"TargetString",type:String},{name:"TargetDate",type:Date},{name:"ReleaseDate",type:Date},{name:"ReportingDate",type:Date},{name:"BusinessKey",type:String},{name:"Notes",type:String},{name:"Code",type:String},{name:"ShortName",type:String},{name:"BaselineDateID",type:Number},{name:"TargetDateID",type:Number},{name:"IsKeyIndicator",type:Boolean},{name:"UnitOfMeasure",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Activity",kind:"reference",type:b},{name:"MilestoneType",kind:"reference",type:ht},{name:"Outcome",kind:"reference",type:o},{name:"Project",kind:"reference",type:a},{name:"MilestoneLocations",kind:"collection",elementType:rt},{name:"MilestoneValues",kind:"collection",elementType:w}]),MilestoneLocation:r(rt,[{name:"MilestoneLocation_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Location",kind:"reference",type:y},{name:"Milestone",kind:"reference",type:h}]),MilestoneType:r(ht,[{name:"MilestoneTypeID",type:Number},{name:"Code",type:String},{name:"Name",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Milestones",kind:"collection",elementType:h},{name:"ActiveType",kind:"reference",type:t}]),Outcome:r(o,[{name:"OutcomeID",type:Number},{name:"Code",type:String},{name:"LongName",type:String},{name:"BusinessKey",type:String},{name:"ShortName",type:String},{name:"TextDescription",type:String},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedBy",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_ModifiedOn",type:Date},{name:"DataVersions",kind:"collection",elementType:l},{name:"Indicators",kind:"collection",elementType:e},{name:"Milestones",kind:"collection",elementType:h},{name:"ActiveType",kind:"reference",type:t},{name:"OutcomeOrganizations",kind:"collection",elementType:ut},{name:"OutcomePersonRoles",kind:"collection",elementType:ct},{name:"Outputs",kind:"collection",elementType:c},{name:"Projects",kind:"collection",elementType:a}]),OutcomeOrganization:r(ut,[{name:"OutcomeOrganization_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Organization",kind:"reference",type:s},{name:"Outcome",kind:"reference",type:o}]),OutcomePersonRole:r(ct,[{name:"OutcomePersonRole_ID",type:Number},{name:"Person_ID",type:Number},{name:"Role_ID",type:Number},{name:"Sharepoint_ID",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Outcome",kind:"reference",type:o}]),Output:r(c,[{name:"Output_ID",type:Number},{name:"Code",type:String},{name:"LongName",type:String},{name:"BusinessKey",type:String},{name:"ShortName",type:String},{name:"TextDescription",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Indicators",kind:"collection",elementType:e},{name:"ActiveType",kind:"reference",type:t},{name:"Outcome",kind:"reference",type:o},{name:"OutputOutputLinks",kind:"collection",elementType:ft},{name:"OutputOutputLinks1",kind:"collection",elementType:ft},{name:"OutputPersonRoles",kind:"collection",elementType:k},{name:"SubOutputs",kind:"collection",elementType:v}]),OutputOutputLink:r(ft,[{name:"OutputOutputLink_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Output",kind:"reference",type:c},{name:"Output1",kind:"reference",type:c}]),OutputPersonRole:r(k,[{name:"OutputPersonRole_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Output",kind:"reference",type:c},{name:"Person",kind:"reference",type:nt},{name:"Role",kind:"reference",type:tt}]),Project:r(a,[{name:"ProjectID",type:Number},{name:"Code",type:String},{name:"ShortName",type:String},{name:"LongName",type:String},{name:"TextDescription",type:String},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedBy",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_ModifiedOn",type:Date},{name:"Activities",kind:"collection",elementType:b},{name:"Milestones",kind:"collection",elementType:h},{name:"ActiveType",kind:"reference",type:t},{name:"Outcome",kind:"reference",type:o},{name:"Projects",kind:"collection",elementType:a},{name:"Project1",kind:"reference",type:a}]),SubOutput:r(v,[{name:"SubOutput_ID",type:Number},{name:"Code",type:String},{name:"ShortName",type:String},{name:"BusinessKey",type:String},{name:"LongName",type:String},{name:"TextDescription",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Indicators",kind:"collection",elementType:e},{name:"ActiveType",kind:"reference",type:t},{name:"Output",kind:"reference",type:c},{name:"SubOutputPersonRoles",kind:"collection",elementType:d},{name:"SubOutputSubOutputLinks",kind:"collection",elementType:et},{name:"SubOutputSubOutputLinks1",kind:"collection",elementType:et}]),SubOutputPersonRole:r(d,[{name:"SubOutputPersonRole_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Person",kind:"reference",type:nt},{name:"Role",kind:"reference",type:tt},{name:"SubOutput",kind:"reference",type:v}]),SubOutputSubOutputLink:r(et,[{name:"SubOutputSubOutputLink_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"SubOutput",kind:"reference",type:v},{name:"SubOutput1",kind:"reference",type:v}]),ActiveType:r(t,[{name:"ID",type:Number},{name:"Code",type:String},{name:"Name",type:String},{name:"Activities",kind:"collection",elementType:b},{name:"DataSources",kind:"collection",elementType:yt},{name:"DataVersions",kind:"collection",elementType:l},{name:"DataVersionLevels",kind:"collection",elementType:lt},{name:"DimDates",kind:"collection",elementType:pt},{name:"Indicators",kind:"collection",elementType:e},{name:"IndicatorLocations",kind:"collection",elementType:it},{name:"IndicatorTypes",kind:"collection",elementType:st},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"Locations",kind:"collection",elementType:y},{name:"LocationTypes",kind:"collection",elementType:at},{name:"Milestones",kind:"collection",elementType:h},{name:"MilestoneLocations",kind:"collection",elementType:rt},{name:"MilestoneTypes",kind:"collection",elementType:ht},{name:"MilestoneValues",kind:"collection",elementType:w},{name:"Organizations",kind:"collection",elementType:s},{name:"OrganizationPersonRoles",kind:"collection",elementType:g},{name:"OrganizationTypes",kind:"collection",elementType:vt},{name:"Outcomes",kind:"collection",elementType:o},{name:"OutcomeOrganizations",kind:"collection",elementType:ut},{name:"OutcomePersonRoles",kind:"collection",elementType:ct},{name:"Outputs",kind:"collection",elementType:c},{name:"OutputOutputLinks",kind:"collection",elementType:ft},{name:"OutputPersonRoles",kind:"collection",elementType:k},{name:"People",kind:"collection",elementType:nt},{name:"Projects",kind:"collection",elementType:a},{name:"ReportingPeriods",kind:"collection",elementType:ot},{name:"Roles",kind:"collection",elementType:tt},{name:"SubOutputs",kind:"collection",elementType:v},{name:"SubOutputPersonRoles",kind:"collection",elementType:d},{name:"SubOutputSubOutputLinks",kind:"collection",elementType:et},{name:"sys_CreatedBy",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"sys_ModifiedOn",type:Date}]),DataSource:r(yt,[{name:"DataSource_ID",type:Number},{name:"Name",type:String},{name:"ContactDetails",type:String},{name:"Custodian",type:String},{name:"Format",type:String},{name:"CollectionMethod",type:String},{name:"MetadataStatus",type:String},{name:"BusinessKey",type:String},{name:"Sharepoint_ID",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t}]),DataVersion:r(l,[{name:"DataVersion_ID",type:Number},{name:"Code",type:String},{name:"Name",type:String},{name:"Description",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"DataVersions",kind:"collection",elementType:l},{name:"DataVersion1",kind:"reference",type:l},{name:"DataVersionLevel",kind:"reference",type:lt},{name:"Outcome",kind:"reference",type:o},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"MilestoneValues",kind:"collection",elementType:w}]),DataVersionLevel:r(lt,[{name:"DataVersionLevel_ID",type:Number},{name:"VersionLevelCode",type:String},{name:"VersionOrder",type:Number},{name:"Name",type:String},{name:"Description",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"DataVersions",kind:"collection",elementType:l},{name:"ActiveType",kind:"reference",type:t}]),DimDate:r(pt,[{name:"DateID",type:Number},{name:"c_Date",type:Date},{name:"Day",type:Number},{name:"DaySuffix",type:String},{name:"USDayOfWeek",type:String},{name:"DayOfWeek",type:String},{name:"DOWInMonth",type:Number},{name:"DayOfYear",type:Number},{name:"WeekOfYear",type:Number},{name:"WeekOfMonth",type:Number},{name:"MonthNumber",type:Number},{name:"MonthName",type:String},{name:"Quarter",type:Number},{name:"QuarterName",type:String},{name:"YearName",type:String},{name:"YearNumber",type:Number},{name:"StandardDate",type:String},{name:"IsPublicHoliday",type:Boolean},{name:"HolidayText",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"DateSK",type:Number},{name:"ActiveType",kind:"reference",type:t}]),Location:r(y,[{name:"Location_ID",type:Number},{name:"Code",type:String},{name:"Name",type:String},{name:"Area",type:String},{name:"Density",type:String},{name:"BusinessKey",type:String},{name:"ParentLocation_ID",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"IndicatorLocations",kind:"collection",elementType:it},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"ActiveType",kind:"reference",type:t},{name:"LocationType",kind:"reference",type:at},{name:"MilestoneLocations",kind:"collection",elementType:rt},{name:"MilestoneValues",kind:"collection",elementType:w}]),LocationType:r(at,[{name:"LocationType_ID",type:Number},{name:"Description",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Locations",kind:"collection",elementType:y},{name:"ActiveType",kind:"reference",type:t}]),Organization:r(s,[{name:"Organization_ID",type:Number},{name:"Code",type:String},{name:"BusinessKey",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"ActiveType",kind:"reference",type:t},{name:"Organizations",kind:"collection",elementType:s},{name:"Organization1",kind:"reference",type:s},{name:"OrganizationType",kind:"reference",type:vt},{name:"OrganizationPersonRoles",kind:"collection",elementType:g},{name:"OutcomeOrganizations",kind:"collection",elementType:ut},{name:"MilestoneValues",kind:"collection",elementType:w}]),OrganizationPersonRole:r(g,[{name:"OrganizationPersonRole_ID",type:Number},{name:"StartDate",type:Date},{name:"EndDate",type:Date},{name:"Sharepoint_ID",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"Organization",kind:"reference",type:s},{name:"Person",kind:"reference",type:nt},{name:"Role",kind:"reference",type:tt}]),OrganizationType:r(vt,[{name:"OrganizationType_ID",type:Number},{name:"Description",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"Organizations",kind:"collection",elementType:s},{name:"ActiveType",kind:"reference",type:t}]),Person:r(nt,[{name:"Person_ID",type:Number},{name:"Title",type:String},{name:"Name",type:String},{name:"ContactDetails",type:String},{name:"Category",type:String},{name:"BusinessKey",type:String},{name:"UserDetails",type:String},{name:"Sharepoint_ID",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"OrganizationPersonRoles",kind:"collection",elementType:g},{name:"OutputPersonRoles",kind:"collection",elementType:k},{name:"ActiveType",kind:"reference",type:t},{name:"SubOutputPersonRoles",kind:"collection",elementType:d}]),ReportingPeriod:r(ot,[{name:"ID",type:Number},{name:"ReportingPeriod1",type:Number},{name:"StartDateID",type:Number},{name:"EndDateID",type:Number},{name:"FirstCycleDate",type:Date},{name:"LastCycleDate",type:Date},{name:"YearName",type:String},{name:"YearNumber",type:Number},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"IndicatorValues",kind:"collection",elementType:p},{name:"MilestoneValues",kind:"collection",elementType:w},{name:"ActiveType",kind:"reference",type:t}]),Role:r(tt,[{name:"Description",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"OrganizationPersonRoles",kind:"collection",elementType:g},{name:"OutputPersonRoles",kind:"collection",elementType:k},{name:"ActiveType",kind:"reference",type:t},{name:"SubOutputPersonRoles",kind:"collection",elementType:d},{name:"RoleID",type:Number},{name:"Code",type:String},{name:"Name",type:String}]),IndicatorValue:r(p,[{name:"IndicatorValues_ID",type:Number},{name:"ActualLabel",type:String},{name:"ActualValue",type:Number},{name:"ActualValueString",type:String},{name:"ActualDate",type:Date},{name:"ReleaseDate",type:Date},{name:"ReportingDate",type:Date},{name:"IndicatorReportingDate",type:Date},{name:"BusinessKey",type:String},{name:"Notes",type:String},{name:"IndicatorStatusPercent",type:Number},{name:"Title",type:String},{name:"ModifiedDate",type:Date},{name:"Username",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"DataVersion",kind:"reference",type:l},{name:"Indicator",kind:"reference",type:e},{name:"Location",kind:"reference",type:y},{name:"Organization",kind:"reference",type:s},{name:"ReportingPeriod",kind:"reference",type:ot}]),MilestoneValue:r(w,[{name:"MilestoneValues_ID",type:Number},{name:"ActualLabel",type:String},{name:"ActualValue",type:Number},{name:"ActualValueString",type:String},{name:"ActualDate",type:Date},{name:"BusinessKey",type:String},{name:"Notes",type:String},{name:"MilestoneStatusPercent",type:Number},{name:"Title",type:String},{name:"ModifiedDate",type:Date},{name:"Username",type:String},{name:"sys_CreatedOn",type:Date},{name:"sys_CreatedBy",type:String},{name:"sys_ModifiedOn",type:Date},{name:"sys_ModifiedBy",type:String},{name:"ActiveType",kind:"reference",type:t},{name:"DataVersion",kind:"reference",type:l},{name:"Location",kind:"reference",type:y},{name:"Milestone",kind:"reference",type:h},{name:"ReportingPeriod",kind:"reference",type:ot},{name:"Organization",kind:"reference",type:s}]),MeerkatData:dt(wt,n.rootUri+"/MeerkatData.svc",[{name:"Activities",elementType:b},{name:"Indicators",elementType:e},{name:"IndicatorLocations",elementType:it},{name:"IndicatorTypes",elementType:st},{name:"Milestones",elementType:h},{name:"MilestoneLocations",elementType:rt},{name:"MilestoneTypes",elementType:ht},{name:"Outcomes",elementType:o},{name:"OutcomeOrganizations",elementType:ut},{name:"OutcomePersonRoles",elementType:ct},{name:"Outputs",elementType:c},{name:"OutputOutputLinks",elementType:ft},{name:"OutputPersonRoles",elementType:k},{name:"Projects",elementType:a},{name:"SubOutputs",elementType:v},{name:"SubOutputPersonRoles",elementType:d},{name:"SubOutputSubOutputLinks",elementType:et},{name:"ActiveTypes",elementType:t},{name:"DataSources",elementType:yt},{name:"DataVersions",elementType:l},{name:"DataVersionLevels",elementType:lt},{name:"DimDates",elementType:pt},{name:"Locations",elementType:y},{name:"LocationTypes",elementType:at},{name:"Organizations",elementType:s},{name:"OrganizationPersonRoles",elementType:g},{name:"OrganizationTypes",elementType:vt},{name:"People",elementType:nt},{name:"ReportingPeriods",elementType:ot},{name:"Roles",elementType:tt},{name:"IndicatorValues",elementType:p},{name:"MilestoneValues",elementType:w}],[{name:"Activities_SingleOrDefault",value:function(t){return new u({_entitySet:this.Activities},n.rootUri+"/MeerkatData.svc/Activities(ActivityID="+f(t,"Int32?")+")")}},{name:"Indicators_SingleOrDefault",value:function(t){return new u({_entitySet:this.Indicators},n.rootUri+"/MeerkatData.svc/Indicators(IndicatorID="+f(t,"Int32?")+")")}},{name:"IndicatorLocations_SingleOrDefault",value:function(t){return new u({_entitySet:this.IndicatorLocations},n.rootUri+"/MeerkatData.svc/IndicatorLocations(IndicatorLocation_ID="+f(t,"Int32?")+")")}},{name:"IndicatorTypes_SingleOrDefault",value:function(t){return new u({_entitySet:this.IndicatorTypes},n.rootUri+"/MeerkatData.svc/IndicatorTypes(IndicatorType_ID="+f(t,"Int32?")+")")}},{name:"Milestones_SingleOrDefault",value:function(t){return new u({_entitySet:this.Milestones},n.rootUri+"/MeerkatData.svc/Milestones(MilestoneID="+f(t,"Int32?")+")")}},{name:"MilestoneLocations_SingleOrDefault",value:function(t){return new u({_entitySet:this.MilestoneLocations},n.rootUri+"/MeerkatData.svc/MilestoneLocations(MilestoneLocation_ID="+f(t,"Int32?")+")")}},{name:"MilestoneTypes_SingleOrDefault",value:function(t){return new u({_entitySet:this.MilestoneTypes},n.rootUri+"/MeerkatData.svc/MilestoneTypes(MilestoneTypeID="+f(t,"Int32?")+")")}},{name:"Outcomes_SingleOrDefault",value:function(t){return new u({_entitySet:this.Outcomes},n.rootUri+"/MeerkatData.svc/Outcomes(OutcomeID="+f(t,"Int32?")+")")}},{name:"OutcomeOrganizations_SingleOrDefault",value:function(t){return new u({_entitySet:this.OutcomeOrganizations},n.rootUri+"/MeerkatData.svc/OutcomeOrganizations(OutcomeOrganization_ID="+f(t,"Int32?")+")")}},{name:"OutcomePersonRoles_SingleOrDefault",value:function(t){return new u({_entitySet:this.OutcomePersonRoles},n.rootUri+"/MeerkatData.svc/OutcomePersonRoles(OutcomePersonRole_ID="+f(t,"Int32?")+")")}},{name:"Outputs_SingleOrDefault",value:function(t){return new u({_entitySet:this.Outputs},n.rootUri+"/MeerkatData.svc/Outputs(Output_ID="+f(t,"Int32?")+")")}},{name:"OutputOutputLinks_SingleOrDefault",value:function(t){return new u({_entitySet:this.OutputOutputLinks},n.rootUri+"/MeerkatData.svc/OutputOutputLinks(OutputOutputLink_ID="+f(t,"Int32?")+")")}},{name:"OutputPersonRoles_SingleOrDefault",value:function(t){return new u({_entitySet:this.OutputPersonRoles},n.rootUri+"/MeerkatData.svc/OutputPersonRoles(OutputPersonRole_ID="+f(t,"Int32?")+")")}},{name:"Projects_SingleOrDefault",value:function(t){return new u({_entitySet:this.Projects},n.rootUri+"/MeerkatData.svc/Projects(ProjectID="+f(t,"Int32?")+")")}},{name:"SubOutputs_SingleOrDefault",value:function(t){return new u({_entitySet:this.SubOutputs},n.rootUri+"/MeerkatData.svc/SubOutputs(SubOutput_ID="+f(t,"Int32?")+")")}},{name:"SubOutputPersonRoles_SingleOrDefault",value:function(t){return new u({_entitySet:this.SubOutputPersonRoles},n.rootUri+"/MeerkatData.svc/SubOutputPersonRoles(SubOutputPersonRole_ID="+f(t,"Int32?")+")")}},{name:"SubOutputSubOutputLinks_SingleOrDefault",value:function(t){return new u({_entitySet:this.SubOutputSubOutputLinks},n.rootUri+"/MeerkatData.svc/SubOutputSubOutputLinks(SubOutputSubOutputLink_ID="+f(t,"Int32?")+")")}},{name:"ActiveTypes_SingleOrDefault",value:function(t){return new u({_entitySet:this.ActiveTypes},n.rootUri+"/MeerkatData.svc/ActiveTypes(ID="+f(t,"Int32?")+")")}},{name:"DataSources_SingleOrDefault",value:function(t){return new u({_entitySet:this.DataSources},n.rootUri+"/MeerkatData.svc/DataSources(DataSource_ID="+f(t,"Int32?")+")")}},{name:"DataVersions_SingleOrDefault",value:function(t){return new u({_entitySet:this.DataVersions},n.rootUri+"/MeerkatData.svc/DataVersions(DataVersion_ID="+f(t,"Int32?")+")")}},{name:"DataVersionLevels_SingleOrDefault",value:function(t){return new u({_entitySet:this.DataVersionLevels},n.rootUri+"/MeerkatData.svc/DataVersionLevels(DataVersionLevel_ID="+f(t,"Int32?")+")")}},{name:"DimDates_SingleOrDefault",value:function(t){return new u({_entitySet:this.DimDates},n.rootUri+"/MeerkatData.svc/DimDates(DateID="+f(t,"Int32?")+")")}},{name:"Locations_SingleOrDefault",value:function(t){return new u({_entitySet:this.Locations},n.rootUri+"/MeerkatData.svc/Locations(Location_ID="+f(t,"Int32?")+")")}},{name:"LocationTypes_SingleOrDefault",value:function(t){return new u({_entitySet:this.LocationTypes},n.rootUri+"/MeerkatData.svc/LocationTypes(LocationType_ID="+f(t,"Int32?")+")")}},{name:"Organizations_SingleOrDefault",value:function(t){return new u({_entitySet:this.Organizations},n.rootUri+"/MeerkatData.svc/Organizations(Organization_ID="+f(t,"Int32?")+")")}},{name:"OrganizationPersonRoles_SingleOrDefault",value:function(t){return new u({_entitySet:this.OrganizationPersonRoles},n.rootUri+"/MeerkatData.svc/OrganizationPersonRoles(OrganizationPersonRole_ID="+f(t,"Int32?")+")")}},{name:"OrganizationTypes_SingleOrDefault",value:function(t){return new u({_entitySet:this.OrganizationTypes},n.rootUri+"/MeerkatData.svc/OrganizationTypes(OrganizationType_ID="+f(t,"Int32?")+")")}},{name:"People_SingleOrDefault",value:function(t){return new u({_entitySet:this.People},n.rootUri+"/MeerkatData.svc/People(Person_ID="+f(t,"Int32?")+")")}},{name:"ReportingPeriods_SingleOrDefault",value:function(t){return new u({_entitySet:this.ReportingPeriods},n.rootUri+"/MeerkatData.svc/ReportingPeriods(ID="+f(t,"Int32?")+")")}},{name:"Roles_SingleOrDefault",value:function(t){return new u({_entitySet:this.Roles},n.rootUri+"/MeerkatData.svc/Roles(RoleID="+f(t,"Int32?")+")")}},{name:"IndicatorValues_SingleOrDefault",value:function(t){return new u({_entitySet:this.IndicatorValues},n.rootUri+"/MeerkatData.svc/IndicatorValues(IndicatorValues_ID="+f(t,"Int32?")+")")}},{name:"MilestoneValues_SingleOrDefault",value:function(t){return new u({_entitySet:this.MilestoneValues},n.rootUri+"/MeerkatData.svc/MilestoneValues(MilestoneValues_ID="+f(t,"Int32?")+")")}}]),DataWorkspace:gt(ni,[{name:"MeerkatData",type:wt}])})}(msls.application),function(n){function f(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseOutcomes",i)}function e(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseOutputs",i)}function o(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseSubOutputs",i)}function s(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseIndicators",i)}function h(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseProjects",i)}function c(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseActivities",i)}function l(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseMilestones",i)}function a(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseMilestoneValues",i)}function v(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"BrowseIndicatorValues",i)}function y(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"AddEditMilestoneValue",i)}function p(i,r){r||(r=new n.DataWorkspace),t.call(this,r,"AddEditIndicatorValue",i)}var t=msls.Screen,i=msls._defineScreen,w=msls.DataServiceQuery,u=msls._toODataString,r=msls._defineShowScreen;msls._addToNamespace("msls.application",{BrowseOutcomes:i(f,[{name:"Outcomes",kind:"collection",elementType:n.Outcome,createQuery:function(){return this.dataWorkspace.MeerkatData.Outcomes.expand("ActiveType")}}],[{name:"ShowOutcomeIndicators_Tap"},{name:"ShowBrowseOutputs_Tap"}]),BrowseOutputs:i(e,[{name:"Outputs",kind:"collection",elementType:n.Output,createQuery:function(n){return this.dataWorkspace.MeerkatData.Outputs.filter(""+(n===undefined||n===null?"false":"(Outcome/OutcomeID eq "+u(n,"Int32?")+")")+"").expand("ActiveType").expand("Outcome")}},{name:"pOutcomeID",kind:"local",type:Number}],[]),BrowseSubOutputs:i(o,[{name:"SubOutputs",kind:"collection",elementType:n.SubOutput,createQuery:function(n){return this.dataWorkspace.MeerkatData.SubOutputs.filter(""+(n===undefined||n===null?"false":"(Output/Output_ID eq "+u(n,"Int32?")+")")+"").expand("ActiveType").expand("Output")}},{name:"pOutput_ID",kind:"local",type:Number}],[]),BrowseIndicators:i(s,[{name:"Indicators",kind:"collection",elementType:n.Indicator,createQuery:function(n,t,i){return this.dataWorkspace.MeerkatData.Indicators.filter("("+(n===undefined||n===null?"false":"(SubOutput/SubOutput_ID eq "+u(n,"Int32?")+")")+" and "+(t===undefined||t===null?"false":"(Output/Output_ID eq "+u(t,"Int32?")+")")+") and "+(i===undefined||i===null?"false":"(Outcome/OutcomeID eq "+u(i,"Int32?")+")")+"").expand("ActiveType").expand("Activity").expand("IndicatorType").expand("Outcome").expand("Output").expand("SubOutput")}},{name:"SubOutput_ID",kind:"local",type:Number},{name:"OutcomeID",kind:"local",type:Number},{name:"Output_ID",kind:"local",type:Number}],[]),BrowseProjects:i(h,[{name:"Projects",kind:"collection",elementType:n.Project,createQuery:function(){return this.dataWorkspace.MeerkatData.Projects.expand("ActiveType").expand("Outcome").expand("Project1")}}],[]),BrowseActivities:i(c,[{name:"Activities",kind:"collection",elementType:n.Activity,createQuery:function(){return this.dataWorkspace.MeerkatData.Activities.expand("ActiveType").expand("Project")}}],[]),BrowseMilestones:i(l,[{name:"Milestones",kind:"collection",elementType:n.Milestone,createQuery:function(){return this.dataWorkspace.MeerkatData.Milestones.expand("ActiveType").expand("Activity").expand("MilestoneType").expand("Outcome").expand("Project")}}],[]),BrowseMilestoneValues:i(a,[{name:"MilestoneValues",kind:"collection",elementType:n.MilestoneValue,createQuery:function(){return this.dataWorkspace.MeerkatData.MilestoneValues.expand("ActiveType").expand("DataVersion").expand("Location").expand("Milestone").expand("ReportingPeriod")}}],[]),BrowseIndicatorValues:i(v,[{name:"IndicatorValues",kind:"collection",elementType:n.IndicatorValue,createQuery:function(){return this.dataWorkspace.MeerkatData.IndicatorValues.expand("ActiveType").expand("DataVersion").expand("Indicator").expand("Location").expand("Organization").expand("ReportingPeriod")}}],[]),AddEditMilestoneValue:i(y,[{name:"MilestoneValue",kind:"local",type:n.MilestoneValue}],[]),AddEditIndicatorValue:i(p,[{name:"IndicatorValue",kind:"local",type:n.IndicatorValue}],[]),showBrowseOutcomes:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseOutcomes",i,t)}),showBrowseOutputs:r(function(t,i){var r=Array.prototype.slice.call(arguments,0,1);return n.showScreen("BrowseOutputs",r,i)}),showBrowseSubOutputs:r(function(t,i){var r=Array.prototype.slice.call(arguments,0,1);return n.showScreen("BrowseSubOutputs",r,i)}),showBrowseIndicators:r(function(t,i,r,u){var f=Array.prototype.slice.call(arguments,0,3);return n.showScreen("BrowseIndicators",f,u)}),showBrowseProjects:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseProjects",i,t)}),showBrowseActivities:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseActivities",i,t)}),showBrowseMilestones:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseMilestones",i,t)}),showBrowseMilestoneValues:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseMilestoneValues",i,t)}),showBrowseIndicatorValues:r(function(t){var i=Array.prototype.slice.call(arguments,0,0);return n.showScreen("BrowseIndicatorValues",i,t)}),showAddEditMilestoneValue:r(function(t,i){var r=Array.prototype.slice.call(arguments,0,1);return n.showScreen("AddEditMilestoneValue",r,i)}),showAddEditIndicatorValue:r(function(t,i){var r=Array.prototype.slice.call(arguments,0,1);return n.showScreen("AddEditIndicatorValue",r,i)})})}(msls.application),myapp.BrowseOutcomes.ShowOutcomeIndicators_Tap_execute=function(){this.myapp.showBrowseSubOutputs()},myapp.IndicatorValue.created=function(n){n.sys_CreatedBy="NA",n.sys_CreatedOn="1999/01/01",n.sys_ModifiedBy="NA",n.sys_ModifiedOn="1999/01/01"},myapp.MilestoneValue.created=function(n){n.sys_CreatedBy="NA",n.sys_CreatedOn="1999/01/01",n.sys_ModifiedBy="NA",n.sys_ModifiedOn="1999/01/01"};