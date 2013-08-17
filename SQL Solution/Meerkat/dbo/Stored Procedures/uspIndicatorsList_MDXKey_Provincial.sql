

--create PROC [dbo].[uspIndicatorsList_MDXKey_Provincial]

--@MDXKey varchar(255)
--,@Location_ID int = 1

--as

----ALTER VIEw [dwPOA].[FactIndicatorValues]
----as

--DECLARE @Outcome_ID int =0 
--,@Output_ID int = 0
--,@SubOutput_ID int = 0
--,@Indicator_ID int = 0

--IF CHARINDEX('Outcome', @MDXKey ) > 0 
--SET @Outcome_ID  = dbo.fn_StripMDXKey(@MDXKey)
--ELSE
--IF CHARINDEX('Sub Output', @MDXKey ) > 0 
--SET @SubOutput_ID  = dbo.fn_StripMDXKey(@MDXKey)
--ELSE
--IF CHARINDEX('Output', @MDXKey ) > 0 
--SET @Output_ID  = dbo.fn_StripMDXKey(@MDXKey)
--ELSE
--IF CHARINDEX('Indicator', @MDXKey ) > 0 
--SET @Indicator_ID  = dbo.fn_StripMDXKey(@MDXKey)


--IF ISNUMERIC(@MDXKey) = 1 SET @Outcome_ID = @MDXKey


--SELECT  

--DENSE_RANK() OVER (order by i.Code) %2 RN,
--@MDXKey Original,
--dbo.fn_StripMDXKey(@MDXKey ) New,
--@Outcome_ID OM,
--@Output_ID O,
--@SubOutput_ID So,
--@INdicator_id I,
--Type = 'Indicator',
--om.Code OutcomeCode  , 
--o.Code OutputCode  , 
--so.Code SubOutputCode  , 
--i.Code IndicatorCode  , 
--null ActivityCode  , 
--null MilestoneCode  , 
--l.Name LocationName,


--i.LongName RollupName,

--om.LongName OutcomeName  , 
--o.LongName OutputName  , 
--so.LongName SubOutputName  , 
--i.LongName IndicatorName  , 

--Path = om.Code + ' 
--' + isnull(o.Code  , '') + ' 
--' + isnull(so.Code  , '')  , 
--rc.FirstCycleDate StartDate  , 
--rc.LastCycleDate EndDate  , 

--rc.StartDateID + ' - ' + 
--rc.EndDateID ReportingPeriod  , 

--ISNULL([IndicatorValues_ID]  , 0) [IndicatorValues_ID] 
--        , i.[IndicatorID] [Indicator_ID]
--        ,  i.[Baseline] [Baseline]
--        ,  i.[BaselineString] BaselineString
--        , i.Target [TargetValue]
--        ,  i.TargetString [TargetValueString]
--        , [ActualValue]
--        , [ActualValueString]
--        , ISNULL(iv.[ReleaseDate]  ,  i.ReleaseDate) ReleaseDate
--        , ISNULL(iv.[ReportingDate]  ,  i.ReportingDate) ReportingDate
--        , [IndicatorReportingDate]
--        , i.UnitOfMeasure
      
--        , i.[Output_ID]
--        , i.OutcomeID [Outcome_ID]
--        , iv.[BusinessKey]
--        , iv.[Notes]
--        , iv.Title
--        , rc.ReportingPeriod ReportCycle
--        , i.ShortName
--        , i.Code
--        , i.LongName


--        , i.[IndicatorType_ID]
--        , i.[Activity_ID]
--        , i.[SubOutput_ID]
--        , ISNULL([DataVersion_ID]  , 0) DataVersion_ID
--        , ISNULL(iv.Location_ID  , 1) Location_ID
--        , iv.IndicatorStatusPercent      
         
--        , rc.EndDateID ReportCycleDate_ID
         
--                       , i.BaselineDate
--        , BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
--        , i.TargetDate
--         , TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
--              , RolledUpToOutcome_ID = ISNULL(i.OutcomeID  ,  o.OutcomeID)
--        , RolledUpToOutput_ID = ISNULL(i.Output_ID  ,  so.Output_ID)
--        , RolledUpToSubOutput_ID = i.SubOutput_ID 
--        , RolledUpToActivity_ID = i.Activity_ID

--	  , i.Baseline OriginalBaseline
--	  , i.Target Target2014
--	  , rc.StartDateID ReportingPeriodStartDate_ID
--	  , rc.EndDateID ReportingPeriodEndDate_ID	

	
	
	
--	  , OutcomeMDX  = '[Outcome].[Outcome].&[' + CAST (om.OutcomeID  as varchar(8)) + ']'
--	  , OutputMDX = '[Output].[Output].&[' + CAST (o.Output_ID as varchar(8))  + ']'
--	  , SubOutputMDX = '[SubOutput].[SubOutput].&[' + CAST (SO.SubOutput_ID as varchar(8)) + ']'
	
--	  ,  ParentMDX =  
--	CASE WHEN i.OutcomeID IS Not NULL 
--	THEN '[Outcome].[Outcome].&[' + CAST (i.OutcomeID  as varchar(8)) + ']'
	
--	WHEN i.Output_ID IS Not NULL 
--	THEN '[Output].[Output].&[' + CAST (i.Output_ID as varchar(8))  + ']'
	
--	WHEN i.SubOutput_ID IS Not NULL 
--	THEN '[SubOutput].[SubOutput].&[' + CAST (i.SubOutput_ID as varchar(8)) + ']'
--	END 
--  FROM app.Indicator i 
--  inner join RBM.[IndicatorValues] iv
--  on i.IndicatorID = iv.Indicator_ID
 
--  INNER JOIN Core.ReportingPeriod rc
--  on iv.ReportPeriodID = rc.ID  
--  LEFT OUTER JOIN [app].[SubOutput] SO
--  on i.SubOutput_ID = so.SubOutput_ID 

--LEFT OUTER JOIN app.Output o
--on i.Output_ID = o.Output_ID
--OR so.Output_ID = o.Output_ID

--LEFT OUTER JOIN [app].[Outcome] om
--on i.OutcomeID = om.OutcomeID
--OR o.OutcomeID = om.OutcomeID


--LEFT OUTER JOIN Core.Location l
--on iv.Location_ID = l.Location_ID

--where i.ShortName not like '%overall%'
--/*AND ( ISNULL(i.Outcome_ID  ,  om.Outcome_id) = @Outcome_ID OR @Outcome_ID = 0)
--AND (ISNULL(i.Output_ID  ,  o.Output_ID) = @Output_ID OR @Output_ID = 0)
--AND (ISNULL(i.SubOutput_ID  ,  so.SubOutput_ID) = @SubOutput_ID OR @SubOutput_ID = 0) 
--*/

--AND ( i.OutcomeID  = @Outcome_ID OR @Outcome_ID = 0)
--AND (i.Output_ID  = @Output_ID OR @Output_ID = 0)
--AND (i.SubOutput_ID = @SubOutput_ID OR @SubOutput_ID = 0) 
--AND (i.IndicatorID  = @Indicator_ID OR @Indicator_ID = 0)
--and (iv.Location_ID = @Location_ID OR @Location_ID = 0)



------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------


--order by OutcomeCode  ASC ,  OutputCode  ASC , SubOutputCode  ASC , IndicatorCode  ASC , ReportCycleDate_ID DESC

