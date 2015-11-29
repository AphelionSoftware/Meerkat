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
INSERT  INTO Core.ReportingPeriod
        ( [Core].[ReportingPeriod].[ReportingPeriod] ,
          [Core].[ReportingPeriod].[StartDateID] ,
          [Core].[ReportingPeriod].[EndDateID] ,
          [Core].[ReportingPeriod].[FirstCycleDate] ,
          [Core].[ReportingPeriod].[LastCycleDate] ,
          [Core].[ReportingPeriod].[YearName] ,
          [Core].[ReportingPeriod].[YearNumber],
          [Core].[ReportingPeriod].[Summary],
		  [Core].[ReportingPeriod].[BusinessKey]
        )
        SELECT  rc.[ReportingPeriod] ,
                rc.[StartDateID] ,
                rc.[EndDateID] ,
                rc.[FirstCycleDate] ,
                rc.[LastCycleDate] ,
                rc.[YearName] ,
                rc.[YearNumber],
                CONCAT(rc.[YearNumber],' - ',rc.[ReportingPeriod]),
				rc.[ReportingPeriod]
        FROM    [Core].[ReportCycle] AS rc
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.ReportingPeriod
                             WHERE  [Core].[ReportingPeriod].[StartDateID] = rc.StartDateID
                                    AND [Core].[ReportingPeriod].[EndDateID] = rc.EndDateID )



GO

update CORE.ReportingPeriod
set summary = 
	YearName + '-Q' + CAST(RIGHT([ReportingPeriod],1) as char(1)) 
	+ ' (' + Cast(startdateid as char(8)) 
	+ ' - ' + Cast(enddateid as char(8))
	+ ')'