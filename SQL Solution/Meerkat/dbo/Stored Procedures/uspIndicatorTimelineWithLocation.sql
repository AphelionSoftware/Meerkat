
/****** Object:  StoredProcedure [dbo].[uspIndicatorTimelineWithLocation]    Script Date: 2013-08-21 11:17:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[uspIndicatorTimelineWithLocation]

	@DataVersion_ID int --varchar(255)
, @indicator_id int --varchar(255)
--, @Location_ID int =0 
--, @Location_ID int =1 
AS
/*
declare 
@DataVersion_ID int  = 0
, @indicator_id int = 1
--, @TermSetIndicator_ID int = 0
, @Location_ID int =0 
*/

SELECT    

DENSE_RANK() Over (order by Code) %2 RN,
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
fiv.Location_ID,
FIV.IndicatorValues_ID, FIV.Indicator_ID
,FIV.Notes,FIV.Title,FIV.DataVersion_ID,
 FIV.ReportCycle, FIV.LongName, FIV.Code, FIV.ShortName
, FIV.Baseline, FIV.BaselineString
, ISNULL(FIV.TargetValue, 0) AS TargetValue
, FIV.TargetValueString
, ISNULL(FIV.ActualValue , FIV.Baseline)--CASE WHEN Title IS null OR Title = '' then null else 0 end)
                         AS ActualValue
                         , FIV.ActualLabel

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
 ,fiv.SubOutputSN
 ,fiv.OutputSN

 FROM 

 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
ROW_NUMBER() over (partition by i.IndicatorID order by rc.StartDateID) as RowX,
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualLabel]
      ,i.[Output_ID]
      ,i.[OutcomeID]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,iv.ActualLabel Title
      --,iv.Title
      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue]
      ,null [VerifiedActualNotes]

      ,i.[IndicatorType_ID]
      --,i.[Activity_ID]
      ,i.[SubOutput_ID]
      ,ISNULL(iv.[DataVersion_ID],0) DataVersion_ID

      ,ISNULL(iv.Location_ID,1) Location_ID

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.OutcomeID, o.OutcomeID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
      --,RolledUpToActivity_ID = i.Activity_ID
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
	,so.ShortName as SubOutputSN
	,o.ShortName as OutputSN
	
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.ID 
	and  (@DataVersion_ID = 0 OR iv.DataVersion_ID = @DataVersion_ID)
	--and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
	INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
  
  
    
    
/*LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID*/
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID )



  --where 
/*
*/
) FIV


where (Indicator_ID = @indicator_id OR @indicator_id  = 0 ) 


order by ReportCycleDate_ID ASC


GO


