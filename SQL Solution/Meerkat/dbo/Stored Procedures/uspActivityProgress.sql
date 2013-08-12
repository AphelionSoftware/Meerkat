



--CREATE PROC [dbo].[uspActivityProgress]
----declare
--@DataVersion_ID varchar(255)=5
--, @MDXRolledUpToActivity_ID varchar(255)
--,@Activity_ID int = 0
--, @Milestone_ID int = 0
--AS

----begin
--SELECT    

--DENSE_RANK() over(order by m.code)  %2  RN,
--p.Code ProjectCode,
--p.LongName ProjectLongName,

--case when mv.MilestoneStatusPercent=100 then rc.YearName else null end CompletionFinancialYear,
--case when mv.MilestoneStatusPercent=100 then rc.ReportingPeriod else null end CompletionCycle,
--mv.MilestoneValues_ID mid,
--m.Code MilestoneCode,
--m.LongName MilestoneLongName,
--dbo.fn_StripMDXKey(@DataVersion_ID) parmDataVersion_ID,
--dbo.fn_StripMDXKey(@MDXRolledUpToActivity_ID) parmMdxRolledUpToActivity,
-- m.Target AS TargetValue,
--  mv.ActualValue ActualValue,
--  mv.MilestoneStatusPercent MilestoneProgressPercent,
  
--mv.DataVersion_ID newDV,
--RC.YearName EndingPeriodFinancialYear
--,RC.ReportingPeriod EndingPeriodReportCycle,
--rc.EndDateID,
--DATEADD(d, 
--(DATEDIFF(D,m.BaselineDate, case when mv.MilestoneStatusPercent=100 then mv.ActualDate else null end) * mv.MilestoneStatusPercent)
--, m.BaselineDate) MilestoneCurrentDate,
--rc.FirstCycleDate ReportingPeriodStartDate,
--rc.LastCycleDate ReportingPeriodEndDate,

--mv.Milestone_ID, 
--a.LongName ActivityLongName,
--a.ShortName ActivityCode,
--m.BaselineDate MilestoneStartDate,
--mv.ActualDate MilestoneCompletionDate ,
-- CAST(rc.StartDateID as varchar(255)) + ' - ' +  CAST(rc.EndDateID as varchar(255)) as ReportingPeriod,
--      rc.StartDateID ReportingPeriodStartDate_ID
--      ,rc.EndDateID ReportingPeriodEndDate_ID,
--	  rc.EndDateID EndingReportCycleReportDate_ID,
--mv.MilestoneValues_ID ActivityMilestone_ID, 
--null RolledUpToActivity_ID
--,mv.Notes,
--mv.Title,
--mv.DataVersion_ID,
-- m.LongName, m.Code, m.ShortName
--, m.Baseline, m.BaselineString

--, m.TargetString TargetValueString

                         
--                         , mv.ActualValueString ActualValueString
--                         , m.ReleaseDate
--                         , m.ReportingDate
                         
--						 ,rc.EndDateID MilestoneCompletionEndCycleDate_ID
--						 ,RC.EndDateID MilestoneCompletionDate_ID
--                         , m.BaselineDateID MilestoneStartDate_ID
--                         ,RC.StartDateID ReportCycleDate_ID, 
--                         RC.LastCycleDate AS ReportCycleDate
                         

--  FROM 
--  app.Milestone M
  
--  JOIN RBM.MilestoneValues mv
--  on M.MilestoneID = mv.Milestone_ID
--  JOIN Core.ReportingPeriod rc
--  on rc.ID  =mv.ReportPeriodID
--  inner join 
  
--  Core.DataVersion DDV 
  
--  ON (CHARINDEX('level',@DataVersion_ID) = 0 
--  AND (DDV.DataVersion_ID  = dbo.fn_StripMDXKey(@DataVersion_ID)
--	OR DDV.DataVersion_ID = 39)
  
--  )
--  OR ( CHARINDEX('level',@DataVersion_ID) > 0 
--  AND DDV.DataVersionLevel_ID = dbo.fn_StripMDXKey(@DataVersion_ID)
--  AND DDV.Outcome_ID IS NULL
  
--  )
  

--  LEFT JOIN Core.DataVersion DVChild
--  on DDV.DataVersion_ID  = DVChild.ParentDataVersion_ID
  
--  left join app.Project p
--    on m.ProjectID = p.ProjectID
--  left join app.Activity a
--    on m.ActivityID = a.ActivityID
  
  
--where 
--(mv.DataVersion_ID = DDV.DataVersion_ID 
--OR mv.DataVersion_ID = DVChild.DataVersion_ID
--OR mv.DataVersion_ID IS NULL
--OR mv.DataVersion_ID = 5
--)
----and

----(CAST([RolledUpToActivity_ID] as varchar(255)) = dbo.fn_StripMDXKey(@MDXRolledUpToActivity_ID )
----OR 
----CAST(M.ActivityID as varchar(255)) = dbo.fn_StripMDXKey(@MDXRolledUpToActivity_ID )
----)
--and (m.ActivityID = @Activity_ID or @Activity_ID = 0)
--AND (M.MilestoneiD = @Milestone_ID OR @Milestone_ID = 0)


----And  m.code = 'ACT8.1.1.1M7'
--order by m.code, RC.StartDateID ASC



----end
