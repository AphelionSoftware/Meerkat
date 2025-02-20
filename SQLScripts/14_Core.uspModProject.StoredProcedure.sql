USE [MeerKat]
GO
/****** Object:  StoredProcedure [Core].[uspModProject]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[uspModProject]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-05
-- Description:	Procedure to insert or update Project table
-- =============================================
CREATE PROCEDURE [Core].[uspModProject]
	-- Add the parameters for the stored procedure here
	
	@ProjectID as [nvarchar](255) ,
	@ProjectName as [nvarchar](255),
	@ProjectOwnerID as [nvarchar](255) ,
	@ProjectDepID as [nvarchar](255),
	@ProjectDescription as [nvarchar](max) ,
	@ProjectParentID as [nvarchar](255),
	@ProjectTypeID as [nvarchar](255),
	@sys_UserID as [nvarchar](255) 

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
	Declare @@TTin as Table(
	
	[ProjectID] [nvarchar](255) NOT NULL,
	[ProjectName] [nvarchar](255) NOT NULL,
	[ProjectOwnerID] [nvarchar](255) NOT NULL,
	[ProjectDepID] [nvarchar](255) NOT NULL,
	[ProjectDescription] [nvarchar](max) NOT NULL,
	[ProjectParentID] [nvarchar](255) NULL,
	[ProjectTypeID] [nvarchar](255) NOT NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL)
    
	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select @ProjectID,@ProjectName,@ProjectOwnerID,@ProjectDepID,@ProjectDescription,@ProjectParentID,@ProjectTypeID,GetDate(),GetDate(),@SYS_UserID,@SYS_UserID

	--Execute Mege into Live
	Merge Into App.Project as T
	USING @@TTin as S
	ON  s.ProjectID=t.ProjectID 
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[ProjectName] = s.[ProjectName]	
	,t.[ProjectOwnerID] = s.[ProjectOwnerID]
	,t.[ProjectDepID]=s.[ProjectDepID]
	,t.[ProjectDescription]=s.[ProjectDescription]
	,t.[ProjectParentID]=s.[ProjectParentID]
	,t.[ProjectTypeID]=s.[ProjectTypeID]
	,t.[sys_modified]=s.[sys_modified]
	,t.[sys_ModifiedBy]=s.[sys_ModifiedBy]

	WHEN NOT MATCHED Then Insert

	(
	[ProjectID] ,
	[ProjectName] ,
	[ProjectOwnerID] ,
	[ProjectDepID] ,
	[ProjectDescription] ,
	[ProjectParentID] ,
	[ProjectTypeID] ,
	[sys_created] ,
	[sys_modified] ,
	[sys_createdBy] ,
	[sys_ModifiedBy]
	)
	Values
	(
	NewID() ,
	s.[ProjectName] ,
	s.[ProjectOwnerID] ,
	s.[ProjectDepID] ,
	s.[ProjectDescription] ,
	s.[ProjectParentID] ,
	s.[ProjectTypeID] ,
	s.[sys_created] ,
	s.[sys_modified] ,
	s.[sys_createdBy] ,
	s.[sys_ModifiedBy]

	);

--Return Result
Select * from App.Project s where s.ProjectID=@ProjectID
END

' 
END
GO
