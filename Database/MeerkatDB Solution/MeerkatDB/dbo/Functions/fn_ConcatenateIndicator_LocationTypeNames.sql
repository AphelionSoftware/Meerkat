
-- =============================================
-- Author:		Mark Stacey
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION  [dbo].[fn_ConcatenateIndicator_LocationTypeNames] 
(
	-- Add the parameters for the function here
	@Indicator_ID int
)
RETURNS varchar(8000)
AS
BEGIN
	
	DECLARE @Result varchar(8000)
	Set @Result = ''
	SELECT @Result = @Result + CHAR(10) + CHAR(13) + src.Name
	FROM (SELECT 
	LT.Description name
	FROM app.Indicator I
	inner join RBM.IndicatorValues IV
	on I.IndicatorID = IV.Indicator_ID
	inner join Core.Location L
	on IV.Location_ID = L.Location_ID
	inner join Core.LocationType LT
	on L.LocationType_ID = LT.LocationType_ID
	WHERE i.IndicatorID = @Indicator_ID
	GROUP BY LT.Description) src
RETURN @Result
END