/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO [RBM].[IndicatorValues]
           ([Indicator_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[BusinessKey]
           ,[Notes]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
)
SELECT    
Indicator_ID
,Cast(OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)

as varchar(255))
, OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)
     
as ActualValue
,CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) As ActualDate
,'IV' as businessKey
,Cast(OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID)

as varchar(255)) as Notes
    ,1 as DataVersionID
    ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') AS Location_ID
    ,ReportPeriodID
 FROM 

 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
rc.id as ReportPeriodID,
ISNULL([IndicatorValues_ID],0) [IndicatorValues_ID] 
      ,i.[IndicatorID] [Indicator_ID]
      ,i.[Baseline] [Baseline]
      , i.[BaselineString] BaselineString
      ,i.Target [TargetValue]
      ,i.TargetString [TargetValueString]
      ,[ActualValue]
      ,[ActualLabel]
      ,i.[Output_ID]
      ,i.[Outcome_ID]
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

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.Outcome_ID, o.Outcome_ID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
      --,RolledUpToActivity_ID = i.Activity_ID
      --  ,TermSetID = DIML.TermsetDeepGrainID
    ,i.Baseline OriginalBaseline
    ,i.Target FinalTarget
    --,rc.StartDateID ReportingPeriodStartDate_ID
    --,rc.EndDateID 	
    ,null NextReportingPeriodReleaseDate_ID
    ,l.Name LocationName
    ,FinalTargetPeriod.ID FinalTargetPeriodID
    ,rc.ID CurrentReportPeriodID
    ,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.ID 
    --and  (@DataVersion_ID = 0 OR iv.DataVersion_ID = @DataVersion_ID)
    --and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
    INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
  
  
    
    
/*LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.Activity_ID*/
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID )



  --where 
/*
*/
) FIV


where Indicator_ID in (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
AND NOT EXISTS (SELECT 1 from rbm.IndicatorValues IVInner where Indicator_ID = FIV.Indicator_ID and 
                IVInner.ReportPeriodID = ReportPeriodID)
AND financialYear <2014
order by ReportCycleDate_ID ASC


GO


----IV 2

INSERT INTO [RBM].[IndicatorValues]
           ([Indicator_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[BusinessKey]
           ,[Notes]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
           )

SELECT    
Indicator_ID

, CAST (  (OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1150.0/ cast(Location.Code as int))	 
    as varchar(255))
as ActualLabel
, (OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1150.0/ cast(Location.Code as int))	 
as ActualValue
,CONVERT(DATETIME, CONVERT(VARCHAR, FIV.ReportCycleDate_ID), 112) As ActualDate
,'IV' as businessKey
,Cast((OriginalBaseline + (
    (
        ( FinalTarget - OriginalBaseline) / 
        (	 FinalTargetPeriodID -BaselinePeriodID ) 
        )
    * (CurrentReportPeriodID-BaselinePeriodID)
    ) * RAND(ReportPeriodID))
    / (1551.0* cast(Location.Code as int))

as varchar(255)) as Notes
    ,1 as DataVersionID
    ,Location.Location_ID AS Location_ID
    ,ReportPeriodID
 FROM 
 Core.Location
 INNER JOIN [Core].[LocationType]
 ON Location.LocationType_ID = [LocationType].[LocationType_ID]
 AND [LocationType].[Code] = 'CNTY'
 CROSS JOIN 
 (
SELECT  
i.UnitOfMeasure,
rc.YearNumber financialYear,
rc.id as ReportPeriodID,
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
      ,i.[Outcome_ID]
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

         
      ,rc.EndDateID  ReportCycleDate_ID
      ,rc.StartDateID ReportCycleStartDateID
                     ,i.BaselineDate
      ,BaselineDate_ID = (YEAR(i.BaselineDate) * 10000)  + (MONTH(i.BaselineDate) * 100) + DAY(i.BaselineDate)
      ,i.TargetDate
       ,TargetDate_ID = (YEAR(i.TargetDate) * 10000)  + (MONTH(i.TargetDate) * 100) + DAY(i.TargetDate)
            ,RolledUpToOutcome_ID = ISNULL(i.Outcome_ID, o.Outcome_ID)
      ,RolledUpToOutput_ID = ISNULL(i.Output_ID, so.Output_ID)
      ,RolledUpToSubOutput_ID = i.SubOutput_ID
      --,RolledUpToActivity_ID = i.Activity_ID
      --  ,TermSetID = DIML.TermsetDeepGrainID
    ,i.Baseline OriginalBaseline
    ,i.Target FinalTarget
    --,rc.StartDateID ReportingPeriodStartDate_ID
    --,rc.EndDateID 	
    ,null NextReportingPeriodReleaseDate_ID
    ,l.Name LocationName
    ,FinalTargetPeriod.ID FinalTargetPeriodID
    ,rc.ID CurrentReportPeriodID
    ,BaselinePeriod.ID BaselinePeriodID
  FROM app.Indicator i 

   
  INNER JOIN Core.ReportingPeriod rc
  on rc.EndDateID >=   i.BaselineDate_ID 
  and rc.StartDateID <= i.TargetDate_ID
  

  LEFT join RBM.[IndicatorValues] iv
  on i.IndicatorID = iv.Indicator_ID
    and iv.ReportPeriodID  = rc.ID 
    --and  (@DataVersion_ID = 0 OR iv.DataVersion_ID = @DataVersion_ID)
    --and (iv.Location_ID = @Location_ID OR @Location_ID = 0 )
    

  INNER JOIN Core.ReportingPeriod FinalTargetPeriod
  ON i.TargetDate_ID BETWEEN
   FinalTargetPeriod.StartDateID  AND
   FinalTargetPeriod.EndDateID 
    
    INNER JOIN Core.ReportingPeriod BaselinePeriod
  ON i.BaselineDate_ID BETWEEN
  BaselinePeriod.StartDateID 
  AND
  BaselinePeriod.EndDateID 
  
  
  
    
    
/*LEFT OUTER JOIN app.Activity a
on i.Activity_ID = a.Activity_ID*/
LEFT OUTER JOIN [app].[SubOutput] SO
on i.SubOutput_ID = so.SubOutput_ID 

LEFT OUTER JOIN app.Output o
on i.Output_ID = o.Output_ID
OR so.Output_ID = o.Output_ID
LEFT OUTER JOIN Core.Location l
on (iv.Location_ID = l.Location_ID )



  --where 
/*
*/
) FIV


where Indicator_ID in (select IndicatorID from app.Indicator where code = 'IND2.1.1.2' ) 
AND NOT EXISTS (SELECT 1 from rbm.IndicatorValues IVInner where Indicator_ID = FIV.Indicator_ID and 
                IVInner.ReportPeriodID = ReportPeriodID)
AND financialYear <2014
order by ReportCycleDate_ID ASC


GO

GO

--- Project

INSERT INTO [app].[Project]
           ([Code]
           ,[LongName]
           ,[Outcome_ID]
           ,[ShortName]
           ,[TextDescription]
           )
     SELECT
           'PRJ2.1'
           ,'Build new schools'
           ,(SELECT Outcome_ID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Build new schools'
           ,'Build new schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Project where code = 'PRJ2.1')
    UNION 
    
     SELECT
           'PRJ2.2'
           ,'Add canteens to existing schools'
           ,(SELECT Outcome_ID FROM app.Outcome WHERE Code = 'Outcome 2') 
           ,'Add canteens to existing schools'
           ,'Add canteens to existing schools'
    WHERE NOT EXISTS (SELECT 1 FROM app.Project where code = 'PRJ2.2')
--Activities

GO

INSERT INTO [app].[Activity]
           ([ShortName]
           ,[LongName]
           ,[TextDescription]
           ,[ProjectID]
           ,[Code]
)

SELECT 'Choosing areas to build schools', 
        'Choosing areas to build schools', 
        'Choosing areas to build schools', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.1'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.1')

UNION 

SELECT 'Create plan for school construction', 
        'Create plan for school construction', 
        'Create plan for school construction', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.2'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.2')
        
UNION 

SELECT 'Build new schools', 
        'Build new schools', 
        'Build new schools', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.1')
        ,'ACT2.1.3'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.1.3')

UNION 
SELECT 'Identify schools needing a canteen', 
        'Identify schools needing a canteen', 
        'Identify schools needing a canteen', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.2')
        ,'ACT2.2.1'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.2.1')

UNION 

SELECT 'Build new canteens', 
        'Build new canteens', 
        'Build new canteens', 
        (SELECT PRojectID FROM app.Project where code = 'PRJ2.2')
        ,'ACT2.2.2'
        WHERE NOT EXISTS (SELECT 1 FROM app.Activity where code = 'ACT2.2.2')
        

GO

-----------------------------Milestones
/*alter table aPP.MILESTONE DROP COLUMN ISKEYINDICATOR*/
INSERT INTO [app].[Milestone]
           ([LongName]
           ,[TextDescription]
           ,[Baseline]
           ,[BaselineDate]
           ,[Target]
           ,[TargetDate]
           ,[BusinessKey]
           ,[Code]
           ,MilestoneTypeID
           ,[Activity_ID]
           ,[ShortName]
           ,[UnitOfMeasure])

           SELECT 'Identify work committee'
           ,'Identify work committee'
           ,0 As Baseline
           ,'2013/01/01'
           ,20 As target
           ,'2013/04/01'
           ,'#'
           ,'M2.1.2.1'
           ,5
           ,(Select Activity_ID from app.Activity  where code = 'ACT2.1.2')
           ,'Identify work committee'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.1')
    UNION ALL
    
           SELECT 'Choose methodology'
           ,'Choose methodology'
           ,0 As Baseline
           ,'2013/01/01'
           ,1 As target
           ,'2013/04/01'
           ,'#'
           ,'M2.1.2.2'
           ,5
           ,(Select Activity_ID from app.Activity  where code = 'ACT2.1.2')
           ,'Choose methodology'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.2')


           UNION ALL
    
           SELECT 'Create draft plan'
           ,'Create draft plan'
           ,0 As Baseline
           ,'2013/04/01'
           ,1 As target
           ,'2013/08/01'
           ,'#'
           ,'M2.1.2.3'
           ,5
           ,(Select Activity_ID from app.Activity  where code = 'ACT2.1.2')
           ,'Create draft plan'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.3')

           
           UNION ALL
    
           SELECT 'Ratify plan with executive'
           ,'Ratify plan with executive'
           ,0 As Baseline
           ,'2013/08/02'
           ,1 As target
           ,'2013/10/01'
           ,'#'
           ,'M2.1.2.4'
           ,5
           ,(Select Activity_ID from app.Activity  where code = 'ACT2.1.2')
           ,'Ratify plan with executive'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.4')

           
           UNION ALL
    
           SELECT 'Ratify plan with provinces'
           ,'Ratify plan with provinces'
           ,0 As Baseline
           ,'2013/10/02'
           ,11 As target
           ,'2013/11/01'
           ,'#'
           ,'M2.1.2.5'
           ,5
           ,(Select Activity_ID from app.Activity  where code = 'ACT2.1.2')
           ,'Ratify plan with provinces'
           ,'Number'
           WHERE NOT EXISTS (SELECT 1 FROM app.Milestone where code = 'M2.1.2.5')

----------------------------------------------------------------------------------
---MNilestone values

---------------------------------------------------------------------------------

GO
INSERT INTO [RBM].[MilestoneValues]
           ([Milestone_ID]
           ,[ActualLabel]
           ,[ActualValue]
           ,[ActualDate]
           ,[DataVersion_ID]
           ,[Location_ID]
           ,[ReportPeriodID]
           )

           SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.1')
           ,'Identified twelve candidates'
           ,12
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20121231 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.1')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20121231 between StartDateID and EndDateID)
                        )
UNION ALL 
                        SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.1')
           ,'Chose committee'
           ,20
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20130301 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.1')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20130301 between StartDateID and EndDateID)
                        )

UNION ALL 
           SELECT (select milestoneid from app.Milestone where code = 'M2.1.2.2')
           ,'Chose methodology'
           ,1
           ,Getdate()
           ,1
           ,1
           ,(SELECT ID FROM Core.ReportingPeriod WHERE 20130401 between StartDateID and EndDateID)
           where not exists (select 1 from rbm.MilestoneValues where 
                        Milestone_ID = (select milestoneid from app.Milestone where code = 'M2.1.2.2')
                        and ReportPeriodID = (SELECT ID FROM Core.ReportingPeriod WHERE 20130401 between StartDateID and EndDateID)
                        )

    
           
GO


           ----------------IV Qualitative

           /*select * from app.Indicator where IndicatorID in (201,202)
select * from rbm.IndicatorValues where Indicator_ID in (201)
*/
UPDATE RBM.IndicatorValues
set Actuallabel = CAST (CAST(ROUND(ActualValue,0) as int) as varchar(10)) + ' per class'
where Indicator_ID IN (select IndicatorID from app.Indicator where code in ('IND2.1.1.1')) 

UPDATE RBM.IndicatorValues
set Actuallabel = CAST (CAST(ROUND(ActualValue,0) as int) as varchar(10)) + ' schools'
where Indicator_ID IN (select IndicatorID from app.Indicator where code in ('IND2.1.1.2')) 


UPDATE rbm.IndicatorValues 
SET ActualValue = 52
, ActualLabel = 'Influx of students'
, notes = 'An influx of new students came in before the new facilities came on board'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2012-11-30'

UPDATE rbm.IndicatorValues 
SET ActualValue = 46
, ActualLabel = 'Catching up'
, notes = 'Some new facilities have been constructed, but the majority are still being delayed due to the foundations being wet'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-02-28'

UPDATE rbm.IndicatorValues 
SET ActualValue = 43
, ActualLabel = 'Catching up'
, notes = 'Construction has started to happen on the schools, but rains have caused some rework'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-05-31'



UPDATE rbm.IndicatorValues 
SET ActualValue = 37
, ActualLabel = 'New schools'
, notes = 'The new facilities are getting rolled out almost on schedule, and the final date is not likely to be pushed out significantly'
where Indicator_ID = (select IndicatorID from app.Indicator where code = 'IND2.1.1.1' )
and ActualDate = '2013-08-31'


/*Insert status values*/

INSERT INTO [RBM].[StatusValues]
           ([ProjectID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select projectid ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Project P
JOIN core.ReportingPeriod RP 
on startdateid between 20120101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.ProjectID = P.ProjectID and sv.ReportingPeriodID = rp.ID)

INSERT INTO [RBM].[StatusValues]
           ([Output_ID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select Output_ID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by [Output_ID],id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Output O
JOIN core.ReportingPeriod RP
on startdateid between 20110101 and 20131001

where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.Output_ID = O.Output_ID and sv.ReportingPeriodID = rp.ID)

INSERT INTO [RBM].[StatusValues]
           ([SubOutput_ID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select SubOutput_ID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by suboutput_id, id)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.SubOutput SO
JOIN core.ReportingPeriod RP 
on startdateid between 20110101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.SubOutput_ID = SO.SubOutput_ID and sv.ReportingPeriodID = rp.ID)


INSERT INTO [RBM].[StatusValues]
           ([Outcome_ID]
           , [LocationID] ,[StatusTypeID]
           ,[ReportingPeriodID]
           ,[DataVersionID]
           )
select Outcome_ID ,(SELECT Location_ID FROM [Core].[Location] WHERE Code = 'KE') , cast(ROUND(((rand( ROW_NUMBER() over (order by Outcome_ID)) - .71355) * 10000),0) as int) % 3
,RP.ID
,1
from app.Outcome OM
JOIN core.ReportingPeriod RP 
on startdateid between 20130101 and 20131001
where not exists (select 1 FROM [RBM].[StatusValues] SV where SV.Outcome_ID = OM.Outcome_ID and sv.ReportingPeriodID = rp.ID)