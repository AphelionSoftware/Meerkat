

-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-24
-- Description:	Procedure to insert or update Indicator Value table
-- =============================================
CREATE PROCEDURE [Core].[uspModIndicatorValue]
	-- Add the parameters for the stored procedure here
	@CRUD nvarchar(5),   -- C=Create,R=Read,U=Update,D=Delete
	@IndicatorValues_ID int ,
	@Indicator_ID as [int]  ,
	@BaselineLabel as [varchar](50)  ,
	@BaselineValue as [decimal](20, 5) ,
	@BaselineString as [varchar](max) ,
	@BaselineDate as [date] ,
	@TargetLabel as [varchar](50)  ,
	@TargetValue as [decimal](20, 5) ,
	@TargetValueString as [varchar](max) ,
	@TargetDate as [date] ,
	@ActualLabel as [varchar](50)  ,
	@ActualValue as [decimal](20, 5) ,
	@ActualValueString as [varchar](max) ,
	@ActualDate as [date] ,
	@BusinessKey as [varchar](max) ,
	@Notes as [varchar](max) ,
	@VerifiedActualValue as [decimal](20, 5) ,
	@VerifiedActualNotes as [varchar](max) ,
	@DataVersion_ID as [int]  ,
	@Location_ID as [int]  ,
	@IndicatorStatusPercent as [decimal](18, 2) ,
	@ReportPeriodID as [int]  ,
	@Title as [varchar](255) ,
	@ModifiedDate as [datetime] ,
	@Organization_ID as [int] ,
	@Username as [varchar](255) 

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
IF @CRUD in ('C','U')
	Begin
	Declare @@TTin as Table(
	[IndicatorValues_ID] [int]  NOT NULL,
	[Indicator_ID] [int] NOT NULL,
	[BaselineLabel] [varchar](50) NOT NULL,
	[BaselineValue] [decimal](20, 5) NULL,
	[BaselineString] [varchar](max) NULL,
	[BaselineDate] [date] NULL,
	[TargetLabel] [varchar](50) NOT NULL,
	[TargetValue] [decimal](20, 5) NULL,
	[TargetValueString] [varchar](max) NULL,
	[TargetDate] [date] NULL,
	[ActualLabel] [varchar](50) NOT NULL,
	[ActualValue] [decimal](20, 5) NULL,
	[ActualValueString] [varchar](max) NULL,
	[ActualDate] [date] NULL,
	[BusinessKey] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[VerifiedActualValue] [decimal](20, 5) NULL,
	[VerifiedActualNotes] [varchar](max) NULL,
	[DataVersion_ID] [int] NOT NULL,
	[Location_ID] [int] NOT NULL,
	[IndicatorStatusPercent] [decimal](18, 2) NULL,
	[ReportPeriodID] [int] NOT NULL,
	[Title] [varchar](255) NULL,
	[ModifiedDate] [datetime] NULL,
	[Organization_ID] [int] NULL,
	[Username] [varchar](255) NULL,
	[sys_CreatedOn] [datetime] NOT NULL,
	[sys_CreatedBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedOn] [datetime] NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL,
	[sys_Active] [int] NOT NULL)
    

	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select 
	@IndicatorValues_ID,
	@Indicator_ID
      ,@BaselineLabel
      ,@BaselineValue
      ,@BaselineString
      ,@BaselineDate
      ,@TargetLabel
      ,@TargetValue
      ,@TargetValueString
      ,@TargetDate
      ,@ActualLabel
      ,@ActualValue
      ,@ActualValueString
      ,@ActualDate
      ,@BusinessKey
      ,@Notes
      ,@VerifiedActualValue
      ,@VerifiedActualNotes
      ,@DataVersion_ID
      ,@Location_ID
      ,@IndicatorStatusPercent
      ,@ReportPeriodID
      ,@Title
      ,@ModifiedDate
      ,@Organization_ID
      ,@Username
      ,GetUTCDate()--@sys_CreatedOn
      ,''--@sys_CreatedBy
      ,GetUTCDate()--@sys_ModifiedOn
      ,''--@sys_ModifiedBy
      ,1--@sys_Active
	  
	  	--Execute Mege into Live
	Merge Into RBM.IndicatorValues as T
	USING @@TTin as S
	ON  s.IndicatorValues_ID=t.IndicatorValues_ID 
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[Indicator_ID]=s.[Indicator_ID],
t.[BaselineLabel]=s.[BaselineLabel],
t.[BaselineValue]=s.[BaselineValue],
t.[BaselineString]=s.[BaselineString],
t.[BaselineDate]=s.[BaselineDate],
t.[TargetLabel]=s.[TargetLabel],
t.[TargetValue]=s.[TargetValue],
t.[TargetValueString]=s.[TargetValueString],
t.[TargetDate]=s.[TargetDate],
t.[ActualLabel]=s.[ActualLabel],
t.[ActualValue]=s.[ActualValue],
t.[ActualValueString]=s.[ActualValueString],
t.[ActualDate]=s.[ActualDate],
t.[BusinessKey]=s.[BusinessKey],
t.[Notes]=s.[Notes],
t.[VerifiedActualValue]=s.[VerifiedActualValue],
t.[VerifiedActualNotes]=s.[VerifiedActualNotes],
t.[DataVersion_ID]=s.[DataVersion_ID],
t.[Location_ID]=s.[Location_ID],
t.[IndicatorStatusPercent]=s.[IndicatorStatusPercent],
t.[ReportPeriodID]=s.[ReportPeriodID],
t.[Title]=s.[Title],
t.[ModifiedDate]=s.[ModifiedDate],
t.[Organization_ID]=s.[Organization_ID],
t.[Username]=s.[Username],
--t.[sys_CreatedOn]=s.[sys_CreatedOn],
--t.[sys_CreatedBy]=s.[sys_CreatedBy],
t.[sys_ModifiedOn]=s.[sys_ModifiedOn],
t.[sys_ModifiedBy]=s.[sys_ModifiedBy]


	WHEN NOT MATCHED Then Insert

	(
	[Indicator_ID]
,[BaselineLabel]
,[BaselineValue]
,[BaselineString]
,[BaselineDate]
,[TargetLabel]
,[TargetValue]
,[TargetValueString]
,[TargetDate]
,[ActualLabel]
,[ActualValue]
,[ActualValueString]
,[ActualDate]
,[BusinessKey]
,[Notes]
,[VerifiedActualValue]
,[VerifiedActualNotes]
,[DataVersion_ID]
,[Location_ID]
,[IndicatorStatusPercent]
,[ReportPeriodID]
,[Title]
,[ModifiedDate]
,[Organization_ID]
,[Username]
,[sys_CreatedOn]
,[sys_CreatedBy]
,[sys_ModifiedOn]
,[sys_ModifiedBy]
,[sys_Active]
 

	)
	Values
	(
s.[Indicator_ID],
s.[BaselineLabel],
s.[BaselineValue],
s.[BaselineString],
s.[BaselineDate],
s.[TargetLabel],
s.[TargetValue],
s.[TargetValueString],
s.[TargetDate],
s.[ActualLabel],
s.[ActualValue],
s.[ActualValueString],
s.[ActualDate],
s.[BusinessKey],
s.[Notes],
s.[VerifiedActualValue],
s.[VerifiedActualNotes],
s.[DataVersion_ID],
s.[Location_ID],
s.[IndicatorStatusPercent],
s.[ReportPeriodID],
s.[Title],
s.[ModifiedDate],
s.[Organization_ID],
s.[Username],
s.[sys_CreatedOn],
s.[sys_CreatedBy],
s.[sys_ModifiedOn],
s.[sys_ModifiedBy],
s.[sys_Active]


	);
End

IF @CRUD Like 'R'
Begin 
--Return Result
Select * from RBM.IndicatorValues s where s.IndicatorValues_ID=@IndicatorValues_ID
End
IF @CRUD Like 'D'
Begin 

Update RBM.IndicatorValues  
Set Sys_Active = -1 -- 1 = Active 0=Not Active -1=Deleted
where IndicatorValues_ID=@IndicatorValues_ID
End




END


