/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
--:r .\CareData\Core.OrganizationType.CARE.PDS.sql
--:r .\CareData\Core.Organization.CARE.PDS.sql
--:r .\app.Outcome.CARE.PDS.sql
--:r .\app.Output.CARE.PDS.sql
--:r .\app.SubOutput.CARE.PDS.sql
--:r .\app.IndicatorMilestone.CARE.PDS.sql
:r .\Core.LocationType.CARE.PDS.sql
:r .\Core.Locations.CARE.PDS.sql
:r .\App.Programme.CARE.PDS.sql
:r .\settings.GlobalSettings.CARE.PDS.sql
						
