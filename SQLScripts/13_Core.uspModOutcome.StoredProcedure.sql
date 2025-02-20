USE [MeerKat]
GO
/****** Object:  StoredProcedure [Core].[uspModOutcome]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[uspModOutcome]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-05
-- Description:	Procedure to insert or update Outcome table
-- =============================================
CREATE PROCEDURE [Core].[uspModOutcome]
	-- Add the parameters for the stored procedure here
	
	@OutcomeID as [nvarchar](255) ,
	@OutcomeName as [nvarchar](255),
	@OutcomeOwnerID as [nvarchar](255) ,
	@OutcomeDepID as [nvarchar](255),
	@OutcomeDescription as [nvarchar](max) ,
	@OutcomeParentID as [nvarchar](255),
	@OutComeTypeID as [nvarchar](255),
	@sys_UserID as [nvarchar](255) 

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
	Declare @@TTin as Table(
	
	[OutcomeID] [nvarchar](255) NOT NULL,
	[OutcomeName] [nvarchar](255) NOT NULL,
	[OutcomeOwnerID] [nvarchar](255) NOT NULL,
	[OutcomeDepID] [nvarchar](255) NOT NULL,
	[OutcomeDescription] [nvarchar](max) NOT NULL,
	[OutcomeParentID] [nvarchar](255) NULL,
	[OutComeTypeID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL)
    
	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select @OutcomeID,@OutcomeName,@OutcomeOwnerID,@OutcomeDepID,@OutcomeDescription,@OutcomeParentID,@OutComeTypeID,GetDate(),GetDate(),@SYS_UserID,@SYS_UserID

	--Execute Mege into Live
	Merge Into App.Outcome as T
	USING @@TTin as S
	ON  s.OutcomeID=t.OutcomeID 
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[OutcomeName] = s.[OutcomeName]	
	,t.[OutcomeOwnerID] = s.[OutcomeOwnerID]
	,t.[OutcomeDepID]=s.[OutcomeDepID]
	,t.[OutcomeDescription]=s.[OutcomeDescription]
	,t.[OutcomeParentID]=s.[OutcomeParentID]
	,t.[OutComeTypeID]=s.[OutComeTypeID]
	,t.[sys_modified]=s.[sys_modified]
	,t.[sys_ModifiedBy]=s.[sys_ModifiedBy]

	WHEN NOT MATCHED Then Insert

	(
	[OutcomeID] ,
	[OutcomeName] ,
	[OutcomeOwnerID] ,
	[OutcomeDepID] ,
	[OutcomeDescription] ,
	[OutcomeParentID] ,
	[OutComeTypeID] ,
	[sys_created] ,
	[sys_modified] ,
	[sys_createdBy] ,
	[sys_ModifiedBy]
	)
	Values
	(
	NewID() ,
	s.[OutcomeName] ,
	s.[OutcomeOwnerID] ,
	s.[OutcomeDepID] ,
	s.[OutcomeDescription] ,
	s.[OutcomeParentID] ,
	s.[OutComeTypeID] ,
	s.[sys_created] ,
	s.[sys_modified] ,
	s.[sys_createdBy] ,
	s.[sys_ModifiedBy]

	);

--Return Result
Select * from App.Outcome s where s.OutcomeID=@OutcomeID
END

' 
END
GO
