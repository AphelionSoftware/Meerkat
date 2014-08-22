  

CREATE VIEW [OLAP_GEN].[Project]
AS

SELECT 
	[Project_3176866491823481983].[BusinessKey] AS [ProjectBusinessKey]
	,[Project_3176866491823481983].[Code] AS [ProjectCode]
	,[Project_3176866491823481983].[isSiteCreated] AS [ProjectisSiteCreated]
	,[Project_3176866491823481983].[LocalLongName] AS [ProjectLocalLongName]
	,[Project_3176866491823481983].[LocalShortName] AS [ProjectLocalShortName]
	,[Project_3176866491823481983].[LongName] AS [ProjectLongName]
	,COALESCE([Project_3176866491823481983].[Outcome_ID] , [Outcome_8099135265698605007].[Outcome_ID] ) AS [ProjectOutcome_ID]
	,COALESCE([Project_3176866491823481983].[Programme_ID] , [Programme_3324485730954094131].[Programme_ID], [Programme_3524484843755155765].[Programme_ID], [Programme_3396479260263957233].[Programme_ID] ) AS [ProjectProgramme_ID]
	,[Project_3176866491823481983].[ProjectID] AS [ProjectID]
	,[Project_3176866491823481983].[ProjectSiteName] AS [ProjectSiteName]
	,[Project_3176866491823481983].[ProjectStartDate] AS [ProjectStartDate]
	,[Project_3176866491823481983].[ProjectStartDate_ID] AS [ProjectStartDate_ID]
	,COALESCE([Project_3176866491823481983].[ProjectType_ID] , [ProjectType_7264679332525440705].[ProjectType_ID] ) AS [ProjectType_ID]
	,COALESCE([Project_3176866491823481983].[Sector_ID] , [Sector_4089688493831044313].[Sector_ID], [Sector_9039071425658616205].[Sector_ID] ) AS [ProjectSector_ID]
	,[Project_3176866491823481983].[ShortName] AS [ProjectShortName]
	,COALESCE([Project_3176866491823481983].[SubSector_ID] , [SubSector_6954879088699848453].[SubSector_ID] ) AS [ProjectSubSector_ID]
	,[Project_3176866491823481983].[TextDescription] AS [ProjectTextDescription]
	,[Outcome_8099135265698605007].[BusinessKey] AS [OutcomeBusinessKey]
	,[Outcome_8099135265698605007].[Code] AS [OutcomeCode]
	,[Outcome_8099135265698605007].[DataVersion] AS [OutcomeDataVersion]
	,COALESCE([Outcome_8099135265698605007].[Impact_ID] , [Impact_1005019236971285903].[Impact_ID] ) AS [OutcomeImpact_ID]
	,[Outcome_8099135265698605007].[LocalLongName] AS [OutcomeLocalLongName]
	,[Outcome_8099135265698605007].[LocalShortName] AS [OutcomeLocalShortName]
	,[Outcome_8099135265698605007].[LongName] AS [OutcomeLongName]
	,[Outcome_8099135265698605007].[OutcomeSiteName] AS [OutcomeSiteName]
	,[Outcome_8099135265698605007].[ShortName] AS [OutcomeShortName]
	,[Outcome_8099135265698605007].[TextDescription] AS [OutcomeTextDescription]
	,[Impact_1005019236971285903].[BusinessKey] AS [ImpactBusinessKey]
	,[Impact_1005019236971285903].[Code] AS [ImpactCode]
	,[Impact_1005019236971285903].[DataVersion] AS [ImpactDataVersion]
	,[Impact_1005019236971285903].[ImpactSiteName] AS [ImpactSiteName]
	,[Impact_1005019236971285903].[LocalLongName] AS [ImpactLocalLongName]
	,[Impact_1005019236971285903].[LocalShortName] AS [ImpactLocalShortName]
	,[Impact_1005019236971285903].[LongName] AS [ImpactLongName]
	,[Impact_1005019236971285903].[ShortName] AS [ImpactShortName]
	,[Impact_1005019236971285903].[TextDescription] AS [ImpactTextDescription]
	,COALESCE([Programme_3324485730954094131].[BusinessKey] , [Programme_3524484843755155765].[BusinessKey], [Programme_3396479260263957233].[BusinessKey] ) AS [ProgrammeBusinessKey]
	,COALESCE([Programme_3324485730954094131].[Code] , [Programme_3524484843755155765].[Code], [Programme_3396479260263957233].[Code] ) AS [ProgrammeCode]
	,COALESCE([Programme_3324485730954094131].[LocalLongName] , [Programme_3524484843755155765].[LocalLongName], [Programme_3396479260263957233].[LocalLongName] ) AS [ProgrammeLocalLongName]
	,COALESCE([Programme_3324485730954094131].[LocalShortName] , [Programme_3524484843755155765].[LocalShortName], [Programme_3396479260263957233].[LocalShortName] ) AS [ProgrammeLocalShortName]
	,COALESCE([Programme_3324485730954094131].[LongName] , [Programme_3524484843755155765].[LongName], [Programme_3396479260263957233].[LongName] ) AS [ProgrammeLongName]
	,COALESCE([Programme_3324485730954094131].[ProgrammeSiteName] , [Programme_3524484843755155765].[ProgrammeSiteName], [Programme_3396479260263957233].[ProgrammeSiteName] ) AS [ProgrammeSiteName]
	,COALESCE([Programme_3324485730954094131].[ShortName] , [Programme_3524484843755155765].[ShortName], [Programme_3396479260263957233].[ShortName] ) AS [ProgrammeShortName]
	,COALESCE([Programme_3324485730954094131].[TextDescription] , [Programme_3524484843755155765].[TextDescription], [Programme_3396479260263957233].[TextDescription] ) AS [ProgrammeTextDescription]
	,[ProjectType_7264679332525440705].[BusinessKey] AS [ProjectTypeBusinessKey]
	,[ProjectType_7264679332525440705].[Code] AS [ProjectTypeCode]
	,[ProjectType_7264679332525440705].[LocalName] AS [ProjectTypeLocalName]
	,[ProjectType_7264679332525440705].[Name] AS [ProjectTypeName]
	,COALESCE([Sector_4089688493831044313].[BusinessKey] , [Sector_9039071425658616205].[BusinessKey] ) AS [SectorBusinessKey]
	,COALESCE([Sector_4089688493831044313].[Code] , [Sector_9039071425658616205].[Code] ) AS [SectorCode]
	,COALESCE([Sector_4089688493831044313].[LocalLongName] , [Sector_9039071425658616205].[LocalLongName] ) AS [SectorLocalLongName]
	,COALESCE([Sector_4089688493831044313].[LocalShortName] , [Sector_9039071425658616205].[LocalShortName] ) AS [SectorLocalShortName]
	,COALESCE([Sector_4089688493831044313].[LongName] , [Sector_9039071425658616205].[LongName] ) AS [SectorLongName]
	,COALESCE([Sector_4089688493831044313].[Programme_ID] , [Sector_9039071425658616205].[Programme_ID] ) AS [SectorProgramme_ID]
	,COALESCE([Sector_4089688493831044313].[ShortName] , [Sector_9039071425658616205].[ShortName] ) AS [SectorShortName]
	,COALESCE([Sector_4089688493831044313].[TextDescription] , [Sector_9039071425658616205].[TextDescription] ) AS [SectorTextDescription]
	,[SubSector_6954879088699848453].[BusinessKey] AS [SubSectorBusinessKey]
	,[SubSector_6954879088699848453].[Code] AS [SubSectorCode]
	,[SubSector_6954879088699848453].[LocalLongName] AS [SubSectorLocalLongName]
	,[SubSector_6954879088699848453].[LocalShortName] AS [SubSectorLocalShortName]
	,[SubSector_6954879088699848453].[LongName] AS [SubSectorLongName]
	,[SubSector_6954879088699848453].[Sector_ID] AS [SubSectorSector_ID]
	,[SubSector_6954879088699848453].[ShortName] AS [SubSectorShortName]
	,[SubSector_6954879088699848453].[TextDescription] AS [SubSectorTextDescription]
FROM [app].[Project] AS [Project_3176866491823481983]

    LEFT JOIN [app].[Outcome] AS [Outcome_8099135265698605007] 
    
    LEFT JOIN [app].[Impact] AS [Impact_1005019236971285903] 
    
    ON  [Outcome_8099135265698605007].[Impact_ID] = [Impact_1005019236971285903].[Impact_ID]
        

    ON  [Project_3176866491823481983].[Outcome_ID] = [Outcome_8099135265698605007].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_3324485730954094131] 
    
    ON  [Project_3176866491823481983].[Programme_ID] = [Programme_3324485730954094131].[Programme_ID]
        

    JOIN [app].[ProjectType] AS [ProjectType_7264679332525440705] 
    
        ON  [Project_3176866491823481983].[ProjectType_ID] = [ProjectType_7264679332525440705].[ProjectType_ID]

    LEFT JOIN [app].[Sector] AS [Sector_4089688493831044313] 
    
    JOIN [app].[Programme] AS [Programme_3524484843755155765] 
    
        ON  [Sector_4089688493831044313].[Programme_ID] = [Programme_3524484843755155765].[Programme_ID]

    ON  [Project_3176866491823481983].[Sector_ID] = [Sector_4089688493831044313].[Sector_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_6954879088699848453] 
    
    JOIN [app].[Sector] AS [Sector_9039071425658616205] 
    
    JOIN [app].[Programme] AS [Programme_3396479260263957233] 
    
        ON  [Sector_9039071425658616205].[Programme_ID] = [Programme_3396479260263957233].[Programme_ID]

        ON  [SubSector_6954879088699848453].[Sector_ID] = [Sector_9039071425658616205].[Sector_ID]

    ON  [Project_3176866491823481983].[SubSector_ID] = [SubSector_6954879088699848453].[SubSector_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


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
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'isSiteCreated', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';

