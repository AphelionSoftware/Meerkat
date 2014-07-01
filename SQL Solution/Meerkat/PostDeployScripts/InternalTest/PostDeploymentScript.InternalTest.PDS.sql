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
:r .\Core.OrganizationTypes.InternalTest.PDS.sql
:r .\Core.Organization.InternalTest.PDS.sql
:r .\app.Programme.InternalTest.PDS.sql
:r .\app.Sector.InternalTest.PDS.sql
:r .\app.Project.InternalTest.PDS.sql
:r .\app.Outcome.InternalTest.PDS.sql
:r .\app.Output.InternalTest.PDS.sql
:r .\app.SubOutput.InternalTest.PDS.sql
:r .\app.Indicator.InternalTest.PDS.sql
:r .\Core.LocationTypes.InternalTest.PDS.sql
:r .\Core.Locations.InternalTest.PDS.sql	


:r .\forms.Form.InternalTest.PDS.sql		
:r .\forms.Category.InternalTest.PDS.sql		
:r .\forms.Question.InternalTest.PDS.sql		
:r .\forms.FormResponse.InternalTest.PDS.sql	
:r .\forms.Response.InternalTest.PDS.sql		
	

				
