
CREATE PROC [sp_KeyIndicators]
--declare
@OutcomeID int
,@KeyIndicator int = 1
,@LocationID int = 1
,@DataVersionID Int = 0
, @IncludeExtrapolatedTargetDates int = 0
as


SELECT  

--rcdate,rcedate,
DENSE_RANK() OVER (ORDER BY code) % 2 AS RN,

 [dbo].[fn_ConcatenateIndicator_LocationTypeNames] (indicatorID) LocationTypeNames,
--dbo.fn_ConcatenateIndicator_DSName (indicatorid) 
null
DataSourceNames, -- no indicator dsn tbl

CASE WHEN MAX(RowX) over (partition by indicatorid,location_ID) > 1 THEN 
OriginalBaseline + ( (( Target2014 - OriginalBaseline)/  (CAST(MAX(RowX) over (partition by indicatorid,location_ID)  as float) -1))

 )
 * CAST((ROW_NUMBER() over (partition by indicatorid,location_ID order by ReportCycleDate_ID)) -1  as float)
 ELSE 
 OriginalBaseline END
 AS ExtrapolatedTarget,
* 
 FROM (
 SELECT
 
 L.Name LocationName, 
 rc.ID RCDate, -- incorrect as there is no proper dates in reporting cylce
--RCExtrapolated.ReportCycleReportDate_ID RCEDate,
 --i.baseline OriginalBaseline,
 --i.Target Target2014,
ROW_NUMBER() over (partition by i.indicatorid order by rc.StartDateID) as RowX,
CASE WHEN ROW_NUMBER() Over (PARTITION by i.IndicatorID,iv.location_ID order by rc.StartDateID) = 1 THEN i.Baseline
ELSE NULL END

 BaselineStart,

CASE WHEN ROW_NUMBER() Over ( PARTITION by i.IndicatorID,iv.location_ID order by rc.StartDateID DESC) = 1 THEN i.Target
ELSE NULL END TargetEnd, 
MaxValue = CASE WHEN i.Target > i.Baseline AND i.Target > ActualValue 
THEN i.Target
WHEN ActualValue > i.Baseline AND ActualValue  > i.Target 
THEN ActualValue 
ELSE i.Baseline
END,
--ISNULL( RCExtrapolated.FinancialYEar ,rc.FinancialYear) FinancialYear,
null FinancialYear, --rc.FinancialYear need to find new field to substitute for this

DENSE_RANK() OVER (order  by i.Code) IndicatorNum,
iv.Title DataLabel,

om.LongName OutcomeName,
o.LongName OutputName,
so.LongName SubOutputName,
i.LongName IndicatorName,
Path = om.Code + ' 
' + isnull(o.code,'') + ' 
' + isnull(so.code,''),
convert(varchar(20),DDStart.[Date],112) StartDate,
convert(varchar(20),DDEnd.[Date],112) EndDate,
DDEnd.YearNumber,
cast(rc.StartDateID as varchar) + ' - ' + 
cast(rc.EndDateID  as varchar) ReportingPeriod,
--DDNext.TextDate
null NextDate, -- need to get how to 
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID]
      ,/*ISNULL(iv.Baseline, */i.[Baseline]/*)*/ [Baseline]
      ,/*ISNULL(iv.BaselineString, */ i.[BaselineString]/*) */BaselineString
      ,/*ISNULL(iv.TargetValue, */i.Target/*)*/ [TargetValue]
      ,/*ISNULL(iv.TargetValueString,*/ i.TargetString/*)*/ [TargetValueString]
      ,[ActualValue]
      ,[ActualValueString]
      ,ISNULL(iv.[ReleaseDate], i.ReleaseDate) ReleaseDate
      ,ISNULL(iv.[ReportingDate], i.ReportingDate) ReportingDate
      ,[IndicatorReportingDate]
      ,i.UnitOfMeasure
      
      ,i.[Output_ID]
      ,i.[OutcomeID]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,iv.Title
      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue] -- not in table
      ,null [VerifiedActualNotes] -- not in table

      ,i.[IndicatorType_ID]
      ,i.[Activity_ID]
      ,i.[SubOutput_ID]
	  ,i.IndicatorID Indicator_ID
      ,ISNULL([DataVersion_ID],0) DataVersion_ID
      ,i.[Sharepoint_ID]
      ,ISNULL(iv.Location_ID,1) Location_ID
      ,iv.IndicatorStatusPercent      
         
      ,/*ISNULL(iv.ReportCycleDate_ID,*/ rc.StartDateID/*)*/ ReportCycleDate_ID
         
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.outcomeID, o.outcomeid)
      ,RolledUpToOutput_ID = ISNULL(i.output_id, so.output_ID)
      ,RolledUpToSubOutput_ID = i.suboutput_id
      ,RolledUpToActivity_ID = i.activity_ID
          ,TermSetID = DIML.TermsetDeepGrainID
	,i.Baseline OriginalBaseline
	,i.Target Target2014
	,rc.StartDateID ReportingPeriodStartDate_ID
	,rc.EndDateID ReportingPeriodEndDate_ID	
	,null NextReportingPeriodReleaseDate_ID
	
	
	, ParentMDX =  
	CASE WHEN i.OutcomeID IS Not NULL 
	THEN '[Outcome].[Outcome].[' + CAST (i.OutcomeID  as varchar(8)) + ']'
	
	WHEN i.Output_ID IS Not NULL 
	THEN '[Output].[Output].[' + CAST (i.Output_ID as varchar(8))  + ']'
	
	WHEN i.SubOutput_ID IS Not NULL 
	THEN '[Sub Output].[Sub Output].[' + CAST (i.SubOutput_ID as varchar(8)) + ']'
	END 
  FROM app.Indicator i 
  INNER JOIN DimIndicatorMultiLevel DIML
  On i.IndicatorID = DIML.Indicator_ID
  INNER JOIN Core.ReportingPeriod rc
  on 

  rc.StartDateID Between i.BaselineDate_ID and i.TargetDate_ID -- needs to be checked
  
  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID = rc.ReportingPeriod  
LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID
LEFT OUTER JOIN app.SubOutput SO

/*	INNER JOIN dbo.Activity SOA
	on so.SubOutput_ID = soa.SubOutput_ID
	inner join dbo.Milestone AM
		on SOA.Activity_ID = AM.Activity_ID

*/
on i.SubOutput_ID = so.SubOutput_ID 
--OR a. .SubOutputID = so.SubOutput_ID
	

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID

LEFT OUTER JOIN app.Outcome om
on i.OutcomeID = om.OutcomeID
OR o.OutcomeID = om.OutcomeID -- needs to follow convention


LEFT JOIN Core.DimDate DDStart
on rc.StartDateID = DDStart.DateID

LEFT JOIN Core.DimDate DDEnd
on rc.EndDateID = DDEnd.DateID

--LEFT JOIN Core.DimDate DDNext
--on iv.NextReportingPeriodReleaseDate_ID = DDNext.DateKey

LEFT JOIN Core.Location  L
on iv.Location_ID = L.Location_ID



where i.ShortName not like '%overall%'
AND  (ISNULL(i.outcomeID, o.outcomeid) = @OutcomeID OR @OutcomeID = 0 )
and (i.IsKeyIndicator = @KeyIndicator  or @KeyIndicator = 0)
AND (iv.DataVersion_ID = @DataVersionID OR @DataVersionID = 0 OR iv.DataVersion_ID is null)
AND (iv.Location_ID = @LocationID OR @LocationID = 0 OR iv.Location_ID IS NULL)
AND (iv.IndicatorValues_ID IS NOT NULL OR @IncludeExtrapolatedTargetDates =1)
--ORDER BY i.Code
 ) SRC


--where Code = 'STP8.1.4D1'
ORDER BY Code, ReportCycleDate_ID

