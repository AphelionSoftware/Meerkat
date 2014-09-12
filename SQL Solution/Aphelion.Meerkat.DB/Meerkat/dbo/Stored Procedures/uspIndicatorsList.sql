CREATE PROC [dbo].[uspIndicatorsList]
--declare
@MDXKey varchar(255),
@DataVersion_ID varchar(255)

--set @MDXKey = '[Sector].[Sector].&[123]'
--set @DataVersion_ID = 0

--ALTER VIEw [dwPOA].[FactIndicatorValues]
as

DECLARE @Outcome_ID int =0 
,@Output_ID int = 0
,@SubOutput_ID int = 0
,@Indicator_ID int = 0
,@SubSector_ID int = 0
,@Sector_ID int = 0
,@Project_ID int = 0
,@Program_ID int = 0

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
IF CHARINDEX('Sub Sector', @MDXKey ) > 0 
SET @SubSector_ID  = dbo.fn_StripMDXKey(@MDXKey)
IF CHARINDEX('Program', @MDXKey ) > 0 
SET @Program_ID  = dbo.fn_StripMDXKey(@MDXKey)

IF NOT CHARINDEX('Sub Sector', @MDXKey ) > 0 and  CHARINDEX('Sector', @MDXKey ) > 0
SET @Sector_ID  = dbo.fn_StripMDXKey(@MDXKey)



IF ISNUMERIC(@MDXKey) = 1 SET @Outcome_ID = @MDXKey

--select @Indicator_ID, @SubOutput_ID,@Project_ID, @Outcome_ID, @Output_ID , @SubOutput_ID, @Sector_ID
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
S.Code OutputCode  , 
ss.Code SubOutputCode  , 
i.Code IndicatorCode  , 
null ActivityCode  , 
null MilestoneCode  , 


i.LongName RollupName,

ISNULL(om.LongName, prog.LongName) OutcomeName  , 
ISNULL(o.LongName, s.LongName) OutputName  , 
ISNULL(so.longname,ss.LongName) SubOutputName  , 
i.LongName IndicatorName  , 

Path = om.Code + ' 
' + isnull(o.Code  , '') + ' 
' + isnull(so.Code  , '')  , 
cast(rc.StartDateID as varchar) StartDate  , 
cast(rc.EndDateID as varchar) EndDate  , 

cast(rc.StartDateID as varchar) + ' - ' + 
cast(rc.EndDateID as varchar)  ReportingPeriod  , 
null NextDate  , 
ISNULL([iv].[IndicatorValues_ID]  , 0) [IndicatorValues_ID] 
        , i.[IndicatorID] [Indicator_ID]
        , i.[Baseline] [Baseline]
        ,  i.[BaselineString] BaselineString
        , i.Target [TargetValue]
        ,   i.TargetString [TargetValueString]
        , [iv].[ActualValue]
        , [iv].[ActualLabel] as [ActualValueString]
        , i.UnitOfMeasure
      
        , i.[Output_ID]
        , i.[Outcome_ID]
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
              , RolledUpToOutcome_ID = ISNULL(i.Outcome_ID  ,  o.Outcome_ID)
        , RolledUpToOutput_ID = ISNULL(i.Output_ID  ,  so.Output_ID)
        , RolledUpToSubOutput_ID = i.SubOutput_ID  
        /*, RolledUpToActivity_ID = i.Activity_ID*/
     --       , TermSetID = DIML.TermsetDeepGrainID
	  , i.Baseline OriginalBaseline
	  , i.Target Target2014
	  , rc.StartDateID ReportingPeriodStartDate_ID
	  , rc.EndDateID ReportingPeriodEndDate_ID	
	  , null NextReportingPeriodReleaseDate_ID
	
	
	
	  , OutcomeMDX  = '[Outcome].[Outcome].%26[' + CAST (om.Outcome_ID  as varchar(8)) + ']'
	  , OutputMDX = '[Output].[Output].%26[' + CAST (o.Output_ID as varchar(8))  + ']'
	  , SubOutputMDX = '[Sub Output].[Sub Output].%26[' + CAST (SO.SubOutput_ID as varchar(8)) + ']'
	
	  ,  ParentMDX =  
	CASE WHEN i.Outcome_ID IS Not NULL 
	THEN '[Outcome].[Outcome].%26[' + CAST (i.Outcome_ID  as varchar(8)) + ']'
	
	WHEN i.Output_ID IS Not NULL 
	THEN '[Output].[Output].%26[' + CAST (i.Output_ID as varchar(8))  + ']'
	
	WHEN i.SubOutput_ID IS Not NULL 
	THEN '[Sub Output].[Sub Output].%26[' + CAST (i.SubOutput_ID as varchar(8)) + ']'
	END
	, om.[OutcomeSiteName]
  FROM app.Indicator i 
 LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
     and (iv.DataVersion_ID = @DataVersion_ID OR @DataVersion_ID = 0)
  Left JOIN Core.ReportingPeriod rc
  on   iv.ReportPeriodID = rc.ID
 
    
LEFT OUTER JOIN [app].[SubOutput] SO


on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID

LEFT OUTER JOIN [app].[Outcome] om
on i.Outcome_ID = om.Outcome_ID
OR o.Outcome_ID = om.Outcome_ID


LEFT OUTER JOIN app.Project P
ON i.ProjectID = P.ProjectID
LEFT OUTER JOIN app.SubSector SS
on I.SubSector_ID = SS.SubSector_ID
LEFT OUTER JOIN app.Sector S
ON SS.Sector_ID = S.Sector_ID
		OR S.Sector_ID = P.Sector_ID
		OR S.Sector_ID = I.Sector_ID

LEFT OUTER JOIN app.Programme PROG
	ON I.Programme_ID = PROG.Programme_ID
	 
LEFT JOIN Core.DimDate DDStart
on rc.StartDateID = DDStart.DateID

LEFT JOIN Core.DimDate DDEnd
on rc.EndDateID= DDEnd.DateID

--LEFT JOIN dwPoa.DimDate DDNext
--on iv.NextReportingPeriodReleaseDate_ID = DDNext.DateKey

Where 
 ( i.Outcome_ID  = @Outcome_ID OR @Outcome_ID = 0)
AND (i.Output_ID  = @Output_ID OR @Output_ID = 0)
AND (i.SubOutput_ID = @SubOutput_ID OR @SubOutput_ID = 0) 
AND (i.IndicatorID  = @Indicator_ID OR @Indicator_ID = 0 OR iv.Location_ID is null)
AND (SS.SubSector_ID  = @SubSector_ID OR @SubSector_ID = 0 )
AND (S.Sector_ID  = @Sector_ID OR @Sector_ID = 0 )
AND (@Program_ID = 0 OR PROG.Programme_ID = @Program_ID)
AND (@Project_ID = 0 OR P.ProjectID = @Project_ID)


----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------


order by OutcomeCode  ASC ,  OutputCode  ASC , SubOutputCode  ASC , IndicatorCode  ASC , ReportCycleDate_ID DESC

