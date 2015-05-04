 
UPDATE [RBM].[PeopleReachedValues]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE PeopleReachedValues.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [RBM].[MilestoneValues]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE MilestoneValues.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [RBM].[IndicatorValues]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE IndicatorValues.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [forms].[Form]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE Form.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [forms].[FormResponse]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE FormResponse.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [forms].[Question]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE Question.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'
 
UPDATE [forms].[EventRegister]
SET Gender_ID = G.Gender_ID
FROM  disagg.Gender g
WHERE EventRegister.Gender_ID NOT IN (0,1)
AND G.Code = 'N/A'

DELETE FROM disagg.Gender
WHERE CODE  NOT IN ('M', 'F', 'N/A')



UPDATE [Core].[ReportingPeriod]
SET Summary = CAST(StartDateID/10000 as char(4)) 
+ '-Q' + cast(reportingperiod as char(1))
+ ' (' + cast(startdateid as char(8))
+ ' - ' + cast(enddateid as char(8)) 
+ ')'


use Maskax

go

UPDATE [Core].[ReportingPeriod]
SET Summary = CAST(StartDateID/10000 as char(4)) 
+ '-Q' + cast(reportingperiod as char(1))
+ ' (' + cast(startdateid as char(8))
+ ' - ' + cast(enddateid as char(8)) 
+ ')'


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
update [forms].[FormResponse]
set ReportingPeriod_ID = ReportingPeriod_ID + 144 
where	ReportingPeriod_ID  < 64
GO
update [forms].[Question]
set ReportingPeriod_ID = ReportingPeriod_ID + 144 
where	ReportingPeriod_ID  < 64
GO
update [RBM].[IndicatorValues]
set ReportPeriodID = ReportPeriodID + 144 
where	ReportPeriodID  < 64
GO
update [RBM].[MilestoneValues]
set ReportPeriodID = ReportPeriodID + 144 
where	ReportPeriodID  < 64
GO
update [RBM].[StatusValues]
set ReportingPeriodID = ReportingPeriodID + 144 
where	ReportingPeriodID  < 64
GO
update [Core].[ReportingPeriod]
set ReportingPeriod = ReportingPeriod + 144 
where	ReportingPeriod  < 64
GO
update [RBM].[PeopleReachedValues]
set ReportingPeriod_ID = ReportingPeriod_ID + 144 
where	ReportingPeriod_ID  < 64
GO
update [forms].[Form]
set ReportingPeriod_ID = ReportingPeriod_ID + 144 
where	ReportingPeriod_ID  < 64
GO

DELETE FROM Core.ReportingPeriod WHERE ID < 64 


  UPDATE [Core].[ReportingPeriod]
  SET ReportingPeriod = CASE 
  WHEN Summary like '%Q1%' THEN 1
  WHEN Summary like '%Q2%' THEN 2
  WHEN Summary like '%Q3%' THEN 3
  WHEN Summary like '%Q4%' THEN 4
  END



  UPDATE [Core].[ReportingPeriod]
  SET FirstCycleDate = 
	CASE WHEN ReportingPeriod = 1 THEN CAST( YearName + '/01/01' as Date)
	     WHEN ReportingPeriod = 2 THEN CAST( YearName + '/04/01' as Date)
	     WHEN ReportingPeriod = 3 THEN CAST( YearName + '/07/01' as Date)
	     WHEN ReportingPeriod = 4 THEN CAST( YearName + '/10/01' as Date)
	END
, LastCycleDate = 
	CASE WHEN ReportingPeriod = 1 THEN CAST( YearName + '/03/31' as Date)
	     WHEN ReportingPeriod = 2 THEN CAST( YearName + '/06/30' as Date)
	     WHEN ReportingPeriod = 3 THEN CAST( YearName + '/09/30' as Date)
	     WHEN ReportingPeriod = 4 THEN CAST( YearName + '/12/31' as Date)
	END
, StartDateID = 
	CASE WHEN ReportingPeriod = 1 THEN CAST( YearName + '0101' as int)
	     WHEN ReportingPeriod = 2 THEN CAST( YearName + '0401' as int)
	     WHEN ReportingPeriod = 3 THEN CAST( YearName + '0701' as int)
	     WHEN ReportingPeriod = 4 THEN CAST( YearName + '1001' as int)
	END
, EndDateID = 
	CASE WHEN ReportingPeriod = 1 THEN CAST( YearName + '0331' as int)
	     WHEN ReportingPeriod = 2 THEN CAST( YearName + '0630' as int)
	     WHEN ReportingPeriod = 3 THEN CAST( YearName + '0930' as int)
	     WHEN ReportingPeriod = 4 THEN CAST( YearName + '1231' as int)
	END

