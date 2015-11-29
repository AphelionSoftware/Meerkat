 
--UPDATE [RBM].[PeopleReachedValues]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE PeopleReachedValues.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
-- GO
--UPDATE [RBM].[MilestoneValues]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE MilestoneValues.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
-- GO 
--UPDATE [RBM].[IndicatorValues]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE IndicatorValues.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
--  GO
--UPDATE [forms].[Form]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE Form.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
--  GO
--UPDATE [forms].[FormResponse]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE FormResponse.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
--  GO
--UPDATE [forms].[Question]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE Question.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
--  GO
--UPDATE [forms].[EventRegister]
--SET Gender_ID = G.Gender_ID
--FROM  disagg.Gender g
--WHERE EventRegister.Gender_ID NOT IN (0,1)
--AND G.Code = 'N/A'
-- GO
--DELETE FROM disagg.Gender
--WHERE CODE  NOT IN ('M', 'F', 'N/A')

 GO

--UPDATE [Core].[ReportingPeriod]
--SET Summary = CAST(StartDateID/10000 as char(4)) 
--+ '-Q' + cast(reportingperiod as char(1))
--+ ' (' + cast(startdateid as char(8))
--+ ' - ' + cast(enddateid as char(8)) 
--+ ')'

GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
update forms.formresponse
set [ReportingPeriod_ID] = [ReportingPeriod_ID] - (208-64) 
where [ReportingPeriod_ID] >= 208

update forms.Question
set [ReportingPeriod_ID] = [ReportingPeriod_ID] - (208-64) 
where [ReportingPeriod_ID] >= 208

update rbm.IndicatorValues
set [ReportPeriodID] = [ReportPeriodID] - (208-64) 
where [ReportPeriodID] >= 208


delete from [Meerkat].[Core].[ReportingPeriod]
where id >= 208

GO
  UPDATE [Core].[ReportingPeriod]
  SET ReportingPeriod = CASE 
  WHEN Summary like '%Q1%' THEN 1
  WHEN Summary like '%Q2%' THEN 2
  WHEN Summary like '%Q3%' THEN 3
  WHEN Summary like '%Q4%' THEN 4
  END


  GO
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


	GO
	UPDATE Core.ReportingPeriod
	SET Summary = LEFT( Summary, 8) + '(' + cast(StartDateID as char(8)) + ' - ' +cast(EndDateID as char(8)) + ')'

	*/