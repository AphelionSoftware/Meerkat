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
/*:r .\Core.OrganizationType.Demo.PDS.sql
:r .\Core.Organization.Demo.PDS.sql
:r .\app.Output.Demo.PDS.sql
:r .\app.SubOutput.Demo.PDS.sql
:r .\app.IndicatorMilestone.Demo.PDS.sql
:r .\Core.LocationType.Demo.PDS.sql
:r .\Core.Locations.Demo.PDS.sql	
:r .\RBM.DemoValues.Demo.PDS.sql						
*/