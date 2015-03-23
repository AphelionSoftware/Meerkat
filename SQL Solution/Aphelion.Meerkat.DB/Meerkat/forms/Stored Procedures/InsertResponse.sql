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
 ,@DateResponse				date = null
 ,@isConfidential			bit = false
 ,@Location_ID				int = null
 ,@Age_ID					int = null
 ,@AgeBand_ID				int = null
 ,@CommunityType_ID			int = null
 ,@Gender_ID				int = null
 ,@Group_ID					int = null
 ,@Institution_ID			int = null
 ,@ProjectID			int = null
 ,@ReportingPeriod_ID			int = null
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
			,[ProjectID]
			,[ReportingPeriod_ID]
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
			,@ProjectID
			,@ReportingPeriod_ID
WHERE NOT EXISTS (SELECT 1 FROM forms.FormResponse WHERE FormResponse_FNVID = @FormResponse_FNVID)




IF NOT (SELECT qt.Code from 
forms.Question q
	inner join forms.QuestionType qt 
		on Q.QuestionType_ID = qt.QuestionType_ID
	WHERE Q.Question_ID = @Question_ID) = 'MCQ'
BEGIN
INSERT INTO [forms].[Response]
           ([FormResponse_ID]
		   , FormResponse_FNVID
           ,[Question_ID]
           ,[PotentialResponse_ID]
           ,[Response]
           ,[TrueFalse]
		   ,IntegerResponse
		   ,DecimalResponse
		   ,DateResponse
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
		   ,@DateResponse
		   FROM forms.FormResponse tbl
		    WHERE tbl.FormResponse_FNVID = @FormResponse_FNVID
END
ELSE BEGIN

SET @Response = REPLACE(','+@Response +',', ',,',',')

INSERT INTO [forms].[Response]
           ([FormResponse_ID]
		   , FormResponse_FNVID
           ,[Question_ID]
           ,[PotentialResponse_ID]
           ,[Response]
           ,[TrueFalse]
		   ,IntegerResponse
		   ,DecimalResponse
		   ,DateResponse
           )
     SELECT
           
		    tbl.FormResponse_ID
			,@FormResponse_FNVID		
		   ,@Question_ID			
		   ,/*PotentialResponse_ID	*/
		   SUBSTRING(@Response,TallyNumber+1,CHARINDEX(',',@Response,TallyNumber+1)-TallyNumber-1)

		   ,''				
		   ,@TrueFalse		
		   ,@IntegerResponse
		   ,@DecimalResponse	
		   ,@DateResponse
		   FROM forms.FormResponse tbl
		   INNER JOIN (SELECT  DateSK AS TallyNumber FROM Core.DimDate) As TallyTable
				ON TallyTable.TallyNumber < LEN(@Response)
		    WHERE tbl.FormResponse_FNVID = @FormResponse_FNVID
				AND  SUBSTRING(@Response,TallyNumber,1) = ',' --Notice how we find the comma
			AND NOT EXISTS (SELECT 1 FROM [forms].[Response]
				WHERE FormResponse_ID = tbl.FormResponse_ID
					AND Question_ID = @Question_ID
					AND PotentialResponse_ID =  SUBSTRING(@Response,TallyNumber+1,CHARINDEX(',',@Response,TallyNumber+1)-TallyNumber-1) 
					 )

UPDATE forms.FormResponse

SET isComplete = 1
FROM forms.FormResponse FR

WHERE
isComplete = 0 AND
 (

select count(DISTINCT Question_ID) From forms.Response R
WHERE r.FormResponse_ID = FR.FormResponse_ID)
>=

(select count(*) from forms.Question Q
INNER join forms.Category C
on Q.Category_ID = C.Category_ID
WHERE C.Form_ID = FR.Form_ID)

END

