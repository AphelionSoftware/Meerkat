﻿

CREATE PROC [dbo].[uspProject_ActivityProgress]
--declare

@MDXKey varchar(255),
@DataVersion_ID varchar(255) = 0

,@AgeBand_ID		   	  int = 0
,@CommunityType_ID	   	  int = 0
,@Gender_ID			   	  int = 0
,@Group_ID			   	  int = 0
,@Institution_ID		  int = 0
,@ResultArea_ID			  int = 0
,@Framework_ID			  int = 0
,@Donor_ID				  int = 0
,@StrategicElement_ID	  int = 0
AS

DECLARE @Activity_ID int = 0
,@Project_ID int = 0

IF CHARINDEX('PRJ', @MDXKey ) > 0 OR CHARINDEX('Proj', @MDXKey ) > 0 
SET @Project_ID = dbo.fn_StripMDXKey(@MDXKey)
ELSE
SET @Activity_ID = dbo.fn_StripMDXKey(@MDXKey)



SELECT    

DENSE_RANK() over(order by m.Code)  %2  RN,
p.Code ProjectCode,
p.LongName ProjectLongName,
CONVERT(Date, CAST(RP.StartDateID as char(8))) ReportingPeriodStartDate,
CONVERT(Date, CAST(RP.EndDateID as char(8))) ReportingPeriodEndDate,

/*case when (mv.ActualValue / m.Target * 100) >= 100 then RPEnd.YearName else null end*/RPEnd.YearName  CompletionFinancialYear,
/*case when (mv.ActualValue / m.Target * 100) >= 100 then RPEnd.ReportingPeriod else null end*/RPEnd.ReportingPeriod  CompletionCycle,

mv.MilestoneValues_ID MID,
m.Code MilestoneCode,
m.LongName MilestoneLongName,
 m.Target AS TargetValue,
  mv.ActualValue ActualValue,
  (mv.ActualValue / m.Target * 100) MilestoneProgressPercent,
  
mv.DataVersion_ID newDV,
RP.YearName FinancialYear
,RP.ReportingPeriod ReportCycle,
RPEnd.EndDateID ,
DATEADD(d, 
(DATEDIFF(D,m.BaselineDate, case when (mv.ActualValue / m.Target)=100 then mv.ActualDate else null end) * (mv.ActualValue / m.Target * 100))
, m.BaselineDate) MilestoneCurrentDate,

mv.Milestone_ID, 
a.LongName ActivityLongName,
a.ShortName ActivityCode,
m.BaselineDate MilestoneStartDate,
CONVERT(varchar(10),m.TargetDate,111) MilestoneCompletionDate ,
 CAST(RP.StartDateID as varchar(255)) + ' - ' +  CAST(rp.EndDateID as varchar(255)) as ReportingPeriod,
      RP.StartDateID ReportingPeriodStartDate_ID
      ,RP.EndDateID ReportingPeriodEndDate_ID,
	  RP.EndDateID EndingReportCycleReportDate_ID,
mv.MilestoneValues_ID ActivityMilestone_ID, 
null RolledUpToActivity_ID
,mv.Notes,
mv.ActualLabel Title,
mv.DataVersion_ID,
 m.LongName, m.Code, m.ShortName
, m.Baseline, m.BaselineString

, m.TargetString TargetValueString

                         
                         , mv.ActualLabel ActualValueString
                         , m.ReleaseDate
                         , m.ReportingDate
                         
						 ,RPEnd.EndDateID MilestoneCompletionEndCycleDate_ID
						 ,RPEnd.EndDateID MilestoneCompletionDate_ID
                         , m.BaselineDateID MilestoneStartDate_ID
                         ,RP.StartDateID ReportCycleDate_ID, 
                         convert(date,CAST(RPEnd.EndDateID as char(8))) AS ReportCycleDate
                         

  FROM 
  app.Milestone M
  
  INNER JOIN Core.ReportingPeriod RP 
  on  
  (RP.StartDateID BETWEEN M.BaselineDateID AND M.TargetDateID
	 AND RP.EndDateID BETWEEN M.BaselineDateID AND M.TargetDateID)
	 OR (M.BaselineDateID BETWEEN RP.StartDateID AND RP.EndDateID)
	 OR (M.TargetDateID BETWEEN RP.StartDateID AND RP.EndDateID)

	 INNER JOIN Core.ReportingPeriod RPStart
	 ON M.BaselineDateID BETWEEN RPStart.StartDateID AND RPStart.EndDateID

	  JOIN Core.ReportingPeriod RPEnd
	 ON M.TargetDateID BETWEEN RPEnd.StartDateID AND RPEnd.EndDateID


  LEFT JOIN RBM.MilestoneValues mv
  on M.MilestoneID = mv.Milestone_ID
  AND (MV.DataVersion_ID =  @DataVersion_ID OR @DataVersion_ID = 0 )
  AND MV.ReportPeriodID = RP.ID
  

  
  AND ( AgeBand_ID		    = @AgeBand_ID		   	  OR  @AgeBand_ID		   	= 0 ) 
  AND ( CommunityType_ID	= @CommunityType_ID	   	  OR  @CommunityType_ID	   	= 0 ) 
  AND ( Gender_ID			= @Gender_ID			  OR  @Gender_ID			= -1) 	
  AND ( Group_ID			= @Group_ID			   	  OR  @Group_ID			   	= 0 ) 
  AND ( Institution_ID		= @Institution_ID		  OR  @Institution_ID		= 0 ) 
  AND ( ResultArea_ID		= @ResultArea_ID		  OR  @ResultArea_ID		= 0 ) 
  AND ( Framework_ID		= @Framework_ID			  OR  @Framework_ID			= 0 ) 
  AND ( Donor_ID			= @Donor_ID				  OR  @Donor_ID				= 0 ) 
  AND ( StrategicElement_ID = @StrategicElement_ID	  OR  @StrategicElement_ID	= 0 ) 



   LEFT JOIN app.Activity a
    on m.Activity_ID = a.Activity_ID
	JOIN  app.Project P
	on (a.ProjectID = P.ProjectID
		or m.ProjectID = P.ProjectID)

where 
(a.Activity_ID = @Activity_ID OR @Activity_ID = 0)
AND
(p.ProjectID = @Project_ID OR @Project_ID = 0)

order by m.Code, RP.StartDateID ASC