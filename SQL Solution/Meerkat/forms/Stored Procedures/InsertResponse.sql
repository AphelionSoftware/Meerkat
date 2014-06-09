CREATE PROC forms.InsertResponse

( @FormResponse_ID			int
 ,@Question_ID				int
 ,@PotentialResponse_ID		int
 ,@Response					varchar(max)
 ,@TrueFalse				bit
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