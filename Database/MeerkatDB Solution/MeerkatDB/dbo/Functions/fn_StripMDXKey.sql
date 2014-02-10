
-- =============================================
-- Author:		Mark Stacey
-- Create date: 2011/07/31
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[fn_StripMDXKey] 
(
	-- Add the parameters for the function here
	@MDXValue varchar(500)
)
RETURNS varchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(500)
	
	IF ISNUMERIC(@MDXValue) =1  set @Result = @MDXValue 
	
	else 
	BEGIN
	set @MDXValue = REPLACE(@MDXValue, '|','&')
SET @Result = 
 CASE WHEN CHARINDEX('&',@MDXValue) > 0 THEN REPLACE(REVERSE(LEFT(reverse(@MDXValue)
		, 
		CHARINDEX('&',reverse(@MDXValue)) -2
		
		)),']','')
		
		WHEN CHARINDEX('[', @MDXValue) > 0 THEN
		REPLACE(RIGHT (@MDXValue
,
CHARINDEX('[',REVERSE(@MDXValue))-1
), ']','')
		
ELSE CAST( @MDXValue  as varchar(255)) END
END
	-- Return the result of the function
	RETURN @Result

END