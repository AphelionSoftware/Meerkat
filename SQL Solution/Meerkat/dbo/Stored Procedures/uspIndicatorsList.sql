CREATE PROC [dbo].[uspIndicatorsList]

@MDXKey varchar(255),
@DataVersion_ID varchar(255)

as

--ALTER VIEw [dwPOA].[FactIndicatorValues]
--as

DECLARE @Outcome_ID int =0 
,@Output_ID int = 0
,@SubOutput_ID int = 0
,@Indicator_ID int = 0

IF CHARINDEX('Outcome', @MDXKey ) > 0 
SET @Outcome_ID  = dbo.fn_StripMDXKey(@MDXKey)
ELSE
IF CHARINDEX('Sub Output', @MDXKey ) > 0 
SET @SubOutput_ID  = dbo.fn_StripMDXKey(@MDXKey)
ELSE
IF CHARINDEX('Output', @MDXKey ) > 0 
SET @Output_ID  = dbo.fn_StripMDXKey(@MDXKey)
ELSE
IF CHARINDEX('Indicator', @MDXKey ) > 0 
SET @Indicator_ID  = dbo.fn_StripMDXKey(@MDXKey)


IF ISNUMERIC(@MDXKey) = 1 SET @Outcome_ID = @MDXKey


SELECT  
DENSE_RANK() OVER (order by I.Code) %2 RN,
@MDXKey Original,
dbo.fn_StripMDXKey(@MDXKey ) New,
@Outcome_ID OM,
@Output_ID O,
@SubOutput_ID So,
@INdicator_id I,
Type = 'Indicator',
om.Code OutcomeCode  , 
o.Code OutputCode  , 
so.Code SubOutputCode  , 
i.Code IndicatorCode  , 
null ActivityCode  , 
null MilestoneCode  , 


i.LongName RollupName,

om.LongName OutcomeName  , 
o.LongName OutputName  , 
so.LongName SubOutputName  , 
i.LongName IndicatorName  , 

Path = om.Code + ' 
' + isnull(o.Code  , '') + ' 
' + isnull(so.Code  , '')  , 
cast(rc.StartDateID as varchar) StartDate  , 
cast(rc.EndDateID as varchar) EndDate  , 

cast(rc.StartDateID as varchar) + ' - ' + 
cast(rc.EndDateID as varchar)  ReportingPeriod  , 
null NextDate  , 
ISNULL([IndicatorValues_ID]  , 0) [IndicatorValues_ID] 
        , i.[IndicatorID] [Indicator_ID]
        , i.[Baseline] [Baseline]
        ,  i.[BaselineString] BaselineString
        , i.Target [TargetValue]
        ,   i.TargetString [TargetValueString]
        , [ActualValue]
        , ActualLabel as [ActualValueString]
        , i.UnitOfMeasure
      
        , i.[Output_ID]
        , i.[OutcomeID]
        , iv.[BusinessKey]
        , iv.[Notes]
        , iv.ActualLabel as Title
        , rc.ReportingPeriod ReportCycle
        , i.ShortName
        , i.Code
        , i.LongName
        ,null [VerifiedActualValue]
        , null [VerifiedActualNotes]

        , i.[IndicatorType_ID]
        /*, i.[Activity_ID]*/
        , i.[SubOutput_ID]
        , ISNULL(iv.[DataVersion_ID]  , 0) DataVersion_ID
        , ISNULL(iv.Location_ID  , 1) Location_ID
         
        ,  rc.ReportingPeriod  ReportCycleDate_ID
         
                       , i.BaselineDate
        , BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
        , i.TargetDate
         , TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
              , RolledUpToOutcome_ID = ISNULL(i.OutcomeID  ,  o.OutcomeID)
        , RolledUpToOutput_ID = ISNULL(i.Output_ID  ,  so.Output_ID)
        , RolledUpToSubOutput_ID = i.SubOutput_ID  
        /*, RolledUpToActivity_ID = i.Activity_ID*/
     --       , TermSetID = DIML.TermsetDeepGrainID
	  , i.Baseline OriginalBaseline
	  , i.Target Target2014
	  , rc.StartDateID ReportingPeriodStartDate_ID
	  , rc.EndDateID ReportingPeriodEndDate_ID	
	  , null NextReportingPeriodReleaseDate_ID
	
	
	
	  , OutcomeMDX  = '[Outcome].[Outcome].%26[' + CAST (om.OutcomeID  as varchar(8)) + ']'
	  , OutputMDX = '[Output].[Output].%26[' + CAST (o.Output_ID as varchar(8))  + ']'
	  , SubOutputMDX = '[Sub Output].[Sub Output].%26[' + CAST (SO.SubOutput_ID as varchar(8)) + ']'
	
	  ,  ParentMDX =  
	CASE WHEN i.OutcomeID IS Not NULL 
	THEN '[Outcome].[Outcome].%26[' + CAST (i.OutcomeID  as varchar(8)) + ']'
	
	WHEN i.Output_ID IS Not NULL 
	THEN '[Output].[Output].%26[' + CAST (i.Output_ID as varchar(8))  + ']'
	
	WHEN i.SubOutput_ID IS Not NULL 
	THEN '[Sub Output].[Sub Output].%26[' + CAST (i.SubOutput_ID as varchar(8)) + ']'
	END
	, om.OutcomeSitename 
  FROM app.Indicator i 
 LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
     and (iv.DataVersion_ID = @DataVersion_ID OR @DataVersion_ID = 0)
  Left JOIN Core.ReportingPeriod rc
  on   iv.ReportPeriodID = rc.ID
 
    
/*
IV Left to RC

*/    
/*    
LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.ActivityID*/
LEFT OUTER JOIN [app].[SubOutput] SO

/*	INNER JOIN dbo.Activity SOA
	on so.SubOutput_ID = soa.SubOutput_ID
	inner join dbo.Milestone AM
		on SOA.Activity_ID = AM.Activity_ID
*/

on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID

LEFT OUTER JOIN [app].[Outcome] om
on i.OutcomeID = om.OutcomeID
OR o.OutcomeID = om.OutcomeID


LEFT JOIN Core.DimDate DDStart
on rc.StartDateID = DDStart.DateID

LEFT JOIN Core.DimDate DDEnd
on rc.EndDateID= DDEnd.DateID

--LEFT JOIN dwPoa.DimDate DDNext
--on iv.NextReportingPeriodReleaseDate_ID = DDNext.DateKey

Where 
 ( i.OutcomeID  = @Outcome_ID OR @Outcome_ID = 0)
AND (i.Output_ID  = @Output_ID OR @Output_ID = 0)
AND (i.SubOutput_ID = @SubOutput_ID OR @SubOutput_ID = 0) 
AND (i.IndicatorID  = @Indicator_ID OR @Indicator_ID = 0 OR iv.Location_ID is null)



----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------


order by OutcomeCode  ASC ,  OutputCode  ASC , SubOutputCode  ASC , IndicatorCode  ASC , ReportCycleDate_ID DESC
