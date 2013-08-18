


--CREATE PROC [dbo].[uspMilestoneProgress]
----declare
--@DataVersion_ID varchar(255)--=5
--, @MDXMIlestone_ID varchar(255)--=8

--AS
----begin
--SET @DataVersion_ID = dbo.fn_StripMDXKey(@DataVersion_ID)
--SET @MDXMIlestone_ID   = dbo.fn_StripMDXKey(@MDXMIlestone_ID   )


--SELECT    ROW_NUMBER() over (order by rp.LastCycleDate desc) RowNum,
--HiddenMilestoneStartDate = CASE WHEN ROW_NUMBER() over (order by rp.LastCycleDate desc)  = 1 THEN mv.ActualDate  ELSE NULL END,
--HiddenMilestoneCompletionDate = CASE WHEN ROW_NUMBER() over (order by rp.LastCycleDate desc)  = 1 THEN mv.ActualDate  ELSE NULL END,

--rp.YearName EndingPeriodFinancialYear
--,rp.LastCycleDate EndingPeriodReportCycle,
--dbo.fn_StripMDXKey(@DataVersion_ID) DataVersionPARM,
--mv.DataVersion_ID newDV,

--rp.FirstCycleDate ReportingPeriodStartDate,
--rp.LastCycleDate ReportingPeriodEndDate,

--DATEADD(d, (DATEDIFF(d,FirstCycleDate, m.TargetDate) * mv.MilestoneStatusValuesPercent), FirstCycleDate) MilestoneCurrentDate,


-- mv.MilestoneStatusValuesPercent MilestoneProgressPercent,
-- mv.Milestone_ID,
-- a.LongName ActivityLongName,
-- CASE WHEN ROW_NUMBER() over (order by mv.[ReportPeriodID])  = 1 THEN mv.ActualDate ELSE NULL END MilestoneStartDate,
-- CASE WHEN ROW_NUMBER() over (order by mv.[ReportPeriodID])  = 1 THEN mv.ActualDate ELSE NULL END MilestoneCompletionDate,

-- CAST(rp.StartDateID as varchar(255)) + ' - ' +  CAST(rp.EndDateID as varchar(255)) as ReportingPeriod,
-- rp.StartDateID ReportingPeriodStartDate_ID,
-- rp.EndDateID ReportingPeriodEndDate_ID,
-- mv.MilestoneValues_ID ActivityMilestone_ID, 
-- null RolledUpToActivity_ID,
-- mv.Notes,
-- mv.Title,
-- mv.DataVersion_ID,
-- m.TextDescription LongName, 
-- m.Code, 
-- m.ShortName, 
-- m.Baseline, 
-- m.BaselineString,
-- ISNULL(m.Target, 0) AS TargetValue,
-- m.TargetString TargetValueString,
--ISNULL(mv.ActualValue, 0) AS ActualValue,
--mv.ActualValueString,
--m.ReleaseDate,
--m.ReportingDate,
--null MilestoneCompletionDate_ID,
--null MilestoneStartDate_ID,
----rp.ReportingPeriod, 
--rp.LastCycleDate AS ReportCycleDate
                         
----select * 
--FROM 
--  RBM.MilestoneValues mv
--  join app.Milestone m
--    on mv.Milestone_ID = m.MilestoneID
--  join app.Activity a
--    on m.ActivityID = a.ActivityID
--  join Core.ReportingPeriod rp
--    on rp.ID = mv.ReportPeriodID
--  join Core.DataVersion DDV 
--    on (CHARINDEX('level',@DataVersion_ID) = 0 
--        and DDV.DataVersion_ID  = dbo.fn_StripMDXKey(@DataVersion_ID))
--	  or (CHARINDEX('level',@DataVersion_ID) > 0 
--          and DDV.DataVersionLevel_ID = dbo.fn_StripMDXKey(@DataVersion_ID)
--          and DDV.Outcome_ID IS NULL)
--  LEFT JOIN Core.DataVersion DVChild
--    on DDV.DataVersion_ID  = DVChild.ParentDataVersion_ID
  
  
 
--where 
--(mv.DataVersion_ID = DDV.DataVersion_ID 
--OR mv.DataVersion_ID = DVChild.DataVersion_ID)
--and
--CAST(mv.Milestone_ID as varchar(255)) = dbo.fn_StripMDXKey(@MDXMIlestone_ID )

--order by rp.StartDateID ASC


----end
