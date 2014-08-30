  

CREATE VIEW [OLAP_GEN].[Milestone]
AS

SELECT 
	[Milestone_3537840701332031490].[Activity_ID] AS [MilestoneActivity_ID]
	,[Milestone_3537840701332031490].[Baseline] AS [MilestoneBaseline]
	,[Milestone_3537840701332031490].[BaselineDate] AS [MilestoneBaselineDate]
	,[Milestone_3537840701332031490].[BaselineDateID] AS [MilestoneBaselineDateID]
	,[Milestone_3537840701332031490].[BaselineString] AS [MilestoneBaselineString]
	,[Milestone_3537840701332031490].[BusinessKey] AS [MilestoneBusinessKey]
	,[Milestone_3537840701332031490].[Code] AS [MilestoneCode]
	,[Milestone_3537840701332031490].[LocalLongName] AS [MilestoneLocalLongName]
	,[Milestone_3537840701332031490].[LocalShortName] AS [MilestoneLocalShortName]
	,[Milestone_3537840701332031490].[LongName] AS [MilestoneLongName]
	,[Milestone_3537840701332031490].[MilestoneID] AS [MilestoneID]
	,COALESCE([Milestone_3537840701332031490].[MilestoneTypeID] , [MilestoneType_2773568552530191975].[MilestoneTypeID] ) AS [MilestoneTypeID]
	,[Milestone_3537840701332031490].[Notes] AS [MilestoneNotes]
	,COALESCE([Milestone_3537840701332031490].[ProjectID] , [Project_4456949503457366757].[ProjectID], [Project_5098028073883527751].[ProjectID] ) AS [MilestoneProjectID]
	,[Milestone_3537840701332031490].[ReleaseDate] AS [MilestoneReleaseDate]
	,[Milestone_3537840701332031490].[ReportingDate] AS [MilestoneReportingDate]
	,[Milestone_3537840701332031490].[ShortName] AS [MilestoneShortName]
	,[Milestone_3537840701332031490].[Target] AS [MilestoneTarget]
	,[Milestone_3537840701332031490].[TargetDate] AS [MilestoneTargetDate]
	,[Milestone_3537840701332031490].[TargetDateID] AS [MilestoneTargetDateID]
	,[Milestone_3537840701332031490].[TargetString] AS [MilestoneTargetString]
	,[Milestone_3537840701332031490].[TextDescription] AS [MilestoneTextDescription]
	,[Milestone_3537840701332031490].[UnitOfMeasure] AS [MilestoneUnitOfMeasure]
	,[Activity_7125318110836549528].[BusinessKey] AS [ActivityBusinessKey]
	,[Activity_7125318110836549528].[Code] AS [ActivityCode]
	,[Activity_7125318110836549528].[LocalLongName] AS [ActivityLocalLongName]
	,[Activity_7125318110836549528].[LocalShortName] AS [ActivityLocalShortName]
	,[Activity_7125318110836549528].[LongName] AS [ActivityLongName]
	,[Activity_7125318110836549528].[ProjectID] AS [ActivityProjectID]
	,[Activity_7125318110836549528].[ShortName] AS [ActivityShortName]
	,[Activity_7125318110836549528].[TextDescription] AS [ActivityTextDescription]
	,COALESCE([Project_4456949503457366757].[BusinessKey] , [Project_5098028073883527751].[BusinessKey] ) AS [ProjectBusinessKey]
	,COALESCE([Project_4456949503457366757].[Code] , [Project_5098028073883527751].[Code] ) AS [ProjectCode]
	,COALESCE([Project_4456949503457366757].[isSiteCreated] , [Project_5098028073883527751].[isSiteCreated] ) AS [ProjectisSiteCreated]
	,COALESCE([Project_4456949503457366757].[LocalLongName] , [Project_5098028073883527751].[LocalLongName] ) AS [ProjectLocalLongName]
	,COALESCE([Project_4456949503457366757].[LocalShortName] , [Project_5098028073883527751].[LocalShortName] ) AS [ProjectLocalShortName]
	,COALESCE([Project_4456949503457366757].[LongName] , [Project_5098028073883527751].[LongName] ) AS [ProjectLongName]
	,COALESCE([Project_4456949503457366757].[Outcome_ID] , [Outcome_42678601143493245].[Outcome_ID], [Project_5098028073883527751].[Outcome_ID], [Outcome_8652530300005222807].[Outcome_ID] ) AS [ProjectOutcome_ID]
	,COALESCE([Project_4456949503457366757].[Programme_ID] , [Programme_4767818439020600199].[Programme_ID], [Programme_8548454656602143505].[Programme_ID], [Programme_8985200191557887445].[Programme_ID], [Project_5098028073883527751].[Programme_ID], [Programme_9173451270087487659].[Programme_ID], [Programme_1783489461233979001].[Programme_ID], [Programme_7999559335504819587].[Programme_ID] ) AS [ProjectProgramme_ID]
	,COALESCE([Project_4456949503457366757].[ProjectSiteName] , [Project_5098028073883527751].[ProjectSiteName] ) AS [ProjectSiteName]
	,COALESCE([Project_4456949503457366757].[ProjectStartDate] , [Project_5098028073883527751].[ProjectStartDate] ) AS [ProjectStartDate]
	,COALESCE([Project_4456949503457366757].[ProjectStartDate_ID] , [Project_5098028073883527751].[ProjectStartDate_ID] ) AS [ProjectStartDate_ID]
	,COALESCE([Project_4456949503457366757].[ProjectType_ID] , [ProjectType_309590169417902643].[ProjectType_ID], [Project_5098028073883527751].[ProjectType_ID], [ProjectType_5850653284049282881].[ProjectType_ID] ) AS [ProjectType_ID]
	,COALESCE([Project_4456949503457366757].[Sector_ID] , [Sector_4924144588923763731].[Sector_ID], [Sector_6522458742435283257].[Sector_ID], [Project_5098028073883527751].[Sector_ID], [Sector_8977024346432794853].[Sector_ID], [Sector_2902205030677027279].[Sector_ID] ) AS [ProjectSector_ID]
	,COALESCE([Project_4456949503457366757].[ShortName] , [Project_5098028073883527751].[ShortName] ) AS [ProjectShortName]
	,COALESCE([Project_4456949503457366757].[StrategicElement_ID] , [StrategicElement_8460756972496582987].[StrategicElement_ID], [Project_5098028073883527751].[StrategicElement_ID], [StrategicElement_2900584784206566229].[StrategicElement_ID] ) AS [ProjectStrategicElement_ID]
	,COALESCE([Project_4456949503457366757].[SubSector_ID] , [SubSector_452163034357765023].[SubSector_ID], [Project_5098028073883527751].[SubSector_ID], [SubSector_5582173981829459845].[SubSector_ID] ) AS [ProjectSubSector_ID]
	,COALESCE([Project_4456949503457366757].[TextDescription] , [Project_5098028073883527751].[TextDescription] ) AS [ProjectTextDescription]
	,COALESCE([Outcome_42678601143493245].[BusinessKey] , [Outcome_8652530300005222807].[BusinessKey] ) AS [OutcomeBusinessKey]
	,COALESCE([Outcome_42678601143493245].[Code] , [Outcome_8652530300005222807].[Code] ) AS [OutcomeCode]
	,COALESCE([Outcome_42678601143493245].[DataVersion] , [Outcome_8652530300005222807].[DataVersion] ) AS [OutcomeDataVersion]
	,COALESCE([Outcome_42678601143493245].[Impact_ID] , [Impact_3158143912817704125].[Impact_ID], [Outcome_8652530300005222807].[Impact_ID], [Impact_7583061923426583597].[Impact_ID] ) AS [OutcomeImpact_ID]
	,COALESCE([Outcome_42678601143493245].[LocalLongName] , [Outcome_8652530300005222807].[LocalLongName] ) AS [OutcomeLocalLongName]
	,COALESCE([Outcome_42678601143493245].[LocalShortName] , [Outcome_8652530300005222807].[LocalShortName] ) AS [OutcomeLocalShortName]
	,COALESCE([Outcome_42678601143493245].[LongName] , [Outcome_8652530300005222807].[LongName] ) AS [OutcomeLongName]
	,COALESCE([Outcome_42678601143493245].[OutcomeSiteName] , [Outcome_8652530300005222807].[OutcomeSiteName] ) AS [OutcomeSiteName]
	,COALESCE([Outcome_42678601143493245].[ShortName] , [Outcome_8652530300005222807].[ShortName] ) AS [OutcomeShortName]
	,COALESCE([Outcome_42678601143493245].[TextDescription] , [Outcome_8652530300005222807].[TextDescription] ) AS [OutcomeTextDescription]
	,COALESCE([Impact_3158143912817704125].[BusinessKey] , [Impact_7583061923426583597].[BusinessKey] ) AS [ImpactBusinessKey]
	,COALESCE([Impact_3158143912817704125].[Code] , [Impact_7583061923426583597].[Code] ) AS [ImpactCode]
	,COALESCE([Impact_3158143912817704125].[DataVersion] , [Impact_7583061923426583597].[DataVersion] ) AS [ImpactDataVersion]
	,COALESCE([Impact_3158143912817704125].[ImpactSiteName] , [Impact_7583061923426583597].[ImpactSiteName] ) AS [ImpactSiteName]
	,COALESCE([Impact_3158143912817704125].[LocalLongName] , [Impact_7583061923426583597].[LocalLongName] ) AS [ImpactLocalLongName]
	,COALESCE([Impact_3158143912817704125].[LocalShortName] , [Impact_7583061923426583597].[LocalShortName] ) AS [ImpactLocalShortName]
	,COALESCE([Impact_3158143912817704125].[LongName] , [Impact_7583061923426583597].[LongName] ) AS [ImpactLongName]
	,COALESCE([Impact_3158143912817704125].[ShortName] , [Impact_7583061923426583597].[ShortName] ) AS [ImpactShortName]
	,COALESCE([Impact_3158143912817704125].[TextDescription] , [Impact_7583061923426583597].[TextDescription] ) AS [ImpactTextDescription]
	,COALESCE([Programme_4767818439020600199].[BusinessKey] , [Programme_8548454656602143505].[BusinessKey], [Programme_8985200191557887445].[BusinessKey], [Programme_9173451270087487659].[BusinessKey], [Programme_1783489461233979001].[BusinessKey], [Programme_7999559335504819587].[BusinessKey] ) AS [ProgrammeBusinessKey]
	,COALESCE([Programme_4767818439020600199].[Code] , [Programme_8548454656602143505].[Code], [Programme_8985200191557887445].[Code], [Programme_9173451270087487659].[Code], [Programme_1783489461233979001].[Code], [Programme_7999559335504819587].[Code] ) AS [ProgrammeCode]
	,COALESCE([Programme_4767818439020600199].[LocalLongName] , [Programme_8548454656602143505].[LocalLongName], [Programme_8985200191557887445].[LocalLongName], [Programme_9173451270087487659].[LocalLongName], [Programme_1783489461233979001].[LocalLongName], [Programme_7999559335504819587].[LocalLongName] ) AS [ProgrammeLocalLongName]
	,COALESCE([Programme_4767818439020600199].[LocalShortName] , [Programme_8548454656602143505].[LocalShortName], [Programme_8985200191557887445].[LocalShortName], [Programme_9173451270087487659].[LocalShortName], [Programme_1783489461233979001].[LocalShortName], [Programme_7999559335504819587].[LocalShortName] ) AS [ProgrammeLocalShortName]
	,COALESCE([Programme_4767818439020600199].[LongName] , [Programme_8548454656602143505].[LongName], [Programme_8985200191557887445].[LongName], [Programme_9173451270087487659].[LongName], [Programme_1783489461233979001].[LongName], [Programme_7999559335504819587].[LongName] ) AS [ProgrammeLongName]
	,COALESCE([Programme_4767818439020600199].[ProgrammeSiteName] , [Programme_8548454656602143505].[ProgrammeSiteName], [Programme_8985200191557887445].[ProgrammeSiteName], [Programme_9173451270087487659].[ProgrammeSiteName], [Programme_1783489461233979001].[ProgrammeSiteName], [Programme_7999559335504819587].[ProgrammeSiteName] ) AS [ProgrammeSiteName]
	,COALESCE([Programme_4767818439020600199].[ShortName] , [Programme_8548454656602143505].[ShortName], [Programme_8985200191557887445].[ShortName], [Programme_9173451270087487659].[ShortName], [Programme_1783489461233979001].[ShortName], [Programme_7999559335504819587].[ShortName] ) AS [ProgrammeShortName]
	,COALESCE([Programme_4767818439020600199].[TextDescription] , [Programme_8548454656602143505].[TextDescription], [Programme_8985200191557887445].[TextDescription], [Programme_9173451270087487659].[TextDescription], [Programme_1783489461233979001].[TextDescription], [Programme_7999559335504819587].[TextDescription] ) AS [ProgrammeTextDescription]
	,COALESCE([ProjectType_309590169417902643].[BusinessKey] , [ProjectType_5850653284049282881].[BusinessKey] ) AS [ProjectTypeBusinessKey]
	,COALESCE([ProjectType_309590169417902643].[Code] , [ProjectType_5850653284049282881].[Code] ) AS [ProjectTypeCode]
	,COALESCE([ProjectType_309590169417902643].[LocalName] , [ProjectType_5850653284049282881].[LocalName] ) AS [ProjectTypeLocalName]
	,COALESCE([ProjectType_309590169417902643].[Name] , [ProjectType_5850653284049282881].[Name] ) AS [ProjectTypeName]
	,COALESCE([Sector_4924144588923763731].[BusinessKey] , [Sector_6522458742435283257].[BusinessKey], [Sector_8977024346432794853].[BusinessKey], [Sector_2902205030677027279].[BusinessKey] ) AS [SectorBusinessKey]
	,COALESCE([Sector_4924144588923763731].[Code] , [Sector_6522458742435283257].[Code], [Sector_8977024346432794853].[Code], [Sector_2902205030677027279].[Code] ) AS [SectorCode]
	,COALESCE([Sector_4924144588923763731].[LocalLongName] , [Sector_6522458742435283257].[LocalLongName], [Sector_8977024346432794853].[LocalLongName], [Sector_2902205030677027279].[LocalLongName] ) AS [SectorLocalLongName]
	,COALESCE([Sector_4924144588923763731].[LocalShortName] , [Sector_6522458742435283257].[LocalShortName], [Sector_8977024346432794853].[LocalShortName], [Sector_2902205030677027279].[LocalShortName] ) AS [SectorLocalShortName]
	,COALESCE([Sector_4924144588923763731].[LongName] , [Sector_6522458742435283257].[LongName], [Sector_8977024346432794853].[LongName], [Sector_2902205030677027279].[LongName] ) AS [SectorLongName]
	,COALESCE([Sector_4924144588923763731].[Programme_ID] , [Sector_6522458742435283257].[Programme_ID], [Sector_8977024346432794853].[Programme_ID], [Sector_2902205030677027279].[Programme_ID] ) AS [SectorProgramme_ID]
	,COALESCE([Sector_4924144588923763731].[ShortName] , [Sector_6522458742435283257].[ShortName], [Sector_8977024346432794853].[ShortName], [Sector_2902205030677027279].[ShortName] ) AS [SectorShortName]
	,COALESCE([Sector_4924144588923763731].[TextDescription] , [Sector_6522458742435283257].[TextDescription], [Sector_8977024346432794853].[TextDescription], [Sector_2902205030677027279].[TextDescription] ) AS [SectorTextDescription]
	,COALESCE([StrategicElement_8460756972496582987].[BusinessKey] , [StrategicElement_2900584784206566229].[BusinessKey] ) AS [StrategicElementBusinessKey]
	,COALESCE([StrategicElement_8460756972496582987].[Code] , [StrategicElement_2900584784206566229].[Code] ) AS [StrategicElementCode]
	,COALESCE([StrategicElement_8460756972496582987].[LocalName] , [StrategicElement_2900584784206566229].[LocalName] ) AS [StrategicElementLocalName]
	,COALESCE([StrategicElement_8460756972496582987].[Name] , [StrategicElement_2900584784206566229].[Name] ) AS [StrategicElementName]
	,COALESCE([SubSector_452163034357765023].[BusinessKey] , [SubSector_5582173981829459845].[BusinessKey] ) AS [SubSectorBusinessKey]
	,COALESCE([SubSector_452163034357765023].[Code] , [SubSector_5582173981829459845].[Code] ) AS [SubSectorCode]
	,COALESCE([SubSector_452163034357765023].[LocalLongName] , [SubSector_5582173981829459845].[LocalLongName] ) AS [SubSectorLocalLongName]
	,COALESCE([SubSector_452163034357765023].[LocalShortName] , [SubSector_5582173981829459845].[LocalShortName] ) AS [SubSectorLocalShortName]
	,COALESCE([SubSector_452163034357765023].[LongName] , [SubSector_5582173981829459845].[LongName] ) AS [SubSectorLongName]
	,COALESCE([SubSector_452163034357765023].[Sector_ID] , [SubSector_5582173981829459845].[Sector_ID] ) AS [SubSectorSector_ID]
	,COALESCE([SubSector_452163034357765023].[ShortName] , [SubSector_5582173981829459845].[ShortName] ) AS [SubSectorShortName]
	,COALESCE([SubSector_452163034357765023].[TextDescription] , [SubSector_5582173981829459845].[TextDescription] ) AS [SubSectorTextDescription]
	,[MilestoneType_2773568552530191975].[BusinessKey] AS [MilestoneTypeBusinessKey]
	,[MilestoneType_2773568552530191975].[Code] AS [MilestoneTypeCode]
	,[MilestoneType_2773568552530191975].[LocalName] AS [MilestoneTypeLocalName]
	,[MilestoneType_2773568552530191975].[Name] AS [MilestoneTypeName]
FROM [app].[Milestone] AS [Milestone_3537840701332031490]

    LEFT JOIN [app].[Activity] AS [Activity_7125318110836549528] 
    
    JOIN [app].[Project] AS [Project_4456949503457366757] 
    
    LEFT JOIN [app].[Outcome] AS [Outcome_42678601143493245] 
    
    LEFT JOIN [app].[Impact] AS [Impact_3158143912817704125] 
    
    ON  [Outcome_42678601143493245].[Impact_ID] = [Impact_3158143912817704125].[Impact_ID]
        

    ON  [Project_4456949503457366757].[Outcome_ID] = [Outcome_42678601143493245].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_4767818439020600199] 
    
    ON  [Project_4456949503457366757].[Programme_ID] = [Programme_4767818439020600199].[Programme_ID]
        

    LEFT JOIN [app].[ProjectType] AS [ProjectType_309590169417902643] 
    
    ON  [Project_4456949503457366757].[ProjectType_ID] = [ProjectType_309590169417902643].[ProjectType_ID]
        

    LEFT JOIN [app].[Sector] AS [Sector_4924144588923763731] 
    
    LEFT JOIN [app].[Programme] AS [Programme_8548454656602143505] 
    
    ON  [Sector_4924144588923763731].[Programme_ID] = [Programme_8548454656602143505].[Programme_ID]
        

    ON  [Project_4456949503457366757].[Sector_ID] = [Sector_4924144588923763731].[Sector_ID]
        

    LEFT JOIN [disagg].[StrategicElement] AS [StrategicElement_8460756972496582987] 
    
    ON  [Project_4456949503457366757].[StrategicElement_ID] = [StrategicElement_8460756972496582987].[StrategicElement_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_452163034357765023] 
    
    JOIN [app].[Sector] AS [Sector_6522458742435283257] 
    
    LEFT JOIN [app].[Programme] AS [Programme_8985200191557887445] 
    
    ON  [Sector_6522458742435283257].[Programme_ID] = [Programme_8985200191557887445].[Programme_ID]
        

        ON  [SubSector_452163034357765023].[Sector_ID] = [Sector_6522458742435283257].[Sector_ID]

    ON  [Project_4456949503457366757].[SubSector_ID] = [SubSector_452163034357765023].[SubSector_ID]
        

        ON  [Activity_7125318110836549528].[ProjectID] = [Project_4456949503457366757].[ProjectID]

    ON  [Milestone_3537840701332031490].[Activity_ID] = [Activity_7125318110836549528].[Activity_ID]
        

    JOIN [app].[MilestoneType] AS [MilestoneType_2773568552530191975] 
    
        ON  [Milestone_3537840701332031490].[MilestoneTypeID] = [MilestoneType_2773568552530191975].[MilestoneTypeID]

    LEFT JOIN [app].[Project] AS [Project_5098028073883527751] 
    
    LEFT JOIN [app].[Outcome] AS [Outcome_8652530300005222807] 
    
    LEFT JOIN [app].[Impact] AS [Impact_7583061923426583597] 
    
    ON  [Outcome_8652530300005222807].[Impact_ID] = [Impact_7583061923426583597].[Impact_ID]
        

    ON  [Project_5098028073883527751].[Outcome_ID] = [Outcome_8652530300005222807].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_9173451270087487659] 
    
    ON  [Project_5098028073883527751].[Programme_ID] = [Programme_9173451270087487659].[Programme_ID]
        

    LEFT JOIN [app].[ProjectType] AS [ProjectType_5850653284049282881] 
    
    ON  [Project_5098028073883527751].[ProjectType_ID] = [ProjectType_5850653284049282881].[ProjectType_ID]
        

    LEFT JOIN [app].[Sector] AS [Sector_8977024346432794853] 
    
    LEFT JOIN [app].[Programme] AS [Programme_1783489461233979001] 
    
    ON  [Sector_8977024346432794853].[Programme_ID] = [Programme_1783489461233979001].[Programme_ID]
        

    ON  [Project_5098028073883527751].[Sector_ID] = [Sector_8977024346432794853].[Sector_ID]
        

    LEFT JOIN [disagg].[StrategicElement] AS [StrategicElement_2900584784206566229] 
    
    ON  [Project_5098028073883527751].[StrategicElement_ID] = [StrategicElement_2900584784206566229].[StrategicElement_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_5582173981829459845] 
    
    JOIN [app].[Sector] AS [Sector_2902205030677027279] 
    
    LEFT JOIN [app].[Programme] AS [Programme_7999559335504819587] 
    
    ON  [Sector_2902205030677027279].[Programme_ID] = [Programme_7999559335504819587].[Programme_ID]
        

        ON  [SubSector_5582173981829459845].[Sector_ID] = [Sector_2902205030677027279].[Sector_ID]

    ON  [Project_5098028073883527751].[SubSector_ID] = [SubSector_5582173981829459845].[SubSector_ID]
        

    ON  [Milestone_3537840701332031490].[ProjectID] = [Project_5098028073883527751].[ProjectID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'UnitOfMeasure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDateID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDateID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Target', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTarget';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReleaseDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneNotes';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'MilestoneTypeID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'MilestoneID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDateID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDateID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDateID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Baseline', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneActivity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneActivity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Activity_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneActivity_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'isSiteCreated', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'MilestoneType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Milestone', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Activity', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'MilestoneBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ActivityBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'StrategicElement', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SourceKey', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'StrategicElementBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'StrategicElement_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStrategicElement_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Milestone', @level2type = N'COLUMN', @level2name = N'ProjectStrategicElement_ID';

