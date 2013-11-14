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

DENSE_RANK() Over (order by fiv.Code) %2 RN,
UnitOfMeasure,
 Case When 
        (CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(OriginalBaseline,0)
        ELSE NULL END) is null and OriginalBaseline + (
    (
        Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID )END 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) = OriginalBaseline Then ISNULL(OriginalBaseline,0) 
            Else 
            (CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(OriginalBaseline,0)
        ELSE NULL END)
 End
 BaselineStart,
 
  Case When 
        ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString)
ELSE NULL END) is null and OriginalBaseline + (
    (
        Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID )END 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) = OriginalBaseline Then ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString) 
            Else 
            ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString)
ELSE NULL END)
 End
 /*
 CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString)
ELSE NULL END
*/
 BaselineStartString,

/*CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(FinalTarget,0)
ELSE NULL END */
 Case When 
        ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(FinalTarget,0)
ELSE NULL END) is null and OriginalBaseline + (
    (
        Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID )END 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) = FinalTarget Then ISNULL(FinalTarget,0) 
            Else 
            ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(FinalTarget,0)
ELSE NULL END)
 End
TargetEnd, 
 FinalTarget,
 
 
/*CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString)
ELSE NULL END */
 Case When 
        ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString)
ELSE NULL END) is null and OriginalBaseline + (
    (
        Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID )END 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) = FinalTarget Then ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString) 
            Else 
            ( CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString)
ELSE NULL END)
 End

TargetEndString, 
dbo.fn_StripMDXKey(@DataVersion_ID) DataVersionParm,

FinancialYear,
--FIV.ExtrapolatedTarget,
ISNULL(FIV.LocationName,LocationName) as LocationName,
Case When FIV.LocationName is Null Then Location_ID Else FIV.Location_ID End as Location_ID,
FIV.IndicatorValues_ID, FIV.Indicator_ID
,FIV.Notes,FIV.Title,FIV.DataVersion_ID,
 FIV.ReportCycle, FIV.LongName, FIV.Code, FIV.ShortName
, FIV.Baseline, FIV.BaselineString
, ISNULL(FIV.TargetValue, 0) AS TargetValue
, FIV.TargetValueString
, ISNULL(FIV.ActualValue ,0) --FIV.Baseline)--CASE WHEN Title IS null OR Title = '' then null else 0 end)
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
        Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID )END 
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
SELECT  ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,[ActualValue]
      ,[ActualLabel]
      ,iv.[BusinessKey]
      ,iv.[Notes]
      ,iv.ActualLabel Title
      --,iv.Title
      ,ISNULL(iv.[DataVersion_ID],-1) DataVersion_ID
      --,ISNULL(iv.Location_ID,-1) Location_ID
      ,RolledUpToOutcome_ID = ISNULL(TargetFIV.OutcomeID, o.OutcomeID)
      ,RolledUpToOutput_ID = ISNULL(TargetFIV.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = TargetFIV.SubOutput_ID
    ,so.ShortName as SubOutputSN
    ,o.ShortName as OutputSN
, TargetFIV.* FROM  (

    SELECT 
    Location.Location_ID,
    Location.Geog,
    rc.ID ReportingPeriod,
    i.UnitOfMeasure,
    rc.YearNumber financialYear,
    ROW_NUMBER() over (partition by i.IndicatorID order by rc.StartDateID) as RowX
          ,i.[IndicatorID] [Indicator_ID]
          ,i.[Baseline] [Baseline]
          , i.[BaselineString] BaselineString
          ,i.Target [TargetValue]
          ,i.TargetString [TargetValueString]
          ,i.[Output_ID]
          ,i.[OutcomeID]
          ,rc.ReportingPeriod ReportCycle
          ,i.ShortName
          ,i.Code
          ,i.LongName
          ,null [VerifiedActualValue]
          ,null [VerifiedActualNotes]

          ,i.[IndicatorType_ID]
          --,i.[Activity_ID]
          ,i.[SubOutput_ID]
         
          ,rc.EndDateID  ReportCycleDate_ID
          ,rc.StartDateID ReportCycleStartDateID
                         ,i.BaselineDate
          ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
          ,i.TargetDate
           ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
        ,i.Baseline OriginalBaseline
        ,i.Target FinalTarget
        --,rc.StartDateID ReportingPeriodStartDate_ID
        --,rc.EndDateID 	
        ,null NextReportingPeriodReleaseDate_ID
        ,Location.Name LocationName
        ,FinalTargetPeriod.ID FinalTargetPeriodID
        ,rc.ID CurrentReportPeriodID
        ,BaselinePeriod.ID BaselinePeriodID
          FROM app.Indicator i 
      INNER JOIN Core.ReportingPeriod rc
          on rc.EndDateID >=   i.BaselineDate_ID 
        and rc.StartDateID <= i.TargetDate_ID
  
        INNER JOIN Core.ReportingPeriod FinalTargetPeriod
          ON i.TargetDate_ID BETWEEN
           FinalTargetPeriod.StartDateID  AND
           FinalTargetPeriod.EndDateID 
    
        INNER JOIN Core.ReportingPeriod BaselinePeriod
          ON i.BaselineDate_ID BETWEEN
          BaselinePeriod.StartDateID 
          AND 	  BaselinePeriod.EndDateID 

    CROSS JOIN Core.Location
) TargetFIV 

LEFT JOIN RBM.IndicatorValues IV 
ON TargetFIV.ReportingPeriod = IV.ReportPeriodID
    and TargetFIV.Location_ID = IV.Location_ID

LEFT JOIN app.SubOutput SO
    ON TargetFIV.SubOutput_ID = SO.SubOutput_ID

LEFT JOIN app.Output O 
    ON TargetFIV.Output_ID = O.Output_ID
        OR SO.Output_ID = O.Output_ID

LEFT JOIN app.Outcome OM 
    ON TargetFIV.OutcomeID = OM.OutcomeID
        OR  O.OutcomeID = OM.OutcomeID


) FIV
where (Indicator_ID = @indicator_id OR @indicator_id  = 0 ) 


order by ReportCycleDate_ID ASC

GO

--exec uspIndicatorTimelineWithLocation 1,1 