
INSERT  [app].[SubSector]
        ( 
          [app].[SubSector].[Code]
          ,[app].[SubSector].[ShortName]
          ,[app].[SubSector].[LongName]
          ,[app].[SubSector].[TextDescription]
          ,[app].[SubSector].[BusinessKey]
          ,[app].[SubSector].Sector_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Sector_ID
		FROM 				 
		(SELECT 
		
		 
                N'BANK' AS Code,
                N'Banking BI' As ShortName,
                N'Banking BI' As LongName,
                N'Banking BI' As TextDescription,
                N'SECS3.1.1' AS BusinessKey,
                SEC.Sector_ID
			FROM app.Sector SEC
			WHERE SEC.code = 'FIN'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[SubSector]
                             WHERE  [app].[SubSector].[BusinessKey] = src.BusinessKey) 

GO

INSERT  [app].[SubSector]
        ( 
          [app].[SubSector].[Code]
          ,[app].[SubSector].[ShortName]
          ,[app].[SubSector].[LongName]
          ,[app].[SubSector].[TextDescription]
          ,[app].[SubSector].[BusinessKey]
          ,[app].[SubSector].Sector_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Sector_ID
		FROM 				 
		(SELECT 
		
		 
                N'INS' AS Code,
                N'Insurance BI' As ShortName,
                N'Insurance BI' As LongName,
                N'Insurance BI' As TextDescription,
                N'SECS3.1.2' AS BusinessKey,
                SEC.Sector_ID
			FROM app.Sector SEC
			WHERE SEC.code = 'FIN'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[SubSector]
                             WHERE  [app].[SubSector].[BusinessKey] = src.BusinessKey) 

GO
