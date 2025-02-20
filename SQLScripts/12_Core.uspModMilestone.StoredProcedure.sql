USE [MeerKat]
GO
/****** Object:  StoredProcedure [Core].[uspModMilestone]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[uspModMilestone]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-05
-- Description:	Procedure to insert or update Milestone table
-- =============================================
CREATE PROCEDURE [Core].[uspModMilestone]
	-- Add the parameters for the stored procedure here
	
	@MilestoneID as [nvarchar](255) ,
	@MilestoneName as [nvarchar](255),
	@MilestoneOwnerID as [nvarchar](255) ,
	@MilestoneDepID as [nvarchar](255),
	@MilestoneDescription as [nvarchar](max) ,
	@MilestoneParentID as [nvarchar](255),
	@MilestoneTypeID as [nvarchar](255),
	@sys_UserID as [nvarchar](255) 

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
	Declare @@TTin as Table(
	
	[MilestoneID] [nvarchar](255) NOT NULL,
	[MilestoneName] [nvarchar](255) NOT NULL,
	[MilestoneOwnerID] [nvarchar](255) NOT NULL,
	[MilestoneDepID] [nvarchar](255) NOT NULL,
	[MilestoneDescription] [nvarchar](max) NOT NULL,
	[MilestoneParentID] [nvarchar](255) NULL,
	[MilestoneTypeID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL)
    
	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select @MilestoneID,@MilestoneName,@MilestoneOwnerID,@MilestoneDepID,@MilestoneDescription,@MilestoneParentID,@MilestoneTypeID,GetDate(),GetDate(),@SYS_UserID,@SYS_UserID

	--Execute Mege into Live
	Merge Into App.Milestone as T
	USING @@TTin as S
	ON  s.MilestoneID=t.MilestoneID 
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[MilestoneName] = s.[MilestoneName]	
	,t.[MilestoneOwnerID] = s.[MilestoneOwnerID]
	,t.[MilestoneDepID]=s.[MilestoneDepID]
	,t.[MilestoneDescription]=s.[MilestoneDescription]
	,t.[MilestoneParentID]=s.[MilestoneParentID]
	,t.[MilestoneTypeID]=s.[MilestoneTypeID]
	,t.[sys_modified]=s.[sys_modified]
	,t.[sys_ModifiedBy]=s.[sys_ModifiedBy]

	WHEN NOT MATCHED Then Insert

	(
	[MilestoneID] ,
	[MilestoneName] ,
	[MilestoneOwnerID] ,
	[MilestoneDepID] ,
	[MilestoneDescription] ,
	[MilestoneParentID] ,
	[MilestoneTypeID] ,
	[sys_created] ,
	[sys_modified] ,
	[sys_createdBy] ,
	[sys_ModifiedBy]
	)
	Values
	(
	NewID() ,
	s.[MilestoneName] ,
	s.[MilestoneOwnerID] ,
	s.[MilestoneDepID] ,
	s.[MilestoneDescription] ,
	s.[MilestoneParentID] ,
	s.[MilestoneTypeID] ,
	s.[sys_created] ,
	s.[sys_modified] ,
	s.[sys_createdBy] ,
	s.[sys_ModifiedBy]

	);

--Return Result
Select * from App.Milestone s where s.MilestoneID=@MilestoneID
END

' 
END
GO
