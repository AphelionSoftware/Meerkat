CREATE PROC [forms].[InsertResponse]


( 
  @FormID				    int
 ,@FormResponse_FNVID		int 
 ,@Question_ID				int 
 ,@PotentialResponse_ID		int = null
 ,@Response					varchar(max) = null
 ,@TrueFalse				bit = null
 ,@IntegerResponse			int = null
 ,@DecimalResponse			decimal(20,12) = null
 ,@isConfidential			bit = false
)
as 
DECLARE @tbl table(FormResponse_ID INT)

INSERT INTO forms.FormResponse
([Form_ID]
		   ,[FormResponse_FNVID]
		   ,[isConfidential])
		    SELECT @FormID , @FormResponse_FNVID, @isConfidential
WHERE NOT EXISTS (SELECT 1 FROM forms.FormResponse WHERE FormResponse_FNVID = @FormResponse_FNVID)


INSERT INTO [forms].[Response]
           ([FormResponse_ID]
		   , FormResponse_FNVID
           ,[Question_ID]
           ,[PotentialResponse_ID]
           ,[Response]
           ,[TrueFalse]
		   ,IntegerResponse
		   ,DecimalResponse
           )
     SELECT
           
		    tbl.FormResponse_ID
			,@FormResponse_FNVID		
		   ,@Question_ID			
		   ,@PotentialResponse_ID	
		   ,@Response				
		   ,@TrueFalse		
		   ,@IntegerResponse
		   ,@DecimalResponse	
		   FROM forms.FormResponse tbl
		    WHERE tbl.FormResponse_FNVID = @FormResponse_FNVID

