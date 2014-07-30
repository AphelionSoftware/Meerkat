﻿  

CREATE VIEW [OLAP_GEN].[AgeBand]
AS

SELECT 
	[AgeBand_8963329771707518812].[AgeBand_ID] AS [AgeBand_ID]
	,[AgeBand_8963329771707518812].[AgeBandMax_ID] AS [AgeBandMax_ID]
	,[AgeBand_8963329771707518812].[AgeBandMin_ID] AS [AgeBandMin_ID]
	,[AgeBand_8963329771707518812].[BusinessKey] AS [AgeBandBusinessKey]
	,[AgeBand_8963329771707518812].[Code] AS [AgeBandCode]
	,[AgeBand_8963329771707518812].[Name] AS [AgeBandName]
	,[AgeBand_8963329771707518812].[ProjectID] AS [AgeBandProjectID]
	,[AgeBand_8963329771707518812].[TextDescription] AS [AgeBandTextDescription]
	,[Age_5707946202117481449].[Age_ID] AS [Age_ID]
	,[Project_5840974384929097177].[BusinessKey] AS [ProjectBusinessKey]
	,[Project_5840974384929097177].[Code] AS [ProjectCode]
	,[Project_5840974384929097177].[LongName] AS [ProjectLongName]
	,[Project_5840974384929097177].[Outcome_ID] AS [ProjectOutcome_ID]
	,[Project_5840974384929097177].[Programme_ID] AS [ProjectProgramme_ID]
	,[Project_5840974384929097177].[ProjectSiteName] AS [ProjectSiteName]
	,[Project_5840974384929097177].[ProjectStartDate] AS [ProjectStartDate]
	,[Project_5840974384929097177].[ProjectStartDate_ID] AS [ProjectStartDate_ID]
	,[Project_5840974384929097177].[Sector_ID] AS [ProjectSector_ID]
	,[Project_5840974384929097177].[ShortName] AS [ProjectShortName]
	,[Project_5840974384929097177].[SubSector_ID] AS [ProjectSubSector_ID]
	,[Project_5840974384929097177].[TextDescription] AS [ProjectTextDescription]
	,[Outcome_4360195728536410247].[BusinessKey] AS [OutcomeBusinessKey]
	,[Outcome_4360195728536410247].[Code] AS [OutcomeCode]
	,[Outcome_4360195728536410247].[DataVersion] AS [OutcomeDataVersion]
	,[Outcome_4360195728536410247].[Impact_ID] AS [OutcomeImpact_ID]
	,[Outcome_4360195728536410247].[LongName] AS [OutcomeLongName]
	,[Outcome_4360195728536410247].[OutcomeSiteName] AS [OutcomeSiteName]
	,[Outcome_4360195728536410247].[ShortName] AS [OutcomeShortName]
	,[Outcome_4360195728536410247].[TextDescription] AS [OutcomeTextDescription]
	,[DataVersion_4024988674480592555].[BusinessKey] AS [DataVersionBusinessKey]
	,[DataVersion_4024988674480592555].[Code] AS [DataVersionCode]
	,[DataVersion_4024988674480592555].[DataVersion_ID] AS [DataVersion_ID]
	,[DataVersion_4024988674480592555].[Description] AS [DataVersionDescription]
	,[DataVersion_4024988674480592555].[Name] AS [DataVersionName]
	,[DataVersion_4024988674480592555].[Order] AS [DataVersionOrder]
	,[Impact_6999641418207190887].[BusinessKey] AS [ImpactBusinessKey]
	,[Impact_6999641418207190887].[Code] AS [ImpactCode]
	,[Impact_6999641418207190887].[DataVersion] AS [ImpactDataVersion]
	,[Impact_6999641418207190887].[ImpactSiteName] AS [ImpactSiteName]
	,[Impact_6999641418207190887].[LongName] AS [ImpactLongName]
	,[Impact_6999641418207190887].[ShortName] AS [ImpactShortName]
	,[Impact_6999641418207190887].[TextDescription] AS [ImpactTextDescription]
	,[Programme_2393981381947330251].[BusinessKey] AS [ProgrammeBusinessKey]
	,[Programme_2393981381947330251].[Code] AS [ProgrammeCode]
	,[Programme_2393981381947330251].[LongName] AS [ProgrammeLongName]
	,[Programme_2393981381947330251].[ProgrammeSiteName] AS [ProgrammeSiteName]
	,[Programme_2393981381947330251].[ShortName] AS [ProgrammeShortName]
	,[Programme_2393981381947330251].[TextDescription] AS [ProgrammeTextDescription]
	,[Sector_378852112627209137].[BusinessKey] AS [SectorBusinessKey]
	,[Sector_378852112627209137].[Code] AS [SectorCode]
	,[Sector_378852112627209137].[LongName] AS [SectorLongName]
	,[Sector_378852112627209137].[Programme_ID] AS [SectorProgramme_ID]
	,[Sector_378852112627209137].[ShortName] AS [SectorShortName]
	,[Sector_378852112627209137].[TextDescription] AS [SectorTextDescription]
	,[SubSector_7789863727701005971].[BusinessKey] AS [SubSectorBusinessKey]
	,[SubSector_7789863727701005971].[Code] AS [SubSectorCode]
	,[SubSector_7789863727701005971].[LongName] AS [SubSectorLongName]
	,[SubSector_7789863727701005971].[Sector_ID] AS [SubSectorSector_ID]
	,[SubSector_7789863727701005971].[ShortName] AS [SubSectorShortName]
	,[SubSector_7789863727701005971].[TextDescription] AS [SubSectorTextDescription]
FROM [disagg].[AgeBand] AS [AgeBand_8963329771707518812]

    JOIN [disagg].[Age] AS [Age_5707946202117481449] 
    
        ON  [AgeBand_8963329771707518812].[AgeBandMin_ID] = [Age_5707946202117481449].[Age_ID]

    JOIN [disagg].[Age] AS [Age_6537380878624115949] 
    
        ON  [AgeBand_8963329771707518812].[AgeBandMax_ID] = [Age_6537380878624115949].[Age_ID]

    LEFT JOIN [app].[Project] AS [Project_5840974384929097177] 
    
    LEFT JOIN [app].[Outcome] AS [Outcome_4360195728536410247] 
    
    JOIN [Core].[DataVersion] AS [DataVersion_4024988674480592555] 
    
        ON  [Outcome_4360195728536410247].[DataVersion] = [DataVersion_4024988674480592555].[DataVersion_ID]

    LEFT JOIN [app].[Impact] AS [Impact_6999641418207190887] 
    
    JOIN [Core].[DataVersion] AS [DataVersion_34855194145950483] 
    
        ON  [Impact_6999641418207190887].[DataVersion] = [DataVersion_34855194145950483].[DataVersion_ID]

    ON  [Outcome_4360195728536410247].[Impact_ID] = [Impact_6999641418207190887].[Impact_ID]
        

    ON  [Project_5840974384929097177].[Outcome_ID] = [Outcome_4360195728536410247].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_2393981381947330251] 
    
    ON  [Project_5840974384929097177].[Programme_ID] = [Programme_2393981381947330251].[Programme_ID]
        

    LEFT JOIN [app].[Sector] AS [Sector_378852112627209137] 
    
    JOIN [app].[Programme] AS [Programme_6522534240554881277] 
    
        ON  [Sector_378852112627209137].[Programme_ID] = [Programme_6522534240554881277].[Programme_ID]

    ON  [Project_5840974384929097177].[Sector_ID] = [Sector_378852112627209137].[Sector_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_7789863727701005971] 
    
    JOIN [app].[Sector] AS [Sector_6312990709630379115] 
    
    JOIN [app].[Programme] AS [Programme_7129800205031271991] 
    
        ON  [Sector_6312990709630379115].[Programme_ID] = [Programme_7129800205031271991].[Programme_ID]

        ON  [SubSector_7789863727701005971].[Sector_ID] = [Sector_6312990709630379115].[Sector_ID]

    ON  [Project_5840974384929097177].[SubSector_ID] = [SubSector_7789863727701005971].[SubSector_ID]
        

    ON  [AgeBand_8963329771707518812].[ProjectID] = [Project_5840974384929097177].[ProjectID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Order', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionOrder';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersion_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'DataVersionBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Age', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'Age_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'Age_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Age_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'Age_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'Age_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMin_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMin_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBandMin_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMin_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMin_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMax_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMax_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBandMax_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMax_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBandMax_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'AgeBand', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'AgeBand_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'AgeBand', @level2type = N'COLUMN', @level2name = N'AgeBand_ID';
