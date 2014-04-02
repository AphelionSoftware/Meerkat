



CREATE PROC [dbo].[uspIndicatorTimeline]

	@DataVersion_ID int --varchar(255)
, @indicator_id int --varchar(255)
, @TermSetIndicator_ID int--varchar(255)
, @Location_ID int =1 
--, @Location_ID int =1 
AS
/*
declare 
@DataVersion_ID int  = 40
, @indicator_id int = 751
, @TermSetIndicator_ID int = 0
, @Location_ID int =1 
*/

SELECT    

DENSE_RANK() Over (order by code) %2 RN,
UnitOfMeasure,
CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(OriginalBaseline,0)
ELSE NULL END

 BaselineStart,
 
 CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString)
ELSE NULL END

 BaselineStartString,

CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(FinalTarget,0)
ELSE NULL END TargetEnd, 
 FinalTarget,
 
 
CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString)
ELSE NULL END TargetEndString, 
dbo.fn_StripMDXKey(@DataVersion_ID) DataVersionParm,

FinancialYear,
--FIV.ExtrapolatedTarget,
FIV.LocationName,
FIV.IndicatorValues_ID, FIV.Indicator_ID
,FIV.Notes,FIV.Title,FIV.DataVersion_ID,
 FIV.ReportCycle, FIV.LongName, FIV.Code, FIV.ShortName
, FIV.Baseline, FIV.BaselineString
, ISNULL(FIV.TargetValue, 0) AS TargetValue
, FIV.TargetValueString
, ISNULL(FIV.ActualValue , CASE WHEN Title IS null OR Title = '' then null else 0 end)
                         AS ActualValue
                         , FIV.ActualValueString
                         , FIV.ReleaseDate
                         , FIV.ReportingDate
                         , FIV.IndicatorReportingDate
                         , FIV.IndicatorStatusPercent
                         , FIV.ReportCycleDate_ID, 
                         CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) AS ReportCycleDate
                         


--MAX(RowX) over (partition by indicator_id),
--ROW_NUMBER() over (partition by indicator_id order by ReportCycleDate_ID desc) ,
, --CASE WHEN RowX > 1 THEN 
 /*OriginalBaseline + ( (( FinalTarget - OriginalBaseline)/  (CAST(MAX(RowX) over (partition by indicator_id)  as float) -1))
  * CAST((ROW_NUMBER() over (partition by indicator_id order by ReportCycleDate_ID)) -1  as float) )*/
  OriginalBaseline + (
    (
		( FinalTarget - OriginalBaseline) / 
		(	 FinalTargetPeriodID -BaselinePeriodID ) 
		)
	* (CurrentReportPeriodID-BaselinePeriodID)
	)
 --ELSE 
 --Baseline END
 AS ExtrapolatedTarget


 FROM 

 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
ROW_NUMBER() over (partition by i.indicatorid order by rc.StartDateID) as RowX,
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualValueString]
      ,ISNULL(iv.[ReleaseDate], i.ReleaseDate) ReleaseDate
      ,ISNULL(iv.[ReportingDate], i.ReportingDate) ReportingDate
      ,[IndicatorReportingDate]
      ,i.[Output_ID]
      ,i.[OutcomeID]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,ISNULL(iv.Title, iv.ActualValueString) Title
      --,iv.Title
      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue]
      ,null [VerifiedActualNotes]

      ,i.[IndicatorType_ID]
      ,i.[Activity_ID]
      ,i.[SubOutput_ID]
      ,ISNULL(iv.[DataVersion_ID],0) DataVersion_ID
      ,ISNULL(iv.Location_ID,1) Location_ID
      ,iv.IndicatorStatusPercent      
         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.outcomeID, o.outcomeid)
      ,RolledUpToOutput_ID = ISNULL(i.output_id, so.output_ID)
      ,RolledUpToSubOutput_ID = i.suboutput_id
      ,RolledUpToActivity_ID = i.activity_ID
      --  ,TermSetID = DIML.TermsetDeepGrainID
	,i.Baseline OriginalBaseline
	,i.Target FinalTarget
	--,rc.StartDateID ReportingPeriodStartDate_ID
	--,rc.EndDateID 	
	,null NextReportingPeriodReleaseDate_ID
	,l.Name LocationName
	,FinalTargetPeriod.ID FinalTargetPeriodID
	,rc.ID CurrentReportPeriodID
	,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.id 
 

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
	INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
    inner join 
  
  Core.DataVersion DDV 
  
  ON (CHARINDEX('level',@DataVersion_ID) = 0 
  AND DDV.DataVersion_ID  = dbo.fn_StripMDXKey(@DataVersion_ID)
  )
  OR ( CHARINDEX('level',@DataVersion_ID) > 0 
  AND DDV.DataVersionLevel_ID = dbo.fn_StripMDXKey(@DataVersion_ID)
  AND DDV.Outcome_ID IS NULL
  )
  
  

    and  (
    
    (iv.DataVersion_ID = DDV.DataVersion_ID OR iv.DataVersion_ID is null)
    OR ( iv.DataVersion_ID  IN (SELECT DataVersion_ID FROM Core.DataVersion DV WHERE DV.DataVersionLevel_ID = DDV.DataVersionLevel_ID )
and DDV.Outcome_ID is null
)

    
    )
    and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    
    
LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID
LEFT OUTER JOIN app.SubOutput SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID OR @Location_ID = l.Location_ID)



  --where 
/*
*/
) FIV


where (Indicator_ID = dbo.fn_StripMDXKey(@indicator_id) OR (dbo.fn_StripMDXKey(@indicator_id)  = 0 AND NOT @TermSetIndicator_ID ='0') )

--AND (

--CAST([TermSetID] as varchar(255)) = dbo.fn_StripMDXKey(@TermSetIndicator_ID )

 --OR @TermSetIndicator_ID = '0') 


--and ReportCycleDate_ID >= 20090101

and ReportCycle not like '%pre%'
--and (Location_ID = @Location_ID OR @Location_ID = 0 OR @Location_ID iS NULL)

order by ReportCycleDate_ID ASC





