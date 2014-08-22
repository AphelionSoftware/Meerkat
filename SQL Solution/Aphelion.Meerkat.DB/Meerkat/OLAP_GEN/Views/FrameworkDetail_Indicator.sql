  

CREATE VIEW [OLAP_GEN].[FrameworkDetail_Indicator]
AS

SELECT 
	[FrameworkDetail_Indicator_8529530839417021619].[BusinessKey] AS [FrameworkDetail_IndicatorBusinessKey]
	,[FrameworkDetail_Indicator_8529530839417021619].[FrameworkDetail_ID] AS [FrameworkDetail_IndicatorFrameworkDetail_ID]
	,[FrameworkDetail_Indicator_8529530839417021619].[FrameworkDetail_Indicator_ID] AS [FrameworkDetail_Indicator_ID]
	,[FrameworkDetail_Indicator_8529530839417021619].[IndicatorID] AS [FrameworkDetail_IndicatorIndicatorID]
	,[FrameworkDetail_6053121465182886491].[BusinessKey] AS [FrameworkDetailBusinessKey]
	,[FrameworkDetail_6053121465182886491].[Code] AS [FrameworkDetailCode]
	,[FrameworkDetail_6053121465182886491].[Framework_ID] AS [FrameworkDetailFramework_ID]
	,[FrameworkDetail_6053121465182886491].[LocalName] AS [FrameworkDetailLocalName]
	,[FrameworkDetail_6053121465182886491].[Name] AS [FrameworkDetailName]
	,[Framework_1383394493317493447].[BusinessKey] AS [FrameworkBusinessKey]
	,[Framework_1383394493317493447].[Code] AS [FrameworkCode]
	,[Framework_1383394493317493447].[LocalName] AS [FrameworkLocalName]
	,[Framework_1383394493317493447].[Name] AS [FrameworkName]
	,[Framework_1383394493317493447].[SourceOrganizationID] AS [FrameworkSourceOrganizationID]
	,[Organization_387985339153111047].[BusinessKey] AS [OrganizationBusinessKey]
	,[Organization_387985339153111047].[Code] AS [OrganizationCode]
	,[Organization_387985339153111047].[LocalLongName] AS [OrganizationLocalLongName]
	,[Organization_387985339153111047].[LocalShortName] AS [OrganizationLocalShortName]
	,[Organization_387985339153111047].[LongName] AS [OrganizationLongName]
	,[Organization_387985339153111047].[Organization_ID] AS [Organization_ID]
	,[Organization_387985339153111047].[OrganizationType_ID] AS [OrganizationType_ID]
	,[Organization_387985339153111047].[ParentOrganization_ID] AS [OrganizationParentOrganization_ID]
	,[Organization_387985339153111047].[ShortName] AS [OrganizationShortName]
	,[OrganizationType_4966747784253459327].[BusinessKey] AS [OrganizationTypeBusinessKey]
	,[OrganizationType_4966747784253459327].[Code] AS [OrganizationTypeCode]
	,[OrganizationType_4966747784253459327].[Description] AS [OrganizationTypeDescription]
	,[OrganizationType_4966747784253459327].[LocalName] AS [OrganizationTypeLocalName]
	,[OrganizationType_4966747784253459327].[Name] AS [OrganizationTypeName]
	,[Indicator_4807972650779752062].[Baseline] AS [IndicatorBaseline]
	,[Indicator_4807972650779752062].[BaselineDate] AS [IndicatorBaselineDate]
	,[Indicator_4807972650779752062].[BaselineDate_ID] AS [IndicatorBaselineDate_ID]
	,[Indicator_4807972650779752062].[BaselineString] AS [IndicatorBaselineString]
	,[Indicator_4807972650779752062].[BusinessKey] AS [IndicatorBusinessKey]
	,[Indicator_4807972650779752062].[Code] AS [IndicatorCode]
	,[Indicator_4807972650779752062].[IndicatorSimpleType_ID] AS [IndicatorSimpleType_ID]
	,[Indicator_4807972650779752062].[IndicatorType_ID] AS [IndicatorType_ID]
	,[Indicator_4807972650779752062].[LocalLongName] AS [IndicatorLocalLongName]
	,[Indicator_4807972650779752062].[LocalShortName] AS [IndicatorLocalShortName]
	,[Indicator_4807972650779752062].[LongName] AS [IndicatorLongName]
	,[Indicator_4807972650779752062].[Notes] AS [IndicatorNotes]
	,[Indicator_4807972650779752062].[Outcome_ID] AS [IndicatorOutcome_ID]
	,[Indicator_4807972650779752062].[Output_ID] AS [IndicatorOutput_ID]
	,[Indicator_4807972650779752062].[Programme_ID] AS [IndicatorProgramme_ID]
	,[Indicator_4807972650779752062].[ProjectID] AS [IndicatorProjectID]
	,[Indicator_4807972650779752062].[ReleaseDate] AS [IndicatorReleaseDate]
	,[Indicator_4807972650779752062].[ReportingDate] AS [IndicatorReportingDate]
	,[Indicator_4807972650779752062].[Sector_ID] AS [IndicatorSector_ID]
	,[Indicator_4807972650779752062].[ShortName] AS [IndicatorShortName]
	,[Indicator_4807972650779752062].[SubOutput_ID] AS [IndicatorSubOutput_ID]
	,[Indicator_4807972650779752062].[SubSector_ID] AS [IndicatorSubSector_ID]
	,[Indicator_4807972650779752062].[Target] AS [IndicatorTarget]
	,[Indicator_4807972650779752062].[TargetDate] AS [IndicatorTargetDate]
	,[Indicator_4807972650779752062].[TargetDate_ID] AS [IndicatorTargetDate_ID]
	,[Indicator_4807972650779752062].[TargetString] AS [IndicatorTargetString]
	,[Indicator_4807972650779752062].[TextDescription] AS [IndicatorTextDescription]
	,[Indicator_4807972650779752062].[UnitOfMeasure] AS [IndicatorUnitOfMeasure]
	,[IndicatorSimpleType_5459320042534819872].[BusinessKey] AS [IndicatorSimpleTypeBusinessKey]
	,[IndicatorSimpleType_5459320042534819872].[Code] AS [IndicatorSimpleTypeCode]
	,[IndicatorSimpleType_5459320042534819872].[LocalName] AS [IndicatorSimpleTypeLocalName]
	,[IndicatorSimpleType_5459320042534819872].[Name] AS [IndicatorSimpleTypeName]
	,[IndicatorType_7512795947921487176].[BusinessKey] AS [IndicatorTypeBusinessKey]
	,[IndicatorType_7512795947921487176].[Code] AS [IndicatorTypeCode]
	,[IndicatorType_7512795947921487176].[LocalName] AS [IndicatorTypeLocalName]
	,[IndicatorType_7512795947921487176].[Name] AS [IndicatorTypeName]
	,[Outcome_2201295574120571704].[BusinessKey] AS [OutcomeBusinessKey]
	,[Outcome_2201295574120571704].[Code] AS [OutcomeCode]
	,[Outcome_2201295574120571704].[DataVersion] AS [OutcomeDataVersion]
	,[Outcome_2201295574120571704].[Impact_ID] AS [OutcomeImpact_ID]
	,[Outcome_2201295574120571704].[LocalLongName] AS [OutcomeLocalLongName]
	,[Outcome_2201295574120571704].[LocalShortName] AS [OutcomeLocalShortName]
	,[Outcome_2201295574120571704].[LongName] AS [OutcomeLongName]
	,[Outcome_2201295574120571704].[OutcomeSiteName] AS [OutcomeSiteName]
	,[Outcome_2201295574120571704].[ShortName] AS [OutcomeShortName]
	,[Outcome_2201295574120571704].[TextDescription] AS [OutcomeTextDescription]
	,[Impact_3196485860513688236].[BusinessKey] AS [ImpactBusinessKey]
	,[Impact_3196485860513688236].[Code] AS [ImpactCode]
	,[Impact_3196485860513688236].[DataVersion] AS [ImpactDataVersion]
	,[Impact_3196485860513688236].[ImpactSiteName] AS [ImpactSiteName]
	,[Impact_3196485860513688236].[LocalLongName] AS [ImpactLocalLongName]
	,[Impact_3196485860513688236].[LocalShortName] AS [ImpactLocalShortName]
	,[Impact_3196485860513688236].[LongName] AS [ImpactLongName]
	,[Impact_3196485860513688236].[ShortName] AS [ImpactShortName]
	,[Impact_3196485860513688236].[TextDescription] AS [ImpactTextDescription]
	,[Output_3954271295686627592].[BusinessKey] AS [OutputBusinessKey]
	,[Output_3954271295686627592].[Code] AS [OutputCode]
	,[Output_3954271295686627592].[LocalLongName] AS [OutputLocalLongName]
	,[Output_3954271295686627592].[LocalShortName] AS [OutputLocalShortName]
	,[Output_3954271295686627592].[LongName] AS [OutputLongName]
	,[Output_3954271295686627592].[Outcome_ID] AS [OutputOutcome_ID]
	,[Output_3954271295686627592].[ShortName] AS [OutputShortName]
	,[Output_3954271295686627592].[TextDescription] AS [OutputTextDescription]
	,[Programme_1519356379513247556].[BusinessKey] AS [ProgrammeBusinessKey]
	,[Programme_1519356379513247556].[Code] AS [ProgrammeCode]
	,[Programme_1519356379513247556].[LocalLongName] AS [ProgrammeLocalLongName]
	,[Programme_1519356379513247556].[LocalShortName] AS [ProgrammeLocalShortName]
	,[Programme_1519356379513247556].[LongName] AS [ProgrammeLongName]
	,[Programme_1519356379513247556].[ProgrammeSiteName] AS [ProgrammeSiteName]
	,[Programme_1519356379513247556].[ShortName] AS [ProgrammeShortName]
	,[Programme_1519356379513247556].[TextDescription] AS [ProgrammeTextDescription]
	,[Project_3992474362968448475].[BusinessKey] AS [ProjectBusinessKey]
	,[Project_3992474362968448475].[Code] AS [ProjectCode]
	,[Project_3992474362968448475].[isSiteCreated] AS [ProjectisSiteCreated]
	,[Project_3992474362968448475].[LocalLongName] AS [ProjectLocalLongName]
	,[Project_3992474362968448475].[LocalShortName] AS [ProjectLocalShortName]
	,[Project_3992474362968448475].[LongName] AS [ProjectLongName]
	,[Project_3992474362968448475].[Outcome_ID] AS [ProjectOutcome_ID]
	,[Project_3992474362968448475].[Programme_ID] AS [ProjectProgramme_ID]
	,[Project_3992474362968448475].[ProjectSiteName] AS [ProjectSiteName]
	,[Project_3992474362968448475].[ProjectStartDate] AS [ProjectStartDate]
	,[Project_3992474362968448475].[ProjectStartDate_ID] AS [ProjectStartDate_ID]
	,[Project_3992474362968448475].[ProjectType_ID] AS [ProjectType_ID]
	,[Project_3992474362968448475].[Sector_ID] AS [ProjectSector_ID]
	,[Project_3992474362968448475].[ShortName] AS [ProjectShortName]
	,[Project_3992474362968448475].[SubSector_ID] AS [ProjectSubSector_ID]
	,[Project_3992474362968448475].[TextDescription] AS [ProjectTextDescription]
	,[ProjectType_9017430184934870891].[BusinessKey] AS [ProjectTypeBusinessKey]
	,[ProjectType_9017430184934870891].[Code] AS [ProjectTypeCode]
	,[ProjectType_9017430184934870891].[LocalName] AS [ProjectTypeLocalName]
	,[ProjectType_9017430184934870891].[Name] AS [ProjectTypeName]
	,[Sector_4866105031255092527].[BusinessKey] AS [SectorBusinessKey]
	,[Sector_4866105031255092527].[Code] AS [SectorCode]
	,[Sector_4866105031255092527].[LocalLongName] AS [SectorLocalLongName]
	,[Sector_4866105031255092527].[LocalShortName] AS [SectorLocalShortName]
	,[Sector_4866105031255092527].[LongName] AS [SectorLongName]
	,[Sector_4866105031255092527].[Programme_ID] AS [SectorProgramme_ID]
	,[Sector_4866105031255092527].[ShortName] AS [SectorShortName]
	,[Sector_4866105031255092527].[TextDescription] AS [SectorTextDescription]
	,[SubSector_6982225475667041897].[BusinessKey] AS [SubSectorBusinessKey]
	,[SubSector_6982225475667041897].[Code] AS [SubSectorCode]
	,[SubSector_6982225475667041897].[LocalLongName] AS [SubSectorLocalLongName]
	,[SubSector_6982225475667041897].[LocalShortName] AS [SubSectorLocalShortName]
	,[SubSector_6982225475667041897].[LongName] AS [SubSectorLongName]
	,[SubSector_6982225475667041897].[Sector_ID] AS [SubSectorSector_ID]
	,[SubSector_6982225475667041897].[ShortName] AS [SubSectorShortName]
	,[SubSector_6982225475667041897].[TextDescription] AS [SubSectorTextDescription]
	,[SubOutput_6346007184056836328].[BusinessKey] AS [SubOutputBusinessKey]
	,[SubOutput_6346007184056836328].[Code] AS [SubOutputCode]
	,[SubOutput_6346007184056836328].[LocalLongName] AS [SubOutputLocalLongName]
	,[SubOutput_6346007184056836328].[LocalShortName] AS [SubOutputLocalShortName]
	,[SubOutput_6346007184056836328].[LongName] AS [SubOutputLongName]
	,[SubOutput_6346007184056836328].[Output_ID] AS [SubOutputOutput_ID]
	,[SubOutput_6346007184056836328].[ShortName] AS [SubOutputShortName]
	,[SubOutput_6346007184056836328].[TextDescription] AS [SubOutputTextDescription]
FROM [disagg].[FrameworkDetail_Indicator] AS [FrameworkDetail_Indicator_8529530839417021619]

    LEFT JOIN [disagg].[FrameworkDetail] AS [FrameworkDetail_6053121465182886491] 
    
    JOIN [disagg].[Framework] AS [Framework_1383394493317493447] 
    
    LEFT JOIN [Core].[Organization] AS [Organization_387985339153111047] 
    
    LEFT JOIN [Core].[OrganizationType] AS [OrganizationType_4966747784253459327] 
    
    ON  [Organization_387985339153111047].[OrganizationType_ID] = [OrganizationType_4966747784253459327].[OrganizationType_ID]
        

    ON  [Framework_1383394493317493447].[SourceOrganizationID] = [Organization_387985339153111047].[Organization_ID]
        

        ON  [FrameworkDetail_6053121465182886491].[Framework_ID] = [Framework_1383394493317493447].[Framework_ID]

    ON  [FrameworkDetail_Indicator_8529530839417021619].[FrameworkDetail_ID] = [FrameworkDetail_6053121465182886491].[FrameworkDetail_ID]
        

    LEFT JOIN [app].[Indicator] AS [Indicator_4807972650779752062] 
    
    LEFT JOIN [app].[IndicatorSimpleType] AS [IndicatorSimpleType_5459320042534819872] 
    
    ON  [Indicator_4807972650779752062].[IndicatorSimpleType_ID] = [IndicatorSimpleType_5459320042534819872].[IndicatorSimpleType_ID]
        

    JOIN [app].[IndicatorType] AS [IndicatorType_7512795947921487176] 
    
        ON  [Indicator_4807972650779752062].[IndicatorType_ID] = [IndicatorType_7512795947921487176].[IndicatorType_ID]

    LEFT JOIN [app].[Outcome] AS [Outcome_2201295574120571704] 
    
    LEFT JOIN [app].[Impact] AS [Impact_3196485860513688236] 
    
    ON  [Outcome_2201295574120571704].[Impact_ID] = [Impact_3196485860513688236].[Impact_ID]
        

    ON  [Indicator_4807972650779752062].[Outcome_ID] = [Outcome_2201295574120571704].[Outcome_ID]
        

    LEFT JOIN [app].[Output] AS [Output_3954271295686627592] 
    
    JOIN [app].[Outcome] AS [Outcome_4655221779694552046] 
    
    LEFT JOIN [app].[Impact] AS [Impact_8073458831441045022] 
    
    ON  [Outcome_4655221779694552046].[Impact_ID] = [Impact_8073458831441045022].[Impact_ID]
        

        ON  [Output_3954271295686627592].[Outcome_ID] = [Outcome_4655221779694552046].[Outcome_ID]

    ON  [Indicator_4807972650779752062].[Output_ID] = [Output_3954271295686627592].[Output_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_1519356379513247556] 
    
    ON  [Indicator_4807972650779752062].[Programme_ID] = [Programme_1519356379513247556].[Programme_ID]
        

    LEFT JOIN [app].[Project] AS [Project_3992474362968448475] 
    
    LEFT JOIN [app].[Outcome] AS [Outcome_4282839494947939475] 
    
    LEFT JOIN [app].[Impact] AS [Impact_3263861759059397489] 
    
    ON  [Outcome_4282839494947939475].[Impact_ID] = [Impact_3263861759059397489].[Impact_ID]
        

    ON  [Project_3992474362968448475].[Outcome_ID] = [Outcome_4282839494947939475].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_3436665863344549287] 
    
    ON  [Project_3992474362968448475].[Programme_ID] = [Programme_3436665863344549287].[Programme_ID]
        

    JOIN [app].[ProjectType] AS [ProjectType_9017430184934870891] 
    
        ON  [Project_3992474362968448475].[ProjectType_ID] = [ProjectType_9017430184934870891].[ProjectType_ID]

    LEFT JOIN [app].[Sector] AS [Sector_4866105031255092527] 
    
    JOIN [app].[Programme] AS [Programme_3892804135052786781] 
    
        ON  [Sector_4866105031255092527].[Programme_ID] = [Programme_3892804135052786781].[Programme_ID]

    ON  [Project_3992474362968448475].[Sector_ID] = [Sector_4866105031255092527].[Sector_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_6982225475667041897] 
    
    JOIN [app].[Sector] AS [Sector_4307667167793287051] 
    
    JOIN [app].[Programme] AS [Programme_7328681044643190903] 
    
        ON  [Sector_4307667167793287051].[Programme_ID] = [Programme_7328681044643190903].[Programme_ID]

        ON  [SubSector_6982225475667041897].[Sector_ID] = [Sector_4307667167793287051].[Sector_ID]

    ON  [Project_3992474362968448475].[SubSector_ID] = [SubSector_6982225475667041897].[SubSector_ID]
        

    ON  [Indicator_4807972650779752062].[ProjectID] = [Project_3992474362968448475].[ProjectID]
        

    LEFT JOIN [app].[Sector] AS [Sector_5878915751753497614] 
    
    JOIN [app].[Programme] AS [Programme_7319432362896440556] 
    
        ON  [Sector_5878915751753497614].[Programme_ID] = [Programme_7319432362896440556].[Programme_ID]

    ON  [Indicator_4807972650779752062].[Sector_ID] = [Sector_5878915751753497614].[Sector_ID]
        

    LEFT JOIN [app].[SubOutput] AS [SubOutput_6346007184056836328] 
    
    JOIN [app].[Output] AS [Output_8235402096000587830] 
    
    JOIN [app].[Outcome] AS [Outcome_3073460129892100564] 
    
    LEFT JOIN [app].[Impact] AS [Impact_3447911804035233336] 
    
    ON  [Outcome_3073460129892100564].[Impact_ID] = [Impact_3447911804035233336].[Impact_ID]
        

        ON  [Output_8235402096000587830].[Outcome_ID] = [Outcome_3073460129892100564].[Outcome_ID]

        ON  [SubOutput_6346007184056836328].[Output_ID] = [Output_8235402096000587830].[Output_ID]

    ON  [Indicator_4807972650779752062].[SubOutput_ID] = [SubOutput_6346007184056836328].[SubOutput_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_2494048801371214980] 
    
    JOIN [app].[Sector] AS [Sector_8156959829861223924] 
    
    JOIN [app].[Programme] AS [Programme_6701267369883319790] 
    
        ON  [Sector_8156959829861223924].[Programme_ID] = [Programme_6701267369883319790].[Programme_ID]

        ON  [SubSector_2494048801371214980].[Sector_ID] = [Sector_8156959829861223924].[Sector_ID]

    ON  [Indicator_4807972650779752062].[SubSector_ID] = [SubSector_2494048801371214980].[SubSector_ID]
        

    ON  [FrameworkDetail_Indicator_8529530839417021619].[IndicatorID] = [Indicator_4807972650779752062].[IndicatorID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


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
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'UnitOfMeasure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Target', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubOutput_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReleaseDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Baseline', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Description', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ParentOrganization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationParentOrganization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OrganizationType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Organization_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'Organization_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SourceOrganizationID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkSourceOrganizationID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailFramework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailFramework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Framework_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailFramework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailFramework_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail_Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorIndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorIndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorIndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorIndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail_Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'FrameworkDetail_Indicator_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_Indicator_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail_Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorFrameworkDetail_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorFrameworkDetail_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'FrameworkDetail_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorFrameworkDetail_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorFrameworkDetail_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail_Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetail_IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'SectorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'ProjectType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'isSiteCreated', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'ExcludeFromStaging', @value = N'true', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProjectisSiteCreated';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutputLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'OrganizationType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Organization', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'OrganizationLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorSimpleType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorSimpleType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorSimpleType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorSimpleType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorSimpleType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSimpleType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalLongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLocalLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Framework', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'FrameworkDetail', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'disagg', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LocalName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailLocalName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'FrameworkDetail_Indicator', @level2type = N'COLUMN', @level2name = N'FrameworkDetailLocalName';

