CREATE PROCEDURE [forms].[MarkComplete]
(
	@FormResponse_FNVID bigint
 
)
AS



UPDATE [forms].[FormResponse]
          SET isComplete = 1 
		  WHERE FormResponse_FNVID = @FormResponse_FNVID

RETURN