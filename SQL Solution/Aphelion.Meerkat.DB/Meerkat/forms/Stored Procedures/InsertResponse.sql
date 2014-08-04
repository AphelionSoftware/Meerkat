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
 ,@Location_ID				int = null
 ,@Age_ID					int = null
 ,@AgeBand_ID				int = null
 ,@CommunityType_ID			int = null
 ,@Gender_ID				int = null
 ,@Group_ID					int = null
 ,@Institution_ID			int = null
)
as 
DECLARE @tbl table(FormResponse_ID INT)

INSERT INTO forms.FormResponse
([Form_ID]
		   ,[FormResponse_FNVID]
		   ,[isConfidential]
			,[Location_ID]
			,[Age_ID]
			,[AgeBand_ID]
			,[CommunityType_ID]
			,[Gender_ID]
			,[Group_ID]
			,[Institution_ID]
		   )
		    SELECT @FormID 
			, @FormResponse_FNVID
			, @isConfidential
			,@Location_ID		
			,@Age_ID			
			,@AgeBand_ID		
			,@CommunityType_ID	
			,@Gender_ID		
			,@Group_ID			
			,@Institution_ID	
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

