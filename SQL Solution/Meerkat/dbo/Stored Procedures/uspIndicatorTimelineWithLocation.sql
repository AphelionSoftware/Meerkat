
/****** Object:  StoredProcedure [dbo].[uspIndicatorTimelineWithLocation]    Script Date: 2013-08-21 04:15:22 PM ******/
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

DENSE_RANK() Over (order by fiv.Code) %2 RN,
UnitOfMeasure,
 Case When 
		(CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(OriginalBaseline,0)
		ELSE NULL END) is null and OriginalBaseline + (
			(
				( FinalTarget - OriginalBaseline) / 
				(	 FinalTargetPeriodID -BaselinePeriodID ) 
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
				( FinalTarget - OriginalBaseline) / 
				(	 FinalTargetPeriodID -BaselinePeriodID ) 
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
				( FinalTarget - OriginalBaseline) / 
				(	 FinalTargetPeriodID -BaselinePeriodID ) 
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
				( FinalTarget - OriginalBaseline) / 
				(	 FinalTargetPeriodID -BaselinePeriodID ) 
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
ISNULL(FIV.LocationName,loc.Name) as LocationName,
Case When FIV.LocationName is Null Then loc.Location_ID Else FIV.Location_ID End as Location_ID,
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

         