

CREATE PROC [dbo].[uspActivityProgress]
--declare
@DataVersion_ID varchar(255)=1
,@Project_ID int 
,@Activity_ID int = 0
AS
/*
--begin
DECLARE @DataVersion_ID varchar(255)=0
,@Activity_ID int = 0
,@Project_ID int = 0
, @Milestone_ID int = 0
*/
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
  
   LEFT JOIN app.Activity a
    on m.Activity_ID = a.Activity_ID
	and (m.Activity_ID = @Activity_ID or @Activity_ID = 0)
	JOIN  app.Project P
		on a.ProjectID = P.ProjectID
		OR m.ProjectID = P.ProjectID
WHERE P.ProjectID = @Project_ID

order by m.Code, RP.StartDateID ASC



GO
--exec [dbo].[uspActivityProgress] 0 , 0
