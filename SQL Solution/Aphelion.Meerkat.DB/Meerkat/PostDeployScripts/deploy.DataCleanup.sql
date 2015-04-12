 
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
