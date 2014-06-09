CREATE PROCEDURE forms.insertFormResponse
(@FormID int)
AS



INSERT INTO [forms].[FormResponse]
           ([Form_ID]

          )
		  Output inserted.FormResponse_ID
     VALUES
           (@FormID)
		   

RETURN