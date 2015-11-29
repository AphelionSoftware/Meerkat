CREATE PROC [dbo].[uspIndicatorTimeline_ByDisagg]

	@DataVersion_ID int --varchar(255)
, @indicator_id int --varchar(255)
,@AgeBand_ID		   int = 0
,@CommunityType_ID	   int = 0
,@Gender_ID			   int = 0
,@Group_ID			   int = 0
,@Institution_ID		   int = 0
,@IndicatorSimpleType_ID		   int = 0
,@ResultArea_ID			  int = 0
,@Framework_ID			  int = 0
,@Donor_ID			  int = 0
 
,@Structure_ID			  int = 0
  
,@Location_ID			  int = 0
,@LocationType_ID		  int = 0
 

AS
 

SELECT    

DENSE_RANK() Over (order by Code) %2 RN,
UnitOfMeasure,
CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(OriginalBaseline,0)
ELSE NULL END  BaselineStart,
 
 CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID) = 1 THEN ISNULL(CAST(OriginalBaseline as varchar(255)), BaselineString)
ELSE NULL END

 BaselineStartString,

CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(FinalTarget,0)
ELSE NULL END TargetEnd, 
 FinalTarget,
 
 
CASE WHEN ROW_NUMBER() Over (order by ReportCycleDate_ID DESC) = 1 THEN ISNULL(Cast(FinalTarget as varchar(255)), TargetValueString)
ELSE NULL END TargetEndString, 
dbo.fn_StripMDXKey(@DataVersion_ID) DataVersionParm,

FinancialYear
 
, FIV.Indicator_ID
 
 ,FIV.ReportCycle, FIV.LongName, FIV.Code, FIV.ShortName
, FIV.Baseline, FIV.BaselineString
, ISNULL(FIV.TargetValue, 0) AS TargetValue
, FIV.TargetValueString
, ISNULL(FIV.ActualValue , CASE WHEN [ActualLabel] IS null OR [ActualLabel] = '' then null else 0 end)
                         AS ActualValue
                         , FIV.ActualLabel
                         , 'Total:' +  CAST( FORMAT(ROUND(FIV.ActualValue,0),'#,0.0000')    as varchar(255)) + ISNULL('\n' + FIV.ActualLabel,'')  As Title

                         , FIV.ReportCycleDate_ID, 
                         CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) AS ReportCycleDate
                         
 
,   OriginalBaseline + (
    (
		Case wHEN FinalTargetPeriodID -BaselinePeriodID = 0 THEN 0 ELSE ( FinalTarget - OriginalBaseline) / 
		(	 FinalTargetPeriodID -BaselinePeriodID )END 
		)
	* (CurrentReportPeriodID-BaselinePeriodID)
	)
 
 AS ExtrapolatedTarget
 

 FROM 

 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualLabel]
      ,i.[Output_ID]
      ,i.[Outcome_ID]

      ,rc.ReportingPeriod ReportCycle
      ,i.ShortName
      ,i.Code
      ,i.LongName
      ,null [VerifiedActualValue]
      ,null [VerifiedActualNotes]

      ,i.[IndicatorType_ID]
      ,i.[SubOutput_ID]
 

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.Outcome_ID, o.Outcome_ID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
	,i.Baseline OriginalBaseline
	,i.Target FinalTarget
	,null NextReportingPeriodReleaseDate_ID
	,FinalTargetPeriod.ID FinalTargetPeriodID
	,rc.ID CurrentReportPeriodID
	,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  CROSS APPLY ( SELECT ActualLabel + ' \n '
					FROM RBM.IndicatorValues IVInner
					INNER JOIN Core.Location LInner
						ON IVInner.Location_ID = LInner.Location_ID
					WHERE I.IndicatorID = IVInner.Indicator_ID
					AND NOT 
						
					TRY_PARSE(IVInner.ActualLabel AS decimal(20,5))  = IVInner.ActualValue 
					 and IVInner.ReportPeriodID  = rc.ID 
					and  (@DataVersion_ID <= 0 OR IVInner.DataVersion_ID = @DataVersion_ID)
						AND (IVInner.AgeBand_ID		  =  @AgeBand_ID			  OR  @AgeBand_ID		 = 0)
						AND (IVInner.CommunityType_ID =  @CommunityType_ID  OR 	  @CommunityType_ID	 = 0)
						AND (IVInner.Gender_ID		  =  @Gender_ID			  OR  @Gender_ID		 = 0)
						AND (IVInner.Group_ID		  =  @Group_ID		  OR 	  @Group_ID			 = 0)
						AND (IVInner.Institution_ID	  = @Institution_ID		  OR @Institution_ID	 = 0)
						AND (IVInner.Donor_ID         =  @Donor_ID OR  @Donor_ID = 0)
						AND (IVInner.Structure_ID	  =		@Structure_ID			OR @Structure_ID		 =  0) 
						AND (IVInner.Location_ID	  =		@Location_ID			OR @Location_ID		 =  0) 
						AND (LInner.LocationType_ID   = @LocationType_ID OR @LocationType_ID    = 0 )
						
					FOR XML PATH('') ) IVLabel (ActualLabel) 
 CROSS APPLY ( SELECT SUM(ActualValue) ActualValue   
				FROM RBM.IndicatorValues IVInner
				
					INNER JOIN Core.Location LInner
						ON IVInner.Location_ID = LInner.Location_ID
					WHERE I.IndicatorID = IVInner.Indicator_ID
					 and IVInner.ReportPeriodID  = rc.ID 
					and  (@DataVersion_ID <= 0 OR IVInner.DataVersion_ID = @DataVersion_ID)
						AND (IVInner.AgeBand_ID		=  @AgeBand_ID			  OR  @AgeBand_ID		 = 0)
						AND (IVInner.CommunityType_ID=  @CommunityType_ID  OR 	  @CommunityType_ID	 = 0)
						AND (IVInner.Gender_ID		=  @Gender_ID			  OR  @Gender_ID		 = 0)
						AND (IVInner.Group_ID		=  @Group_ID		  OR 	  @Group_ID			 = 0)
						AND (IVInner.Institution_ID	= @Institution_ID		  OR @Institution_ID	 = 0)
						AND (IVInner.Donor_ID =  @Donor_ID OR  @Donor_ID = 0)
						AND (IVInner.Structure_ID			=		@Structure_ID			OR @Structure_ID		 =  0) 
						AND (IVInner.Location_ID			=		@Location_ID			OR @Location_ID		 =  0) 
						AND (LInner.LocationType_ID         = @LocationType_ID OR @LocationType_ID    = 0 )
					) IV (ActualValue)
   
 																			  
  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
	INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
   
 
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
 
  WHERE (I.IndicatorSimpleType_ID =  @IndicatorSimpleType_ID OR  @IndicatorSimpleType_ID = 0)
	AND (I.ResultArea_ID =  @ResultArea_ID OR  @ResultArea_ID = 0)

	AND (@Framework_ID = 0 OR 
		EXISTS (SELECT 1 FROM [disagg].[FrameworkDetail_Indicator] FDI
					INNER JOIN disagg.FrameworkDetail FD ON FDI.FrameworkDetail_ID = FD.FrameworkDetail_ID
				WHERE FD.Framework_ID = @Framework_ID
					AND FDI.IndicatorID = I.IndicatorID
					)
					)
/*
*/
) FIV


where (Indicator_ID = @indicator_id OR @indicator_id  = 0 ) 

order by ReportCycleDate_ID ASC