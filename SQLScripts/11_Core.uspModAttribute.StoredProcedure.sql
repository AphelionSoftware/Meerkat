USE [MeerKat]
GO
/****** Object:  StoredProcedure [Core].[uspModAttribute]    Script Date: 2013-03-06 08:42:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Core].[uspModAttribute]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Andreas Bergstedt
-- Create date: 2013-03-05
-- Description:	Procedure to insert or update attributes table
-- =============================================
CREATE PROCEDURE [Core].[uspModAttribute]
	-- Add the parameters for the stored procedure here
	@ParentID Nvarchar(255)
	,@AttributeTypeID int
	,@AttributeName Nvarchar(255)
	,@AttributeStrVal Nvarchar(MAX)
	,@AttributenumericalVal numeric(18,5)
	,@AttributeDateTimeVal dateTime
	,@SYS_UserID as Nvarchar(255)

AS
BEGIN
	
	SET NOCOUNT ON;
	--Generate Memory Table for Merge
	Declare @@TTin as Table(
	
	[ParentID] [nvarchar](255) NOT NULL,
	[AttributeTypeID] [int] NOT NULL,
	[AttributeName] [nvarchar](250) NULL,
	[AttributeStrVal] [nvarchar](max) NULL,
	[AttributenumericalVal] [numeric](18, 5) NULL,
	[AttributeDateTimeVal] [datetime] NULL,
	[sys_created] [datetime] NOT NULL,
	[sys_modified] [datetime] NOT NULL,
	[sys_createdBy] [nvarchar](255) NOT NULL,
	[sys_ModifiedBy] [nvarchar](255) NOT NULL)
    
	--Insert Parameter Values in temp Table
	
	Insert Into @@TTin
	Select @ParentID,@AttributeTypeID,@AttributeName,@AttributeStrVal,@AttributenumericalVal,@AttributeDateTimeVal,GetDate(),GetDate(),@SYS_UserID,@SYS_UserID

	--Execute Mege into Live
	Merge Into App.Attributes as T
	USING @@TTin as S
	ON  s.ParentID=t.ParentID and S.AttributeTypeID=t.AttributeTypeID
	When MATCHED 
	Then UPDATE
	
	Set 
	t.[AttributeName] = s.AttributeName	
	,t.[AttributeStrVal] = s.AttributeStrVal
	,t.[AttributenumericalVal]=s.[AttributenumericalVal]
	,t.[AttributeDateTimeVal]=s.[AttributeDateTimeVal]
	,t.[sys_modified]=s.[sys_modified]
	,t.[sys_ModifiedBy]=s.[sys_ModifiedBy]

	WHEN NOT MATCHED Then Insert

	(
	[ParentID] ,
	[AttributeTypeID] ,
	[AttributeName] ,
	[AttributeStrVal],
	[AttributenumericalVal] ,
	[AttributeDateTimeVal],
	[sys_created]  ,
	[sys_modified] ,
	[sys_createdBy] ,
	[sys_ModifiedBy]
	)
	Values
	(
	s.[ParentID] ,
	s.[AttributeTypeID] ,
	s.[AttributeName] ,
	s.[AttributeStrVal],
	s.[AttributenumericalVal] ,
	s.[AttributeDateTimeVal],
	s.[sys_created]  ,
	s.[sys_modified] ,
	s.[sys_createdBy] ,
	s.[sys_ModifiedBy]

	);

--Return Result
Select * from App.Attributes s where s.ParentID=@ParentID and S.AttributeTypeID=@AttributeTypeID
END
' 
END
GO
