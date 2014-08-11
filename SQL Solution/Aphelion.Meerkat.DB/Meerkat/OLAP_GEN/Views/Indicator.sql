  

CREATE VIEW [OLAP_GEN].[Indicator]
AS

SELECT 
	[Indicator_2226842855875768095].[Baseline] AS [IndicatorBaseline]
	,[Indicator_2226842855875768095].[BaselineDate] AS [IndicatorBaselineDate]
	,[Indicator_2226842855875768095].[BaselineDate_ID] AS [IndicatorBaselineDate_ID]
	,[Indicator_2226842855875768095].[BaselineString] AS [IndicatorBaselineString]
	,[Indicator_2226842855875768095].[BusinessKey] AS [IndicatorBusinessKey]
	,[Indicator_2226842855875768095].[Code] AS [IndicatorCode]
	,[Indicator_2226842855875768095].[IndicatorID] AS [IndicatorID]
	,COALESCE([Indicator_2226842855875768095].[IndicatorType_ID] , [IndicatorType_2945648478303168951].[IndicatorType_ID] ) AS [IndicatorType_ID]
	,[Indicator_2226842855875768095].[LongName] AS [IndicatorLongName]
	,[Indicator_2226842855875768095].[Notes] AS [IndicatorNotes]
	,COALESCE([Indicator_2226842855875768095].[Outcome_ID] , [Outcome_4611182134631146705].[Outcome_ID], [Outcome_2597522749723798991].[Outcome_ID], [Outcome_5843958939648043050].[Outcome_ID], [Outcome_2647260064277178369].[Outcome_ID] ) AS [IndicatorOutcome_ID]
	,COALESCE([Indicator_2226842855875768095].[Output_ID] , [Output_2975148761006868865].[Output_ID], [Output_4513196040826779375].[Output_ID] ) AS [IndicatorOutput_ID]
	,COALESCE([Indicator_2226842855875768095].[Programme_ID] , [Programme_4191190816657367443].[Programme_ID], [Programme_659481155291104198].[Programme_ID], [Programme_7208132126107142702].[Programme_ID], [Programme_8573845131426972840].[Programme_ID], [Programme_4465955619505245867].[Programme_ID], [Programme_6290462976486842799].[Programme_ID] ) AS [IndicatorProgramme_ID]
	,COALESCE([Indicator_2226842855875768095].[ProjectID] , [Project_5711950110801170620].[ProjectID] ) AS [IndicatorProjectID]
	,[Indicator_2226842855875768095].[ReleaseDate] AS [IndicatorReleaseDate]
	,[Indicator_2226842855875768095].[ReportingDate] AS [IndicatorReportingDate]
	,COALESCE([Indicator_2226842855875768095].[Sector_ID] , [Sector_1888821097636976844].[Sector_ID], [Sector_5196085541331348614].[Sector_ID], [Sector_4943839840270869575].[Sector_ID], [Sector_8605483676350007597].[Sector_ID] ) AS [IndicatorSector_ID]
	,[Indicator_2226842855875768095].[ShortName] AS [IndicatorShortName]
	,COALESCE([Indicator_2226842855875768095].[SubOutput_ID] , [SubOutput_3518628502655038641].[SubOutput_ID] ) AS [IndicatorSubOutput_ID]
	,COALESCE([Indicator_2226842855875768095].[SubSector_ID] , [SubSector_152855294318977358].[SubSector_ID], [SubSector_6347481995210809179].[SubSector_ID] ) AS [IndicatorSubSector_ID]
	,[Indicator_2226842855875768095].[Target] AS [IndicatorTarget]
	,[Indicator_2226842855875768095].[TargetDate] AS [IndicatorTargetDate]
	,[Indicator_2226842855875768095].[TargetDate_ID] AS [IndicatorTargetDate_ID]
	,[Indicator_2226842855875768095].[TargetString] AS [IndicatorTargetString]
	,[Indicator_2226842855875768095].[TextDescription] AS [IndicatorTextDescription]
	,[Indicator_2226842855875768095].[UnitOfMeasure] AS [IndicatorUnitOfMeasure]
	,[IndicatorType_2945648478303168951].[BusinessKey] AS [IndicatorTypeBusinessKey]
	,[IndicatorType_2945648478303168951].[Code] AS [IndicatorTypeCode]
	,[IndicatorType_2945648478303168951].[Name] AS [IndicatorTypeName]
	,COALESCE([Outcome_4611182134631146705].[BusinessKey] , [Outcome_2597522749723798991].[BusinessKey], [Outcome_5843958939648043050].[BusinessKey], [Outcome_2647260064277178369].[BusinessKey] ) AS [OutcomeBusinessKey]
	,COALESCE([Outcome_4611182134631146705].[Code] , [Outcome_2597522749723798991].[Code], [Outcome_5843958939648043050].[Code], [Outcome_2647260064277178369].[Code] ) AS [OutcomeCode]
	,COALESCE([Outcome_4611182134631146705].[DataVersion] , [Outcome_2597522749723798991].[DataVersion], [Outcome_5843958939648043050].[DataVersion], [Outcome_2647260064277178369].[DataVersion] ) AS [OutcomeDataVersion]
	,COALESCE([Outcome_4611182134631146705].[Impact_ID] , [Impact_7758913270126784913].[Impact_ID], [Outcome_2597522749723798991].[Impact_ID], [Impact_8336135344260031601].[Impact_ID], [Outcome_5843958939648043050].[Impact_ID], [Impact_2311401960883628314].[Impact_ID], [Outcome_2647260064277178369].[Impact_ID], [Impact_656453281898171359].[Impact_ID] ) AS [OutcomeImpact_ID]
	,COALESCE([Outcome_4611182134631146705].[LongName] , [Outcome_2597522749723798991].[LongName], [Outcome_5843958939648043050].[LongName], [Outcome_2647260064277178369].[LongName] ) AS [OutcomeLongName]
	,COALESCE([Outcome_4611182134631146705].[OutcomeSiteName] , [Outcome_2597522749723798991].[OutcomeSiteName], [Outcome_5843958939648043050].[OutcomeSiteName], [Outcome_2647260064277178369].[OutcomeSiteName] ) AS [OutcomeSiteName]
	,COALESCE([Outcome_4611182134631146705].[ShortName] , [Outcome_2597522749723798991].[ShortName], [Outcome_5843958939648043050].[ShortName], [Outcome_2647260064277178369].[ShortName] ) AS [OutcomeShortName]
	,COALESCE([Outcome_4611182134631146705].[TextDescription] , [Outcome_2597522749723798991].[TextDescription], [Outcome_5843958939648043050].[TextDescription], [Outcome_2647260064277178369].[TextDescription] ) AS [OutcomeTextDescription]
	,COALESCE([Impact_7758913270126784913].[BusinessKey] , [Impact_8336135344260031601].[BusinessKey], [Impact_2311401960883628314].[BusinessKey], [Impact_656453281898171359].[BusinessKey] ) AS [ImpactBusinessKey]
	,COALESCE([Impact_7758913270126784913].[Code] , [Impact_8336135344260031601].[Code], [Impact_2311401960883628314].[Code], [Impact_656453281898171359].[Code] ) AS [ImpactCode]
	,COALESCE([Impact_7758913270126784913].[DataVersion] , [Impact_8336135344260031601].[DataVersion], [Impact_2311401960883628314].[DataVersion], [Impact_656453281898171359].[DataVersion] ) AS [ImpactDataVersion]
	,COALESCE([Impact_7758913270126784913].[ImpactSiteName] , [Impact_8336135344260031601].[ImpactSiteName], [Impact_2311401960883628314].[ImpactSiteName], [Impact_656453281898171359].[ImpactSiteName] ) AS [ImpactSiteName]
	,COALESCE([Impact_7758913270126784913].[LongName] , [Impact_8336135344260031601].[LongName], [Impact_2311401960883628314].[LongName], [Impact_656453281898171359].[LongName] ) AS [ImpactLongName]
	,COALESCE([Impact_7758913270126784913].[ShortName] , [Impact_8336135344260031601].[ShortName], [Impact_2311401960883628314].[ShortName], [Impact_656453281898171359].[ShortName] ) AS [ImpactShortName]
	,COALESCE([Impact_7758913270126784913].[TextDescription] , [Impact_8336135344260031601].[TextDescription], [Impact_2311401960883628314].[TextDescription], [Impact_656453281898171359].[TextDescription] ) AS [ImpactTextDescription]
	,COALESCE([Output_2975148761006868865].[BusinessKey] , [Output_4513196040826779375].[BusinessKey] ) AS [OutputBusinessKey]
	,COALESCE([Output_2975148761006868865].[Code] , [Output_4513196040826779375].[Code] ) AS [OutputCode]
	,COALESCE([Output_2975148761006868865].[LongName] , [Output_4513196040826779375].[LongName] ) AS [OutputLongName]
	,COALESCE([Output_2975148761006868865].[Outcome_ID] , [Output_4513196040826779375].[Outcome_ID] ) AS [OutputOutcome_ID]
	,COALESCE([Output_2975148761006868865].[ShortName] , [Output_4513196040826779375].[ShortName] ) AS [OutputShortName]
	,COALESCE([Output_2975148761006868865].[TextDescription] , [Output_4513196040826779375].[TextDescription] ) AS [OutputTextDescription]
	,COALESCE([Programme_4191190816657367443].[BusinessKey] , [Programme_659481155291104198].[BusinessKey], [Programme_7208132126107142702].[BusinessKey], [Programme_8573845131426972840].[BusinessKey], [Programme_4465955619505245867].[BusinessKey], [Programme_6290462976486842799].[BusinessKey] ) AS [ProgrammeBusinessKey]
	,COALESCE([Programme_4191190816657367443].[Code] , [Programme_659481155291104198].[Code], [Programme_7208132126107142702].[Code], [Programme_8573845131426972840].[Code], [Programme_4465955619505245867].[Code], [Programme_6290462976486842799].[Code] ) AS [ProgrammeCode]
	,COALESCE([Programme_4191190816657367443].[LongName] , [Programme_659481155291104198].[LongName], [Programme_7208132126107142702].[LongName], [Programme_8573845131426972840].[LongName], [Programme_4465955619505245867].[LongName], [Programme_6290462976486842799].[LongName] ) AS [ProgrammeLongName]
	,COALESCE([Programme_4191190816657367443].[ProgrammeSiteName] , [Programme_659481155291104198].[ProgrammeSiteName], [Programme_7208132126107142702].[ProgrammeSiteName], [Programme_8573845131426972840].[ProgrammeSiteName], [Programme_4465955619505245867].[ProgrammeSiteName], [Programme_6290462976486842799].[ProgrammeSiteName] ) AS [ProgrammeSiteName]
	,COALESCE([Programme_4191190816657367443].[ShortName] , [Programme_659481155291104198].[ShortName], [Programme_7208132126107142702].[ShortName], [Programme_8573845131426972840].[ShortName], [Programme_4465955619505245867].[ShortName], [Programme_6290462976486842799].[ShortName] ) AS [ProgrammeShortName]
	,COALESCE([Programme_4191190816657367443].[TextDescription] , [Programme_659481155291104198].[TextDescription], [Programme_7208132126107142702].[TextDescription], [Programme_8573845131426972840].[TextDescription], [Programme_4465955619505245867].[TextDescription], [Programme_6290462976486842799].[TextDescription] ) AS [ProgrammeTextDescription]
	,[Project_5711950110801170620].[BusinessKey] AS [ProjectBusinessKey]
	,[Project_5711950110801170620].[Code] AS [ProjectCode]
	,[Project_5711950110801170620].[LongName] AS [ProjectLongName]
	,[Project_5711950110801170620].[Outcome_ID] AS [ProjectOutcome_ID]
	,[Project_5711950110801170620].[Programme_ID] AS [ProjectProgramme_ID]
	,[Project_5711950110801170620].[ProjectSiteName] AS [ProjectSiteName]
	,[Project_5711950110801170620].[ProjectStartDate] AS [ProjectStartDate]
	,[Project_5711950110801170620].[ProjectStartDate_ID] AS [ProjectStartDate_ID]
	,[Project_5711950110801170620].[Sector_ID] AS [ProjectSector_ID]
	,[Project_5711950110801170620].[ShortName] AS [ProjectShortName]
	,[Project_5711950110801170620].[SubSector_ID] AS [ProjectSubSector_ID]
	,[Project_5711950110801170620].[TextDescription] AS [ProjectTextDescription]
	,COALESCE([Sector_1888821097636976844].[BusinessKey] , [Sector_5196085541331348614].[BusinessKey], [Sector_4943839840270869575].[BusinessKey], [Sector_8605483676350007597].[BusinessKey] ) AS [SectorBusinessKey]
	,COALESCE([Sector_1888821097636976844].[Code] , [Sector_5196085541331348614].[Code], [Sector_4943839840270869575].[Code], [Sector_8605483676350007597].[Code] ) AS [SectorCode]
	,COALESCE([Sector_1888821097636976844].[LongName] , [Sector_5196085541331348614].[LongName], [Sector_4943839840270869575].[LongName], [Sector_8605483676350007597].[LongName] ) AS [SectorLongName]
	,COALESCE([Sector_1888821097636976844].[Programme_ID] , [Sector_5196085541331348614].[Programme_ID], [Sector_4943839840270869575].[Programme_ID], [Sector_8605483676350007597].[Programme_ID] ) AS [SectorProgramme_ID]
	,COALESCE([Sector_1888821097636976844].[ShortName] , [Sector_5196085541331348614].[ShortName], [Sector_4943839840270869575].[ShortName], [Sector_8605483676350007597].[ShortName] ) AS [SectorShortName]
	,COALESCE([Sector_1888821097636976844].[TextDescription] , [Sector_5196085541331348614].[TextDescription], [Sector_4943839840270869575].[TextDescription], [Sector_8605483676350007597].[TextDescription] ) AS [SectorTextDescription]
	,COALESCE([SubSector_152855294318977358].[BusinessKey] , [SubSector_6347481995210809179].[BusinessKey] ) AS [SubSectorBusinessKey]
	,COALESCE([SubSector_152855294318977358].[Code] , [SubSector_6347481995210809179].[Code] ) AS [SubSectorCode]
	,COALESCE([SubSector_152855294318977358].[LongName] , [SubSector_6347481995210809179].[LongName] ) AS [SubSectorLongName]
	,COALESCE([SubSector_152855294318977358].[Sector_ID] , [SubSector_6347481995210809179].[Sector_ID] ) AS [SubSectorSector_ID]
	,COALESCE([SubSector_152855294318977358].[ShortName] , [SubSector_6347481995210809179].[ShortName] ) AS [SubSectorShortName]
	,COALESCE([SubSector_152855294318977358].[TextDescription] , [SubSector_6347481995210809179].[TextDescription] ) AS [SubSectorTextDescription]
	,[SubOutput_3518628502655038641].[BusinessKey] AS [SubOutputBusinessKey]
	,[SubOutput_3518628502655038641].[Code] AS [SubOutputCode]
	,[SubOutput_3518628502655038641].[LongName] AS [SubOutputLongName]
	,[SubOutput_3518628502655038641].[Output_ID] AS [SubOutputOutput_ID]
	,[SubOutput_3518628502655038641].[ShortName] AS [SubOutputShortName]
	,[SubOutput_3518628502655038641].[TextDescription] AS [SubOutputTextDescription]
FROM [app].[Indicator] AS [Indicator_2226842855875768095]

    JOIN [app].[IndicatorType] AS [IndicatorType_2945648478303168951] 
    
        ON  [Indicator_2226842855875768095].[IndicatorType_ID] = [IndicatorType_2945648478303168951].[IndicatorType_ID]

    LEFT JOIN [app].[Outcome] AS [Outcome_4611182134631146705] 
    
    LEFT JOIN [app].[Impact] AS [Impact_7758913270126784913] 
    
    ON  [Outcome_4611182134631146705].[Impact_ID] = [Impact_7758913270126784913].[Impact_ID]
        

    ON  [Indicator_2226842855875768095].[Outcome_ID] = [Outcome_4611182134631146705].[Outcome_ID]
        

    LEFT JOIN [app].[Output] AS [Output_2975148761006868865] 
    
    JOIN [app].[Outcome] AS [Outcome_2597522749723798991] 
    
    LEFT JOIN [app].[Impact] AS [Impact_8336135344260031601] 
    
    ON  [Outcome_2597522749723798991].[Impact_ID] = [Impact_8336135344260031601].[Impact_ID]
        

        ON  [Output_2975148761006868865].[Outcome_ID] = [Outcome_2597522749723798991].[Outcome_ID]

    ON  [Indicator_2226842855875768095].[Output_ID] = [Output_2975148761006868865].[Output_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_4191190816657367443] 
    
    ON  [Indicator_2226842855875768095].[Programme_ID] = [Programme_4191190816657367443].[Programme_ID]
        

    LEFT JOIN [app].[Project] AS [Project_5711950110801170620] 
    
    LEFT JOIN [app].[Outcome] AS [Outcome_5843958939648043050] 
    
    LEFT JOIN [app].[Impact] AS [Impact_2311401960883628314] 
    
    ON  [Outcome_5843958939648043050].[Impact_ID] = [Impact_2311401960883628314].[Impact_ID]
        

    ON  [Project_5711950110801170620].[Outcome_ID] = [Outcome_5843958939648043050].[Outcome_ID]
        

    LEFT JOIN [app].[Programme] AS [Programme_659481155291104198] 
    
    ON  [Project_5711950110801170620].[Programme_ID] = [Programme_659481155291104198].[Programme_ID]
        

    LEFT JOIN [app].[Sector] AS [Sector_1888821097636976844] 
    
    JOIN [app].[Programme] AS [Programme_7208132126107142702] 
    
        ON  [Sector_1888821097636976844].[Programme_ID] = [Programme_7208132126107142702].[Programme_ID]

    ON  [Project_5711950110801170620].[Sector_ID] = [Sector_1888821097636976844].[Sector_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_152855294318977358] 
    
    JOIN [app].[Sector] AS [Sector_5196085541331348614] 
    
    JOIN [app].[Programme] AS [Programme_8573845131426972840] 
    
        ON  [Sector_5196085541331348614].[Programme_ID] = [Programme_8573845131426972840].[Programme_ID]

        ON  [SubSector_152855294318977358].[Sector_ID] = [Sector_5196085541331348614].[Sector_ID]

    ON  [Project_5711950110801170620].[SubSector_ID] = [SubSector_152855294318977358].[SubSector_ID]
        

    ON  [Indicator_2226842855875768095].[ProjectID] = [Project_5711950110801170620].[ProjectID]
        

    LEFT JOIN [app].[Sector] AS [Sector_4943839840270869575] 
    
    JOIN [app].[Programme] AS [Programme_4465955619505245867] 
    
        ON  [Sector_4943839840270869575].[Programme_ID] = [Programme_4465955619505245867].[Programme_ID]

    ON  [Indicator_2226842855875768095].[Sector_ID] = [Sector_4943839840270869575].[Sector_ID]
        

    LEFT JOIN [app].[SubOutput] AS [SubOutput_3518628502655038641] 
    
    JOIN [app].[Output] AS [Output_4513196040826779375] 
    
    JOIN [app].[Outcome] AS [Outcome_2647260064277178369] 
    
    LEFT JOIN [app].[Impact] AS [Impact_656453281898171359] 
    
    ON  [Outcome_2647260064277178369].[Impact_ID] = [Impact_656453281898171359].[Impact_ID]
        

        ON  [Output_4513196040826779375].[Outcome_ID] = [Outcome_2647260064277178369].[Outcome_ID]

        ON  [SubOutput_3518628502655038641].[Output_ID] = [Output_4513196040826779375].[Output_ID]

    ON  [Indicator_2226842855875768095].[SubOutput_ID] = [SubOutput_3518628502655038641].[SubOutput_ID]
        

    LEFT JOIN [app].[SubSector] AS [SubSector_6347481995210809179] 
    
    JOIN [app].[Sector] AS [Sector_8605483676350007597] 
    
    JOIN [app].[Programme] AS [Programme_6290462976486842799] 
    
        ON  [Sector_8605483676350007597].[Programme_ID] = [Programme_6290462976486842799].[Programme_ID]

        ON  [SubSector_6347481995210809179].[Sector_ID] = [Sector_8605483676350007597].[Sector_ID]

    ON  [Indicator_2226842855875768095].[SubSector_ID] = [SubSector_6347481995210809179].[SubSector_ID]
GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubOutput', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubOutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'3', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'SubSector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SubSectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Sector', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'SectorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectStartDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectStartDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Project', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProjectBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProgrammeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Programme', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ProgrammeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Output', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutputBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ImpactSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Impact', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'2', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'ImpactBusinessKey';


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
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'OutcomeSiteName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeSiteName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Impact_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeImpact_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'DataVersion', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeDataVersion';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Outcome', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'OutcomeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Name', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'IndicatorType', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'1', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTypeBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'UnitOfMeasure', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorUnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TextDescription', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTextDescription';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'TargetDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTargetDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Target', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorTarget';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubSector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'SubOutput_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSubOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ShortName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyName', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'4', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorShortName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Sector_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorSector_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReportingDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReportingDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ReleaseDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorReleaseDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'ProjectID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProjectID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Programme_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorProgramme_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Output_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutput_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Outcome_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorOutcome_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Notes', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorNotes';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'LongName', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorLongName';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorType_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorType_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'IndicatorID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Code', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorCode';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BusinessKey', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBusinessKey';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineString', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineString';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDate_ID', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate_ID';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'BaselineDate', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'HierarchyLevel', @value = N'0', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaselineDate';


GO
EXECUTE sp_addextendedproperty @name = N'SrcTable', @value = N'Indicator', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcSchema', @value = N'app', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';


GO
EXECUTE sp_addextendedproperty @name = N'SrcColumn', @value = N'Baseline', @level0type = N'SCHEMA', @level0name = N'OLAP_GEN', @level1type = N'VIEW', @level1name = N'Indicator', @level2type = N'COLUMN', @level2name = N'IndicatorBaseline';

