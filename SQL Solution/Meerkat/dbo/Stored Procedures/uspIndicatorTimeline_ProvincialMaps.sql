


--CREATE PROC [dbo].[uspIndicatorTimeline_ProvincialMaps]
----declare
--	@DataVersion_ID varchar(255)= 5
--, @indicator_id varchar(255)
--, @TermSetIndicator_ID varchar(255)
--, @Location_ID int =1 

--AS
----begin
--/*
--declare 
--@DataVersion_ID int  = 40
--, @indicator_id int = 751
--, @TermSetIndicator_ID int = 0

--*/

--SELECT    
--DatePosition,
--UnitOfMeasure,CASE WHEN RowX > 1 THEN 
-- [Baseline] + ( (( Target2014 - [Baseline])/  (CAST(MAX(RowX) over (partition by indicator_id,location_ID)  as float) -1))

 
-- * CAST((ROW_NUMBER() over (partition by indicator_id,location_ID order by ReportCycleDate_ID)) -1  as float)
-- )
-- ELSE 
-- OriginalBaseline END
-- AS ExtrapolatedTarget
--,

--/*CAST((ROW_NUMBER() over (partition by indicator_id,location_ID order by ReportCycleDate_ID)) -1  as float) as mult,
--  (( Target2014 - [Baseline])/  (CAST(MAX(RowX) over (partition by indicator_id,location_ID)  as float) -1)) as increase,
--  (CAST(MAX(RowX) over (partition by indicator_id,location_ID)  as float) -1) as div,*/
--CASE WHEN ROW_NUMBER() Over ( PARTITION  by Indicator_ID, location_id order by ReportCycleDate_ID) = 1 THEN OriginalBaseline
--ELSE null END

-- BaselineStart,

--CASE WHEN ROW_NUMBER() Over ( PARTITION  by Indicator_ID, location_id order by ReportCycleDate_ID DESC) = 1 THEN Target2014
--ELSE null END TargetEnd, 

-- Target2014,
--dbo.fn_StripMDXKey(@DataVersion_ID) DataVersionParm,
--FinancialYear,
----FIV.ExtrapolatedTarget,
--FIV.LocationName,
--geog,
--FIV.IndicatorValues_ID, FIV.Indicator_ID
--,FIV.Notes,FIV.Title,FIV.DataVersion_ID,
-- FIV.ReportCycle, FIV.LongName, FIV.Code, FIV.ShortName
--, FIV.Baseline, FIV.BaselineString
--, ISNULL(FIV.TargetValue, 0) AS TargetValue
--, FIV.TargetValueString
--, ISNULL(FIV.ActualValue , CASE WHEN Title IS null OR Title = '' then null else 0 end)
--                         AS ActualValue
--                         , FIV.ActualValueString
--                         , FIV.ReleaseDate
--                         , FIV.ReportingDate
--                         , FIV.IndicatorReportingDate
--                         , FIV.IndicatorStatusPercent
--                         , FIV.ReportCycleDate_ID, 
--                         CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) AS ReportCycleDate
                         


----MAX(RowX) over (partition by indicator_id),
----ROW_NUMBER() over (partition by indicator_id order by ReportCycleDate_ID desc) ,



-- FROM (
--SELECT 
--l.geog, 
--i.UnitOfMeasure,
--rc.YearName financialYear,
--ROW_NUMBER() over (partition by i.indicatorid, iv.location_id order by rc.EndDateID  desc) as DatePosition,
--ROW_NUMBER() over (partition by i.indicatorid, iv.location_id order by rc.EndDateID ) as RowX,
--ISNULL(iv.[IndicatorValues_ID],0) [IndicatorValues_ID] 
--      ,i.[IndicatorID] [Indicator_ID]
--      ,i.[Baseline] [Baseline]
--      , i.[BaselineString] BaselineString
--      , i.Target [TargetValue]
--      , i.TargetString [TargetValueString]
--      ,[ActualValue]
--      ,[ActualValueString]
--      ,ISNULL(iv.[ReleaseDate], i.ReleaseDate) ReleaseDate
--      ,ISNULL(iv.[ReportingDate], i.ReportingDate) ReportingDate
--      ,[IndicatorReportingDate]
--      ,i.[Output_ID]
--      ,i.[OutcomeID] [Outcome_ID]
--      ,iv.[BusinessKey]
--      ,iv.[Notes]
--      ,iv.Title
--      ,rc.ReportingPeriod ReportCycle
--      ,i.ShortName
--      ,i.Code
--      ,i.LongName


--      ,i.[IndicatorType_ID]
--      ,i.[Activity_ID]
--      ,i.[SubOutput_ID]
--      ,ISNULL(iv.[DataVersion_ID],0) DataVersion_ID
--      ,iv.Location_ID
--      ,iv.IndicatorStatusPercent      
         
--      ,rc.EndDateID ReportCycleDate_ID
         
--                     ,i.BaselineDate
--      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
--      ,i.TargetDate
--       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
--            ,RolledUpToOutcome_ID = ISNULL(i.outcomeID, o.outcomeid)
--      ,RolledUpToOutput_ID = ISNULL(i.output_id, so.output_ID)
--      ,RolledUpToSubOutput_ID = i.suboutput_id

--	,i.Baseline OriginalBaseline
--	,i.Target Target2014
--	,rc.StartDateID ReportingPeriodStartDate_ID
--	,rc.EndDateID ReportingPeriodEndDate_ID	

--	,l.Name LocationName

--  FROM app.IndicatorLocation il 
--  join app.Indicator i
--  on i.IndicatorID = il.Indicator_ID
--    inner join 
  
--  Core.DataVersion DDV 
  
--  ON (CHARINDEX('level',@DataVersion_ID) = 0 
--  AND DDV.DataVersion_ID  = dbo.fn_StripMDXKey(@DataVersion_ID)
--  )
--  OR ( CHARINDEX('level',@DataVersion_ID) > 0 
--  AND DDV.DataVersionLevel_ID = dbo.fn_StripMDXKey(@DataVersion_ID)
--  AND DDV.Outcome_ID IS NULL
--  )
  
  
--  left join RBM.[IndicatorValues] iv
--  on i.IndicatorID = iv.Indicator_ID
--  and il.Location_ID = iv.Location_ID
--    --and iv.ReportCycleDate_ID = rc.ReportCycleReportDate_ID  
--    and  (
    
--    (iv.DataVersion_ID = DDV.DataVersion_ID OR iv.DataVersion_ID is null)
--    OR ( iv.DataVersion_ID  IN (SELECT DataVersion_ID FROM Core.DataVersion DV WHERE DV.DataVersionLevel_ID = DDV.DataVersionLevel_ID )
--and DDV.Outcome_ID is null
--)

    
--    )
    
--    INNER JOIN Core.ReportingPeriod rc
--  on 

--  iv.ReportPeriodID = rc.ID
    

--LEFT OUTER JOIN app.SubOutput SO
--on i.SubOutput_ID = so.SubOutput_ID 
--LEFT OUTER JOIN app.Output o
--on i.Output_ID = o.Output_ID
--OR so.Output_ID = o.Output_ID
--INNER JOIN Core.Location l
--on il.Location_ID = l.Location_ID



--  --where 
--/*
--*/
--) FIV
----where (Indicator_ID = dbo.fn_StripMDXKey(@indicator_id) OR (dbo.fn_StripMDXKey(@indicator_id)  = 0 AND NOT @TermSetIndicator_ID ='0') )


----and ReportCycleDate_ID >= 20090101

----and ReportCycle not like '%pre%'
----and (Location_ID = @Location_ID OR @Location_ID = 0)


----and FinancialYear   = '2010/11'
----and indicator_id = 764
----and DatePosition = 1

--order by [Location_ID] ASC, ReportCycleDate_ID ASC

----end

