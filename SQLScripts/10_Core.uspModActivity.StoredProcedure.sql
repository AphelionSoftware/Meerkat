USE [MeerKat]
GO
/****** Object:  StoredProcedure [Core].[uspModActivity]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[uspModActivity]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-05
-- Description:	Procedure to insert or update Activity table
-- =============================================
CREATE PROCEDURE [Core].[uspModActivity]
	-- Add the parameters for the stored procedure here
	
	@ActivityID as [nvarchar](255) ,
	@ActivityName as [nvarchar](255),
	@ActivityOwnerID as [nvarchar](255) ,
	@ActivityDepID as [nvarchar](255),
	@ActivityDescription as [nvarchar](max) ,
	@ActivityParentID as [nvarchar](255),
	@ActivityTypeID as [nvarchar](255),
	@sys_UserID as [nvarchar](255) 

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
	Declare @@TTin as Table(
	
	[ActivityID] [nvarchar](255) NOT NULL,
	[ActivityName] [nvarchar](255) NOT NULL,
	[ActivityOwnerID] [nvarchar](255) NOT NULL,
	[ActivityDepID] [nvarchar](255) NOT NULL,
	[ActivityDescription] [nvarchar](max) NOT NULL,
	[ActivityParentID] [nvarchar](255) NULL,
	[ActivityTypeID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL)
    
	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select @ActivityID,@ActivityName,@ActivityOwnerID,@ActivityDepID,@ActivityDescription,@ActivityParentID,@ActivityTypeID,GetDate(),GetDate(),@SYS_UserID,@SYS_UserID

	--Execute Mege into Live
	Merge Into App.Activity as T
	USING @@TTin as S
	ON  s.ActivityID=t.ActivityID 
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[ActivityName] = s.[ActivityName]	
	,t.[ActivityOwnerID] = s.[ActivityOwnerID]
	,t.[ActivityDepID]=s.[ActivityDepID]
	,t.[ActivityDescription]=s.[ActivityDescription]
	,t.[ActivityParentID]=s.[ActivityParentID]
	,t.[ActivityTypeID]=s.[ActivityTypeID]
	,t.[sys_modified]=s.[sys_modified]
	,t.[sys_ModifiedBy]=s.[sys_ModifiedBy]

	WHEN NOT MATCHED Then Insert

	(
	[ActivityID] ,
	[ActivityName] ,
	[ActivityOwnerID] ,
	[ActivityDepID] ,
	[ActivityDescription] ,
	[ActivityParentID] ,
	[ActivityTypeID] ,
	[sys_created] ,
	[sys_modified] ,
	[sys_createdBy] ,
	[sys_ModifiedBy]
	)
	Values
	(
	NewID() ,
	s.[ActivityName] ,
	s.[ActivityOwnerID] ,
	s.[ActivityDepID] ,
	s.[ActivityDescription] ,
	s.[ActivityParentID] ,
	s.[ActivityTypeID] ,
	s.[sys_created] ,
	s.[sys_modified] ,
	s.[sys_createdBy] ,
	s.[sys_ModifiedBy]

	);

--Return Result
Select * from App.Activity s where s.ActivityID=@ActivityID
END

' 
END
GO
