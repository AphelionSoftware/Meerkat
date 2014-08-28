INSERT  INTO [Core].PersonParticipationType
(
          [Core].[PersonParticipationType].[Code] ,
          [Core].[PersonParticipationType].[Name] ,
		  [Core].[PersonParticipationType].[BusinessKey]
        )
        SELECT  Src.Code
				, Src.Name
				, Src.Code
			FROM (
			SELECT 'DIRECT' AS Code,
                'Direct Participant' AS Name
				) Src
                
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.PersonParticipationType
                             WHERE  [Core].[PersonParticipationType].[Code] = Src.Code )
        UNION ALL
        SELECT  Src.Code
				, Src.Name
				, Src.Code
			FROM (
			SELECT 'INDIRECT' AS Code,
                'Indirect Participant' AS Name
				) Src
                
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.PersonParticipationType
                             WHERE  [Core].[PersonParticipationType].[Code] = Src.Code )
        UNION ALL
        SELECT  Src.Code
				, Src.Name
				, Src.Code
			FROM (
			SELECT 'STAFF' AS Code,
                'Care Staff' AS Name
				) Src
                
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.PersonParticipationType
                             WHERE  [Core].[PersonParticipationType].[Code] = Src.Code )

		UNION ALL
        SELECT  Src.Code
				, Src.Name
				, Src.Code
			FROM (
			SELECT 'FACILITATOR' AS Code,
                'Project Facilitator' AS Name
				) Src
                
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.PersonParticipationType
                             WHERE  [Core].[PersonParticipationType].[Code] = Src.Code )
							 
		UNION ALL
        SELECT  Src.Code
				, Src.Name
				, Src.Code
			FROM (
			SELECT 'PARTNER' AS Code,
                'Project Partner Staff' AS Name
				) Src
                
        WHERE   NOT EXISTS ( SELECT 1
                             FROM   Core.PersonParticipationType
                             WHERE  [Core].[PersonParticipationType].[Code] = Src.Code )