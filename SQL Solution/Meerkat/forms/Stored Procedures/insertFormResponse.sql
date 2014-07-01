CREATE PROCEDURE [forms].[insertFormResponse]
(@FormID int
,@isConfidential bit = 0
)
AS



INSERT INTO [forms].[FormResponse]
           ([Form_ID]
		   ,[isConfidential]

          )
		  Output inserted.FormResponse_ID
     VALUES
           (@FormID, @isConfidential)
		   

RETURN