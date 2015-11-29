
INSERT  [app].[Sector]
        ( 
          [app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          ,[app].[Sector].Programme_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Programme_ID
		FROM 				 
		(SELECT 
		
		 
                N'FIN' AS Code,
                N'Financial services BI' As ShortName,
                N'Financial services BI' As LongName,
                N'Financial services BI' As TextDescription,
                N'SEC3.1' AS BusinessKey,
                PRG.Programme_ID
			FROM app.Programme PRG
			WHERE PRG.code = 'PRG3'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO


INSERT  [app].[Sector]
        ( 
          [app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          ,[app].[Sector].Programme_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Programme_ID
		FROM 				 
		(SELECT 
		
		 
                N'WECHAT' AS Code,
                N'WeChat Consulting' As ShortName,
                N'WeChat Consulting' As LongName,
                N'WeChat Consulting' As TextDescription,
                N'SEC3.2' AS BusinessKey,
                PRG.Programme_ID
			FROM app.Programme PRG
			WHERE PRG.code = 'PRG3'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO



INSERT  [app].[Sector]
        ( 
          [app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          ,[app].[Sector].Programme_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Programme_ID
		FROM 				 
		(SELECT 
		
		 
                N'RETAIL' AS Code,
                N'Retail BI' As ShortName,
                N'Retail BI' As LongName,
                N'Retail BI' As TextDescription,
                N'SEC3.3' AS BusinessKey,
                PRG.Programme_ID
			FROM app.Programme PRG
			WHERE PRG.code = 'PRG3'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO



INSERT  [app].[Sector]
        ( 
          [app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          ,[app].[Sector].Programme_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Programme_ID
		FROM 				 
		(SELECT 
		
		 
                N'VEH' AS Code,
                N'Vehicle Tracking BI' As ShortName,
                N'Vehicle Tracking BI' As LongName,
                N'Vehicle Tracking BI' As TextDescription,
                N'SEC3.4' AS BusinessKey,
                PRG.Programme_ID
			FROM app.Programme PRG
			WHERE PRG.code = 'PRG3'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO





INSERT  [app].[Sector]
        ( 
          [app].[Sector].[Code]
          ,[app].[Sector].[ShortName]
          ,[app].[Sector].[LongName]
          ,[app].[Sector].[TextDescription]
          ,[app].[Sector].[BusinessKey]
          ,[app].[Sector].Programme_ID
          )
        SELECT 
		 
		[Code]
		,[ShortName]
		,[LongName]
		,[TextDescription]
		,[BusinessKey]
		,Programme_ID
		FROM 				 
		(SELECT 
		
		 
                N'GEN' AS Code,
                N'General BI' As ShortName,
                N'General BI' As LongName,
                N'General BI' As TextDescription,
                N'SEC3.5' AS BusinessKey,
                PRG.Programme_ID
			FROM app.Programme PRG
			WHERE PRG.code = 'PRG3'
				) as Src
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   [app].[Sector]
                             WHERE  [app].[Sector].[BusinessKey] = src.BusinessKey) 

GO




