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
set identity_insert disagg.age on
insert into disagg.age (age_id)
select rn -1 from (
select row_number() over(order by name) rn

from sys.all_objects
) src
where rn <= 120
and not exists
(SELECT 1 FROM disagg.Age
where age.Age_ID = rn-1)

set identity_insert disagg.age off
