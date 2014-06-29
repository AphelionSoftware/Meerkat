CREATE PROC forms.InsertResponse


( @FormResponse_ID			int 
 ,@Question_ID				int 
 ,@PotentialResponse_ID		int = null
 ,@Response					varchar(max) = null
 ,@TrueFalse				bit = null
)
as 
INSERT INTO [forms].[Response]
           ([FormResponse_ID]
           ,[Question_ID]
           ,[PotentialResponse_ID]
           ,[Response]
           ,[TrueFalse]
           )
     VALUES
           (
		    @FormResponse_ID		
		   ,@Question_ID			
		   ,@PotentialResponse_ID	
		   ,@Response				
		   ,@TrueFalse			
		   )