--Logging user create
USE [master]
GO
CREATE LOGIN [CareETL] WITH PASSWORD=N'Denali@2011'
GO

USE [Aphelion.Care.Logging]
GO
CREATE USER [CareETL]
	FOR LOGIN [CareETL]
	WITH DEFAULT_SCHEMA = dbo
GO

sp_addrolemember [db_ddladmin], [CareETL]
sp_addrolemember [db_datawriter], [CareETL]

GRANT EXECUTE ON sp_ssis_addlogentry TO [CareETL]

USE [Aphelion.Care.LoadQueue]
GO
CREATE USER [CareETL]
	FOR LOGIN [CareETL]
	WITH DEFAULT_SCHEMA = dbo
GO

sp_addrolemember [db_owner], [CareETL]

CREATE USER [Scheduler]
	FOR LOGIN [Scheduler]
	WITH DEFAULT_SCHEMA = dbo
GO

sp_addrolemember [db_datareader], [Scheduler]
sp_addrolemember [db_datawriter], [Scheduler]

--LoadQueue inserts
USE [Aphelion.Care.LoadQueue]
GO

--application
INSERT INTO [dbo].[Application]
SELECT 'Care' --[ApplicationName]
     , 'Care ETL' --[ApplicationDescription]
     , 'CARER01' --[DatabaseServer]
     , 'Meerkat' --[DatabaseName]
     , NULL --[CubeServer]
     , NULL --[CubeName]
     , 'icmkgil6ip.database.windows.net' --[LogServer]
     , NULL --[LogDatabaseName]
     , NULL --[LogUserName]
     , NULL --[LogPassword]
     , NULL --[TargetMachine]
     , 'geoffreysmith@aphelion.bi' --[AdminEmail]
     , getdate() --[sys_CreatedOn]
     , system_user --[sys_CreatedBy]
     , getdate() --[sys_ModifiedOn]
     , system_user --[sys_ModifiedBy]

SELECT * FROM Application   

--ApplicationID = 1
--package - insert all packages
INSERT INTO Package
SELECT 1, '200_StagingTemplateLoader.dtsx', '200_StagingTemplateLoader.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, '300_GenerateForm.dtsx', '300_GenerateForm.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, '310_LoadForm.dtsx', '310_LoadForm.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, '400_GenerateAttendanceRegister.dtsx', '400_GenerateAttendanceRegister.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, '410_LoadAttendanceRegister.dtsx', '410_LoadAttendanceRegister.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Activity.dtsx', 'ExcelLoad_Staging.Activity.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.AgeBand.dtsx', 'ExcelLoad_Staging.AgeBand.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.CommunityType.dtsx', 'ExcelLoad_Staging.CommunityType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.CustomReport.dtsx', 'ExcelLoad_Staging.CustomReport.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.CustomReportType.dtsx', 'ExcelLoad_Staging.CustomReportType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.CustomReport_Indicator.dtsx', 'ExcelLoad_Staging.CustomReport_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.CustomReport_Project.dtsx', 'ExcelLoad_Staging.CustomReport_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.DataSource.dtsx', 'ExcelLoad_Staging.DataSource.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.DataVersion.dtsx', 'ExcelLoad_Staging.DataVersion.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Donor.dtsx', 'ExcelLoad_Staging.Donor.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.DonorReport.dtsx', 'ExcelLoad_Staging.DonorReport.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.DonorReport_Indicator.dtsx', 'ExcelLoad_Staging.DonorReport_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.DonorReport_Project.dtsx', 'ExcelLoad_Staging.DonorReport_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Framework.dtsx', 'ExcelLoad_Staging.Framework.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Framework_Indicator.dtsx', 'ExcelLoad_Staging.Framework_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Framework_Project.dtsx', 'ExcelLoad_Staging.Framework_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Gender.dtsx', 'ExcelLoad_Staging.Gender.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Group.dtsx', 'ExcelLoad_Staging.Group.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Indicator.dtsx', 'ExcelLoad_Staging.Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.IndicatorLocation.dtsx', 'ExcelLoad_Staging.IndicatorLocation.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.IndicatorType.dtsx', 'ExcelLoad_Staging.IndicatorType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.IndicatorValues.dtsx', 'ExcelLoad_Staging.IndicatorValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Institution.dtsx', 'ExcelLoad_Staging.Institution.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Location.dtsx', 'ExcelLoad_Staging.Location.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.LocationType.dtsx', 'ExcelLoad_Staging.LocationType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Milestone.dtsx', 'ExcelLoad_Staging.Milestone.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.MilestoneLocation.dtsx', 'ExcelLoad_Staging.MilestoneLocation.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.MilestoneType.dtsx', 'ExcelLoad_Staging.MilestoneType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.MilestoneValues.dtsx', 'ExcelLoad_Staging.MilestoneValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Organization.dtsx', 'ExcelLoad_Staging.Organization.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OrganizationPersonRole.dtsx', 'ExcelLoad_Staging.OrganizationPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OrganizationType.dtsx', 'ExcelLoad_Staging.OrganizationType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Outcome.dtsx', 'ExcelLoad_Staging.Outcome.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OutcomeOrganization.dtsx', 'ExcelLoad_Staging.OutcomeOrganization.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OutcomePersonRole.dtsx', 'ExcelLoad_Staging.OutcomePersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Output.dtsx', 'ExcelLoad_Staging.Output.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OutputOutputLink.dtsx', 'ExcelLoad_Staging.OutputOutputLink.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.OutputPersonRole.dtsx', 'ExcelLoad_Staging.OutputPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.PeopleReachedValues.dtsx', 'ExcelLoad_Staging.PeopleReachedValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Person.dtsx', 'ExcelLoad_Staging.Person.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Programme.dtsx', 'ExcelLoad_Staging.Programme.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Project.dtsx', 'ExcelLoad_Staging.Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Project_ResultArea.dtsx', 'ExcelLoad_Staging.Project_ResultArea.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.ReportingPeriod.dtsx', 'ExcelLoad_Staging.ReportingPeriod.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.ResultArea.dtsx', 'ExcelLoad_Staging.ResultArea.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Role.dtsx', 'ExcelLoad_Staging.Role.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.Sector.dtsx', 'ExcelLoad_Staging.Sector.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.StatusType.dtsx', 'ExcelLoad_Staging.StatusType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.StatusValues.dtsx', 'ExcelLoad_Staging.StatusValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.StrategicElement.dtsx', 'ExcelLoad_Staging.StrategicElement.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.SubOutput.dtsx', 'ExcelLoad_Staging.SubOutput.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.SubOutputPersonRole.dtsx', 'ExcelLoad_Staging.SubOutputPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.SubOutputSubOutputLink.dtsx', 'ExcelLoad_Staging.SubOutputSubOutputLink.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'ExcelLoad_Staging.SubSector.dtsx', 'ExcelLoad_Staging.SubSector.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Activity.dtsx', 'StagingLoad_app.Activity.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Indicator.dtsx', 'StagingLoad_app.Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.IndicatorLocation.dtsx', 'StagingLoad_app.IndicatorLocation.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.IndicatorType.dtsx', 'StagingLoad_app.IndicatorType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Milestone.dtsx', 'StagingLoad_app.Milestone.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.MilestoneLocation.dtsx', 'StagingLoad_app.MilestoneLocation.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.MilestoneType.dtsx', 'StagingLoad_app.MilestoneType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Outcome.dtsx', 'StagingLoad_app.Outcome.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.OutcomeOrganization.dtsx', 'StagingLoad_app.OutcomeOrganization.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.OutcomePersonRole.dtsx', 'StagingLoad_app.OutcomePersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Output.dtsx', 'StagingLoad_app.Output.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.OutputOutputLink.dtsx', 'StagingLoad_app.OutputOutputLink.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.OutputPersonRole.dtsx', 'StagingLoad_app.OutputPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Programme.dtsx', 'StagingLoad_app.Programme.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Project.dtsx', 'StagingLoad_app.Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.Sector.dtsx', 'StagingLoad_app.Sector.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.SubOutput.dtsx', 'StagingLoad_app.SubOutput.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.SubOutputPersonRole.dtsx', 'StagingLoad_app.SubOutputPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.SubOutputSubOutputLink.dtsx', 'StagingLoad_app.SubOutputSubOutputLink.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_app.SubSector.dtsx', 'StagingLoad_app.SubSector.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.DataSource.dtsx', 'StagingLoad_Core.DataSource.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.DataVersion.dtsx', 'StagingLoad_Core.DataVersion.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.Location.dtsx', 'StagingLoad_Core.Location.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.LocationType.dtsx', 'StagingLoad_Core.LocationType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.Organization.dtsx', 'StagingLoad_Core.Organization.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.OrganizationPersonRole.dtsx', 'StagingLoad_Core.OrganizationPersonRole.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.OrganizationType.dtsx', 'StagingLoad_Core.OrganizationType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.Person.dtsx', 'StagingLoad_Core.Person.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.ReportingPeriod.dtsx', 'StagingLoad_Core.ReportingPeriod.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.Role.dtsx', 'StagingLoad_Core.Role.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_Core.StatusType.dtsx', 'StagingLoad_Core.StatusType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.AgeBand.dtsx', 'StagingLoad_disagg.AgeBand.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.CommunityType.dtsx', 'StagingLoad_disagg.CommunityType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Donor.dtsx', 'StagingLoad_disagg.Donor.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Framework.dtsx', 'StagingLoad_disagg.Framework.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Framework_Indicator.dtsx', 'StagingLoad_disagg.Framework_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Framework_Project.dtsx', 'StagingLoad_disagg.Framework_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Gender.dtsx', 'StagingLoad_disagg.Gender.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Group.dtsx', 'StagingLoad_disagg.Group.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Institution.dtsx', 'StagingLoad_disagg.Institution.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.Project_ResultArea.dtsx', 'StagingLoad_disagg.Project_ResultArea.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.ResultArea.dtsx', 'StagingLoad_disagg.ResultArea.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_disagg.StrategicElement.dtsx', 'StagingLoad_disagg.StrategicElement.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_RBM.IndicatorValues.dtsx', 'StagingLoad_RBM.IndicatorValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_RBM.MilestoneValues.dtsx', 'StagingLoad_RBM.MilestoneValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_RBM.PeopleReachedValues.dtsx', 'StagingLoad_RBM.PeopleReachedValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_RBM.StatusValues.dtsx', 'StagingLoad_RBM.StatusValues.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.CustomReport.dtsx', 'StagingLoad_rpt.CustomReport.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.CustomReportType.dtsx', 'StagingLoad_rpt.CustomReportType.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.CustomReport_Indicator.dtsx', 'StagingLoad_rpt.CustomReport_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.CustomReport_Project.dtsx', 'StagingLoad_rpt.CustomReport_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.DonorReport.dtsx', 'StagingLoad_rpt.DonorReport.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.DonorReport_Indicator.dtsx', 'StagingLoad_rpt.DonorReport_Indicator.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, 'StagingLoad_rpt.DonorReport_Project.dtsx', 'StagingLoad_rpt.DonorReport_Project.dtsx', getdate(), system_user, getdate(), system_user
UNION SELECT 1, '210_ClearMeerkatData.dtsx', '210_ClearMeerkatData.dtsx', getdate(), system_user, getdate(), system_user

select * from Package

--PackageLoad - insert various package loads
--excel files to staging db load and staging to db load
INSERT INTO PackageLoad
SELECT 'Excel to MeerkatStaging to Meerkat Load'
     , 'Excel to MeerkatStaging to Meerkat Load'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 1
--PackageLoadStep - insert all steps for Excel to MeerkatStaging to Meerkat Load
--load excel templates
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 1
     , 2                    --StepTypeID TableLoad
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '200_StagingTemplateLoader.dtsx'

--load from staging to meerkat db in order of dependency
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 1,2,PackageID,PackageName,PackageName,2,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Programme.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.DataSource.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.DataVersion.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Sector.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.IndicatorType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.MilestoneType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.OrganizationType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Person.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.ReportingPeriod.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Role.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.StatusType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.CommunityType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Donor.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.LocationType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Gender.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Group.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Institution.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.ResultArea.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.StrategicElement.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReportType.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Organization.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubSector.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Outcome.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Location.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Project.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutcomeOrganization.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutcomePersonRole.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Output.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.OrganizationPersonRole.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.AgeBand.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework_Project.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Project_ResultArea.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutputOutputLink.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutputPersonRole.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Activity.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutput.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport_Project.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport_Project.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.StatusValues.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutputPersonRole.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutputSubOutputLink.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Indicator.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Milestone.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.MilestoneLocation.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.IndicatorLocation.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework_Indicator.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport_Indicator.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.IndicatorValues.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.MilestoneValues.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport_Indicator.dtsx'
UNION ALL SELECT 1,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.PeopleReachedValues.dtsx'


--form generator
INSERT INTO PackageLoad
SELECT 'Form Generator'
     , 'Form Generator'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 2
--PackageLoadStep - form generator package
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 2
     , 2                    --StepTypeID TableLoad 
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '300_GenerateForm.dtsx'


--form loader
INSERT INTO PackageLoad
SELECT 'Form Loader'
     , 'Form Loader'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 3
--PackageLoadStep - form loader package
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 3
     , 2                    --StepTypeID TableLoad 
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '310_LoadForm.dtsx'



--attendance register generator
INSERT INTO PackageLoad
SELECT 'Attendance Register Generator'
     , 'Attendance Register Generator'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 4
--PackageLoadStep - attendance register generator package
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 4
     , 2                    --StepTypeID TableLoad 
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '400_GenerateAttendanceRegister.dtsx'

  
--attendance register loader
INSERT INTO PackageLoad
SELECT 'Attendance Register Loader'
     , 'Attendance Register Loader'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 5
--PackageLoadStep - attendance register generator package
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 5
     , 2                    --StepTypeID TableLoad 
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '410_LoadAttendanceRegister.dtsx'


--load staging templates ONLY
INSERT INTO PackageLoad
SELECT 'Excel to MeerkatStaging Load'
     , 'Excel to MeerkatStaging Load'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 6
--PackageLoadStep - only run package to load excel files to staging
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 6
     , 2                    --StepTypeID TableLoad 
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '200_StagingTemplateLoader.dtsx'


--excel files to staging db load, clear Meerkat data and staging to db load
INSERT INTO PackageLoad
SELECT 'Excel to MeerkatStaging, clear Meerkat data and load from MeerkatStaging'
     , 'Excel to MeerkatStaging, clear Meerkat data and load from MeerkatStaging'
     , 10
     , 1
     , getdate(), system_user, getdate(), system_user

select * from PackageLoad

--PackageLoadID = 1001
--PackageLoadStep - insert all steps for Excel to MeerkatStaging, clear Meerkat data and load Meerkat from MeerkatStaging
--load excel templates
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 1001
     , 2                    --StepTypeID TableLoad
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 1                    --StepOrder
     , 1                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '200_StagingTemplateLoader.dtsx'

--clear Meerkat data
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 1001
     , 2                    --StepTypeID TableLoad
     , PackageID
     , PackageName          --PackageLoadStepName
     , PackageName          --PackageLoadStepCode
     , 2                    --StepOrder
     , 0                    --ContinueOnFailure
FROM Package
WHERE ApplicationID = 1
  AND PackageName = '210_ClearMeerkatData.dtsx'

--load from staging to meerkat db in order of dependency
INSERT INTO PackageLoadStep (PackageLoadID, StepTypeID, PackageID, PackageLoadStepName, PackageLoadStepCode, StepOrder, ContinueOnFailure)
SELECT 1001,2,PackageID,PackageName,PackageName,3,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Programme.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.DataSource.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.DataVersion.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Sector.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.IndicatorType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.MilestoneType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.OrganizationType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Person.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.ReportingPeriod.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Role.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.StatusType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.CommunityType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Donor.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.LocationType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Gender.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Group.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Institution.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.ResultArea.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.StrategicElement.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReportType.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,4,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Organization.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubSector.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Outcome.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,5,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.Location.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Project.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutcomeOrganization.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutcomePersonRole.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Output.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_Core.OrganizationPersonRole.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,6,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.AgeBand.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework_Project.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Project_ResultArea.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutputOutputLink.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.OutputPersonRole.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Activity.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutput.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport_Project.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,7,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport_Project.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.StatusValues.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutputPersonRole.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.SubOutputSubOutputLink.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Indicator.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,8,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.Milestone.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.MilestoneLocation.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_app.IndicatorLocation.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_disagg.Framework_Indicator.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.CustomReport_Indicator.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.IndicatorValues.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.MilestoneValues.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,9,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_rpt.DonorReport_Indicator.dtsx'
UNION ALL SELECT 1001,2,PackageID,PackageName,PackageName,10,0 FROM Package WHERE ApplicationID = 1 AND PackageName = 'StagingLoad_RBM.PeopleReachedValues.dtsx'

-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
--Scheduler configuration Aphelion.Scheduler
USE [Aphelion.Scheduler]
GO


--application
INSERT INTO [dbo].[Application]
SELECT 'Care' --[ApplicationName]
     , 'Care ETL' --[ApplicationDescription]
     , 'CARER01' --[DatabaseServer]
     , 'Meerkat' --[DatabaseName]
     , NULL --[CubeServer]
     , NULL --[CubeName]
     , 'icmkgil6ip.database.windows.net' --[LogServer]
     , NULL --[TargetMachine]
     , 'icmkgil6ip.database.windows.net' --[LoadQueueServer]
     , 'Aphelion.Care.LoadQueue' --[LoadQueueDatabaseName]
     , 'Scheduler' --[LoadQueueUsername]
     , 'Denali@2011' --[LoadQueuePassword]
     , 'geoffreysmith@aphelion.bi' --[AdminEmail]
     , getdate() --[sys_CreatedOn]
     , system_user --[sys_CreatedBy]
     , getdate() --[sys_ModifiedOn]
     , system_user --[sys_ModifiedBy]

SELECT * FROM Application   
--select getdate()

--ApplicationID = 1
--add schedule for loading excel to meerkatstaging
exec [dbo].[AddSchedule]
      @intApplicationID	= 1
	, @intQueueLoadTypeID = 2 --package		INT = NULL --from LoadQueue database
    --, @tblTableList             [dbo].[TableListType] READONLY --from LoadQueue database
	, @intPackageLoadID = 6--Excel to MeerkatStaging Load			INT --from LoadQueue database
    , @strName = 'Excel to MeerkatStaging Load'
    , @strDescription = 'Excel to MeerkatStaging Load'
    , @strCreatedBy = 'Geoffrey Smith'
    , @intFrequencyTypeID = 4--hourly      INT -- Daily, Weekly, Monthly
	, @intFrequencyInterval = 1--every hour		INT -- every x days/weeks/months
    , @timStartTime = '06:00:00'--08h00 SA time             TIME
	, @timEndTime = '15:00:00'--17h00 SA time             TIME
    , @bitRunBalancing	= 0--		BIT = 0
	, @bitRunSchemaCompare = 0--		BIT = 0
	, @bitRunFKChecks = 0--			BIT = 0