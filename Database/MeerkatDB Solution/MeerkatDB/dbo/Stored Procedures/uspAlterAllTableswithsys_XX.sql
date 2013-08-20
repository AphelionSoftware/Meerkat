-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  uspAlterAllTableswithsys_XX
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @i int
DECLARE @FTN Nvarchar(500)
DECLARE @TableList TABLE (
    idx smallint Primary Key IDENTITY(1,1)
    , FTN Nvarchar(500) 
)



INSERT @TableList
  Select s.name + '.' + o.name as FTN 
 from Sys.objects o 
 Inner Join sys.schemas s on o.schema_id=s.schema_id
 where o.type like 'U ' 

SET @i = 1
Declare @numrows int = (SELECT COUNT(*) FROM @TableList)
IF @numrows > 0
    WHILE (@i <= (SELECT MAX(idx) FROM @TableList))
    BEGIN


        -- get the next employee primary key
        SET @FTN = (SELECT FTN FROM @TableList WHERE idx = @i)


        --
        -- do something with this employee
        EXEC	 [dbo].[uspCreateSysDefaultColumns]
		@@FTable = @FTN
    

        -- increment counter for next employee
        SET @i = @i + 1
    END
    

 
 

END