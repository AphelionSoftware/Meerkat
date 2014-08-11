using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using Microsoft.AnalysisServices;
using PW.XMLA.Reader.XMLAPropertyClasses;

namespace PW.XMLA.Writer
{
    public class TabularXMLAWriter
    {

        public bool isTabularSource = false;
        public bool isNewPowerPivotSchema = true;
        #region constants

        /// <summary>
        /// 0 is DB id
        /// </summary>
        public string constXMLADelete = @"<Delete xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
    <Object>
        <DatabaseID>{0}</DatabaseID>
    </Object>
</Delete>";
        /// <summary>
        /// 0 is DB ID
        /// 1 is Dimension ID
        /// </summary>
        public string XMLAProcessDefrag = @"
<Process xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
  <Type>ProcessDefrag</Type>
  <Object>
    <DatabaseID>{0}</DatabaseID>
    <DimensionID>{1}</DimensionID>
  </Object>
</Process>";

        /// <summary>
        /// 0 is DB ID
        /// </summary>
        public string XMLAProcessFull = @"
<Process xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
  <Type>ProcessFull</Type>
  <Object>
    <DatabaseID>{0}</DatabaseID>
  </Object>
</Process>";

        /// <summary>
        /// 0 is DB ID, 1 is Model, 2 is MG ID, 3 is Partition ID, 4 is data source ID, 5 is query
        /// </summary>
        public string XMLAProcessAdd = @"<Batch xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
    <Process>
        <Object>
            <DatabaseID>{0}</DatabaseID>
            <CubeID>{1}</CubeID>
            <MeasureGroupID>{2}</MeasureGroupID>
            <PartitionID>{3}</PartitionID>
        </Object>
        <Type>ProcessAdd</Type>
        <WriteBackTableCreation>UseExisting</WriteBackTableCreation>
    </Process>
    <Bindings>
        <Binding>
            <DatabaseID>{0}</DatabaseID>
            <CubeID>{1}</CubeID>
            <MeasureGroupID>{2}</MeasureGroupID>
            <PartitionID>{3}</PartitionID>
            <Source xsi:type=""QueryBinding"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" >
                <DataSourceID>{4}</DataSourceID>
                <QueryDefinition>
                    {5}
                </QueryDefinition>
            </Source>
        </Binding>
    </Bindings>
</Batch>
";

        /// <summary>
        /// 0 is Impersonatio Mode
        /// </summary>
        public const string constXMLAImpersonationInfoDefault = @"<ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
            </ImpersonationInfo>";
        /// <summary>
        /// 0 is Impersonation Mode
        /// 1 is Account
        /// </summary>
        public const string constXMLAImpersonationInfoUser = @"            <ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
                <Account>{1}</Account>
            </ImpersonationInfo>";
        #region MeasureGroupConstants

        /// <summary>
        /// Annotation for PowerPivot visibility
        /// </summary>
        public const string constXMLAMeasureGroupPrivate = @"
                            <Annotations>
                                <Annotation>
                                    <Name>IsTablePrivate</Name>
                                </Annotation>
                            </Annotations>";

        /// <summary>
        /// 0 is ID
        /// 1 is Name
        /// 2 is list of dimension attributes
        /// 3 is list of partitions
        /// 4 is (if required) the materialised dimensions
        /// 5 is the Private Annotation for PowerPivot hidden Measure groups
        /// We don't define measures in the measure group, as they're all calculations
        /// </summary>
        public const string constXMLAMeasureGroups = @"
                    <MeasureGroup>
                      <ID>{0}</ID>
                      <Name>{1}</Name>
<Measures>
            <Measure>
              <ID>{0}</ID>
              <Name>_Count {1}</Name>
                {5}
              <AggregateFunction>Count</AggregateFunction>
              <DataType>BigInt</DataType>
              <Source>
                <DataType>BigInt</DataType>
                <DataSize>8</DataSize>
                <Source xsi:type=""RowBinding"">
                  <TableID>{1}</TableID>
                </Source>
              </Source>
              <Visible>false</Visible>
            </Measure>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProcessingMode>Regular</ProcessingMode>
          <Dimensions>
            <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
                          <CubeDimensionID>{0}</CubeDimensionID>
                          <Attributes>
                            <Attribute>
                              <AttributeID>RowNumber</AttributeID>
                              <KeyColumns>
                                <KeyColumn>
                                  <DataType>Integer</DataType>
                                  <Source xsi:type=""ColumnBinding"">
                                    <TableID>{1}</TableID>
                                    <ColumnID>RowNumber</ColumnID>
                                  </Source>
                                </KeyColumn>
                              </KeyColumns>
                              <Type>Granularity</Type>
                            </Attribute>
                           {2}
                          </Attributes>
                          <ddl200_200:ShareDimensionStorage>Shared</ddl200_200:ShareDimensionStorage>
                        </Dimension>
{4}
          </Dimensions>
          <Partitions>
           {3}
          </Partitions>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </MeasureGroup>";
        #endregion 

        #region DimensionConstants
        /// <summary>
        /// 0 is ID
        /// 1 is Name
        /// 2 is list of dimensions
        /// 3 is Single Partition
        /// 4 is materialised dimensions
        /// 5 is the Private Annotation for PowerPivot hidden Measure groups
        /// </summary>
        public const string constXMLAMeasureGroupsForDim = @"
                    <MeasureGroup>
                      <ID>{0}</ID>
                      <Name>{1}</Name>
                        {5}
<Measures>
            <Measure>
              <ID>{0}</ID>
              <Name>_Count {1}</Name>
              <AggregateFunction>Count</AggregateFunction>
              <DataType>BigInt</DataType>
              <Source>
                <DataType>BigInt</DataType>
                <DataSize>8</DataSize>
                <Source xsi:type=""RowBinding"">
                  <TableID>{1}</TableID>
                </Source>
              </Source>
              <Visible>false</Visible>
            </Measure>
          </Measures>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProcessingMode>Regular</ProcessingMode>
          <Dimensions>
            <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
                          <CubeDimensionID>{0}</CubeDimensionID>
                          <Attributes>
                            <Attribute>
                              <AttributeID>RowNumber</AttributeID>
                              <KeyColumns>
                                <KeyColumn>
                                  <DataType>Integer</DataType>
                                  <Source xsi:type=""ColumnBinding"">
                                    <TableID>{1}</TableID>
                                    <ColumnID>RowNumber</ColumnID>
                                  </Source>
                                </KeyColumn>
                              </KeyColumns>
                              <Type>Granularity</Type>
                            </Attribute>
                           {2}
                          </Attributes>
                          <ddl200_200:ShareDimensionStorage>Shared</ddl200_200:ShareDimensionStorage>
                        </Dimension>
{4}
          </Dimensions>
          <Partitions>
           {3}
          </Partitions>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </MeasureGroup>";

        /// <summary>
        /// 0 is CubeID (always Model)
        /// 1 is MeasureGroupID (all tables are degenerate measure group dimensions)
        /// 2 is MeasureGroup (table) name
        /// 3 is the list of dimension attributes
        /// 4 is the list of partitions
        /// </summary>
        public const string constXMLACubeAndMeasureGroupsForDim = @"
				<Cube>
					<ID>{0}</ID>
					<Name>{0}</Name>
					<Annotations>
						<Annotation>
							<Name>DefaultMeasure</Name>
							<Value>__No measures defined</Value>
						</Annotation>
					</Annotations>

                    <Dimensions>
                        <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
                          <CubeDimensionID>{0}</CubeDimensionID>
                            {3}

                        </Dimension>
                    </Dimensions>
				    <MeasureGroups>
    <MeasureGroup xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
          <ID>{1}</ID>
          <Name>{2}</Name>
          <Measures>
            <Measure>
              <ID>{1}</ID>
              <Name>_Count {2}</Name>
              <AggregateFunction>Count</AggregateFunction>
              <DataType>BigInt</DataType>
              <Source>
                <DataType>BigInt</DataType>
                <DataSize>8</DataSize>
                <Source xsi:type=""RowBinding"">
                  <TableID>{1}</TableID>
                </Source>
              </Source>
              <Visible>false</Visible>
            </Measure>
          </Measures>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProcessingMode>Regular</ProcessingMode>
          <Dimensions>
            <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
              <CubeDimensionID>{1}</CubeDimensionID>
              <Attributes>
                {3}
                </Attributes>
            </Dimension>
          </Dimensions>
          <Partitions>
           {4}
          </Partitions>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </MeasureGroup>
    </MeasureGroups>
	<Source>
		<DataSourceViewID>Sandbox</DataSourceViewID>
	</Source>
<StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
</Cube>
";
        /// <summary>
        ///0 is ID
        /// 1 is Name
        /// 2 is attributes list
        /// 3 is visible (<Visible>false</Visible>)
        /// </summary>
        public const string constXMLACubeDimensionList = @"
                    <Dimension>
                      <ID>{0}</ID>
                      <Name>{1}</Name>
                      <DimensionID>{0}</DimensionID>
                      {3}
                      <Attributes>
                       {2}
                      </Attributes>
                    </Dimension>
                 ";
        /// <summary>
        /// 0 is HierachyID
        /// </summary>
        public const string constXMLACubeDimensionHierarchy = @"
                                <Hierarchy>
                                    <HierarchyID>{0}</HierarchyID>
                                </Hierarchy>";
                            

        
        /// <summary>
        /// 0 is ID, 1 is name, 2 is levels
        /// </summary>
        public const string constXMLADimensionHierachy = @"
            <Hierarchy>
							<ID>{0}</ID>
							<Name>{1}</Name>
							<Levels>
                                {2}
                            </Levels>
						</Hierarchy>";

        /// <summary>
        /// 0 is ID, 1 is name, 2 is Source Attribute
        /// </summary>
        public const string constXMLAHierarchyLevel = @"
                                <Level>
									<ID>{0}</ID>
									<Name>{1}</Name>
									<SourceAttributeID>{2}</SourceAttributeID>
								</Level>";
		
				
        /// <summary>
        ///0 is ID
        /// 1 is Name
        /// 2 is IsQueryEditorUsed
        /// 3 is Data Source ID
        /// 4 is Query Definition
        /// 5 is attributes list
        /// 6 is relationships list
        /// 7 is Hierarchies list (INCLUDE <Hierachy></Hierachy>)
        /// </summary>
        public const string constXMLADbDimensionList = @"<Dimension>
					<ID>{0}</ID>
					<Name>{1}</Name>
					<Annotations>
						<Annotation>
							<Name>IsQueryEditorUsed</Name>
							<Value>{2}</Value>
						</Annotation>
						<Annotation>
							<Name>QueryEditorSerialization</Name>
						</Annotation>
						<Annotation>
							<Name>TableWidgetSerialization</Name>
						</Annotation>
					</Annotations>
	                <Source xsi:type=""DataSourceViewBinding"">
		                <DataSourceViewID>Sandbox</DataSourceViewID>
	                </Source>
				   <UnknownMember valuens=""ddl200_200"">AutomaticNull</UnknownMember>
					<ErrorConfiguration>
						<KeyNotFound>IgnoreError</KeyNotFound>
						<KeyDuplicate>ReportAndStop</KeyDuplicate>
						<NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
					</ErrorConfiguration>
					<StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
					<Language>7177</Language>
					<UnknownMemberName>Unknown</UnknownMemberName>
					<Attributes>
                    {5}
                    </Attributes>   
                    {7}
                    <ProactiveCaching>
						<SilenceInterval>-PT1S</SilenceInterval>
						<Latency>-PT1S</Latency>
						<SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
						<ForceRebuildInterval>-PT1S</ForceRebuildInterval>
						<Source xsi:type=""ProactiveCachingInheritedBinding""/>
					</ProactiveCaching>
                    <ddl300_300:Relationships>
                    {6}
                    </ddl300_300:Relationships>
				</Dimension>
			";

        /// <summary>
        /// 0 is Relationship ID
        /// 1 is (From) dimension ID (Fact table)
        /// 2 is (From) attribute ID (Fact table)
        /// 3 is (To)  dimension ID (dimension/lookup)
        /// 4 is (To)  attribute ID (dimension/lookup)
        /// </summary>
        public const string constXMLADbDimensionRelationship = @"
                        <ddl300_300:Relationship>
                            <ID>{0}</ID>
                            <ddl300_300:FromRelationshipEnd>
                                <ddl300_300:Multiplicity>Many</ddl300_300:Multiplicity>
                                <ddl300:VisualizationProperties />
                                <DimensionID>{1}</DimensionID>
                                <Attributes>
                                    <Attribute>
                                        <AttributeID>{2}</AttributeID>
                                    </Attribute>
                                </Attributes>
                            </ddl300_300:FromRelationshipEnd>
                            <ddl300_300:ToRelationshipEnd>
                                <ddl300_300:Multiplicity>One</ddl300_300:Multiplicity>
                                <ddl300:VisualizationProperties />
                                <DimensionID>{3}</DimensionID>
                                <Attributes>
                                    <Attribute>
                                        <AttributeID>{4}</AttributeID>
                                    </Attribute>
                                </Attributes>
                            </ddl300_300:ToRelationshipEnd>
                        </ddl300_300:Relationship>";

        /// <summary>
        /// 0 is ID
        /// 1 is Name
        /// 2 is IsQueryEditorUsed
        /// 3 is Data Source ID
        /// 4 is Query Definition
        /// 
        /// </summary>
        public const string constXMLADimensionPartition = @"        <Partition>
          <ID>{0}</ID>
          <Name>{1}</Name>
          <Annotations>
            <Annotation>
              <Name>IsQueryEditorUsed</Name>
              <Value>{2}</Value>
            </Annotation>
            <Annotation>
              <Name>QueryEditorSerialization</Name>
            </Annotation>
            <Annotation>
              <Name>TableWidgetSerialization</Name>
            </Annotation>
          </Annotations>
          <Source xsi:type=""QueryBinding"">
            <DataSourceID>{3}</DataSourceID>
            <QueryDefinition>{4}</QueryDefinition>
          </Source>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ProcessingMode>Regular</ProcessingMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </Partition>";

        public const string constXMLAAttributeVisibility = @"
                            <AttributeHierarchyVisible>false</AttributeHierarchyVisible>";


        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Attribute Name
        /// 2 is Data Type
        /// 3 is Data Size
        /// 4 is Table ID
        /// 5 is DB Column
        /// 6 is NullProcessing
        /// 7 is Attribute visibility
        /// </summary>
        public const string constXMLADbDimensionAttribute = @"
                        <Attribute>
                            <Annotations>
                                <Annotation>
                                    <Name>Format</Name>
                                    <Value>
                                        <Format Format=""General"" xmlns="""" />
                                    </Value>
                                </Annotation>
                            </Annotations>
                              <ID>{0}</ID>
                              <Name>{1}</Name>
                              <KeyColumns>
                                <KeyColumn>
                                  <DataType>{2}</DataType>
                                  <DataSize>{3}</DataSize>
                                  <NullProcessing>{6}</NullProcessing>
                                  <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                                  <Source xsi:type=""ColumnBinding"">
                                    <TableID>{4}</TableID>
                                    <ColumnID>{5}</ColumnID>
                                  </Source>
                                </KeyColumn>
                              </KeyColumns>
                              <NameColumn>
                                <DataType>WChar</DataType>
                                <DataSize>-1</DataSize>
                                <NullProcessing>ZeroOrBlank</NullProcessing>
                                <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                                <Source xsi:type=""ColumnBinding"">
                                    <TableID>{4}</TableID>
                                    <ColumnID>{5}</ColumnID>
                                </Source>
                              </NameColumn>
                            <OrderBy>Key</OrderBy>
                            {7}
                        </Attribute>";
        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Attribute Name
        /// 2 is Source Table
        /// 3 is Source Column
        /// </summary>
        /// 
        public const string constXMLADbDimensionAttributeRelated = @"
                        <Attribute>
                            <Annotations>
                                <Annotation>
                                    <Name>Format</Name>
                                    <Value>
                                        <Format Format=""Text"" xmlns="""" />
                                    </Value>
                                </Annotation>
                            </Annotations>
                            <ID>{0}</ID>
                            <Name>{1}</Name>
                            <KeyColumns>
                                <KeyColumn>
                                    <DataType>Empty</DataType>
                                    <Source xsi:type=""ddl200_200:ExpressionBinding"">
                                        <Expression>RELATED('{2}'[{3}])</Expression>
                                    </Source>
                                </KeyColumn>
                            </KeyColumns>
                            <NameColumn>
                                <DataType>WChar</DataType>
                                <Source xsi:type=""ddl200_200:ExpressionBinding"">
                                    <Expression>RELATED('{2}'[{3}])</Expression>
                                </Source>
                            </NameColumn>
                            <OrderBy>Key</OrderBy>
                        </Attribute>";


        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Attribute visibility
        /// 2 is Data Type /Invalid
        /// 3 is Data Size/Invalid
        /// 4 is Table ID/Invalid
        /// 5 is DB Column/Invalid
        /// </summary>
        public const string constXMLACubeDimensionAttribute = @"<Attribute>
              <AttributeID>{0}</AttributeID>
              {1}
            </Attribute>";

        ///TODO: Related Cube
        public const string constXMLACubeDimensionAttributeRelated = "";

        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Data Type
        /// 2 is Data Size
        /// 3 is Table ID
        /// 4 is DB Column
        /// </summary>
        public const string constXMLACubeDimensionAttributeForMG = @"<Attribute>
              <AttributeID>{0}</AttributeID>
               <KeyColumns>
												<KeyColumn>
													<DataType>{1}</DataType>
													<DataSize>{2}</DataSize>
													<NullProcessing>Preserve</NullProcessing>
													<InvalidXmlCharacters>Remove</InvalidXmlCharacters>
													<Source xsi:type=""ColumnBinding"">
														<TableID>{3}</TableID>
														<ColumnID>{4}</ColumnID>
													</Source>
												</KeyColumn>
											</KeyColumns> 
            </Attribute>";

        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Source Table
        /// 2 is Source Column
        /// </summary>
        public const string constXMLACubeDimensionAttributeForMGRelated = @"<Attribute>
              <AttributeID>{0}</AttributeID>
               <KeyColumns>
                                                <KeyColumn>
                                                    <DataType>Empty</DataType>
                                                    <Source xsi:type=""ddl200_200:ExpressionBinding"">
                                                        <Expression>RELATED('{1}'[{2}])</Expression>
                                                    </Source>
                                                </KeyColumn>
                                            </KeyColumns>
                                         
            </Attribute>";


        /// <summary>
        /// 0 is Table name
        /// 1 is Measure Name
        /// 2 is aggregation function
        /// 3 is field name
        /// </summary>
        public const string constXMLAMeasure = @"CREATE MEASURE '{0}'[{1}] = {2}('{0}'[{3}]);
";

        /// <summary>
        /// 0 is Table name
        /// 1 is Measure Name
        /// 2 is Expression
        /// </summary>
        public const string constXMLAMeasureCustom = @"CREATE MEASURE '{0}'[{1}] =  {2};
";/// <summary>
        /// 0 is Table name
        /// 1 is Measure Name
        /// 2 is Expression
        /// </summary>
        public const string constXMLAMemberCustom = @"CREATE MEMBER CURRENTCUBE.[{0}].[{1}] AS {2};
";


        public const string constPowerPivotCommand = @"----------------------------------------------------------
-- PowerPivot measures command (do not modify manually) --
----------------------------------------------------------

{0}
";


        /// <summary>
        /// 0 is Table name
        /// 1 is Measure Name
        /// 2 is aggregation function
        /// </summary>
        public const string constXMLAMeasureCount = @"CREATE MEASURE '{0}'[{1}]={2}('{0}');";
        
        /// <summary>
        /// 0 is Table name
        /// 1 is Measure Name
        /// 2 is aggregation function
        /// 3 is field name
        /// </summary>
        public const string constXMLAMeasureCountID = @"CREATE MEASURE '{0}'[{1}]={2}('{0}'[{3}]);";


        #endregion


        #region genericConstants

        /// <summary>
        /// 0 is Table ID
        /// </summary>
        public const string constXMLARowNumberAttribute = @"<Attribute>
              <AttributeID>RowNumber</AttributeID>
            </Attribute>";


        /// <summary>
        /// 0 is the list of attribute relationships - all other fields in table
        /// </summary>
        public const string constXMLADbRowNumberAttribute = @"
                        <Attribute>
                          <ID>RowNumber</ID>
                          <Name>RowNumber</Name>
			                <Type valuens=""ddl200_200"">RowNumber</Type>
			                <Usage>Key</Usage>
                              <KeyColumns>
                                <KeyColumn>                    
                                    <DataType>Integer</DataType>
                                    <DataSize>4</DataSize>
                                    <NullProcessing>Error</NullProcessing>
                                    <Source xsi:type=""ddl200_200:RowNumberBinding""/>
                                </KeyColumn>
                              </KeyColumns>
                            <NameColumn>
                                <DataType>WChar</DataType>
                                <DataSize>4</DataSize>
                                <NullProcessing>ZeroOrBlank</NullProcessing>
                                <Source xsi:type=""ddl200_200:RowNumberBinding"" />
                            </NameColumn>
                            <AttributeRelationships>
                            {0}
                            </AttributeRelationships>
                            <OrderBy>Key</OrderBy>
                            <AttributeHierarchyVisible>false</AttributeHierarchyVisible>
                       </Attribute>";

        /// <summary>
        /// Relationships for the row number. 0 is the attribute name and ID
        /// 1 is the cardinality - defaulted to many
        /// </summary>
        public const string constXMLADbRowNumberAttributeRelationships = @"<AttributeRelationship>
                                    <AttributeID>{0}</AttributeID>
                                    <OverrideBehavior>None</OverrideBehavior>
                                    <Cardinality>{1}</Cardinality>
                                    <Name>{0}</Name>
                                </AttributeRelationship>";

        /// <summary>
        /// 0 is database ID
        /// 1 is database name
        /// 2 is Dimensions list
        /// 3 is cubes list
        /// 4 is data sources
        /// 5 is data source views
        /// </summary>
        public const string constXMLAAlterCube = @"<Alter AllowCreate=""true"" ObjectExpansion=""ExpandFull"" xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
	<Object>
		<DatabaseID>{0}</DatabaseID>
	</Object>
	<ObjectDefinition>
		<Database xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
			<ID>{0}</ID>
			<Name>{1}</Name>
			<Language>7177</Language>
			<DataSourceImpersonationInfo>
				<ImpersonationMode>Default</ImpersonationMode>
			</DataSourceImpersonationInfo>
            <Dimensions>
                {2}
            </Dimensions>
            <Cubes>
            {3}
            </Cubes>
            <DataSources>
            {4}
            </DataSources>
            <DataSourceViews>
            {5}
            </DataSourceViews>
			<ddl200_200:StorageEngineUsed>InMemory</ddl200_200:StorageEngineUsed>
			<ddl200:CompatibilityLevel>1100</ddl200:CompatibilityLevel>
		</Database>
	</ObjectDefinition>
</Alter>";


        /// <summary>
        /// 0 is ID
        /// 1 is name
        /// 2 is connection string
        /// 3 is impersonation info
        /// </summary>
        public const string constXMLADataSources = @"<DataSource xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"" xsi:type=""RelationalDataSource"">
            <ID>{0}</ID>
            <Name>{1}</Name>
            <Annotations>
                <Annotation>
                    <Name>ConnectionEditUISource</Name>
                    <Value>SqlServer</Value>
                </Annotation>
            </Annotations>
            <ConnectionString>{2}</ConnectionString>
            {3}
            <Timeout>PT0S</Timeout>
        </DataSource>";






        /// <summary>
        /// DSV ID is 0
        /// DSV Name is 1
        /// DatasourceID is 2
        /// Schema - all the elements - is 3
        /// </summary>
        public const string constXMLADSV = @"<DataSourceView xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
			<ID>Sandbox</ID>
			<Name>{1}</Name>
			<DataSourceID>{2}</DataSourceID>
            <Schema>
                <xs:schema id=""{0}"" xmlns="""" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:msdata=""urn:schemas-microsoft-com:xml-msdata"" xmlns:msprop=""urn:schemas-microsoft-com:xml-msprop"">
                    <xs:element name=""{0}"" msdata:IsDataSet=""true"" msdata:Locale=""en-US"">
                    <xs:complexType>
                        <xs:choice minOccurs=""0"" maxOccurs=""unbounded"">
                        {3}
                        </xs:choice>
                   </xs:complexType>
                   </xs:element>
            </xs:schema>
            </Schema>
            
		</DataSourceView>";
        /// <summary>
        /// 0 is the measures
        /// 1 is the command text
        /// 2 is the calculation properties
        /// </summary>
        public const string constXMLAMDX = @"<MdxScript>
                            <ID>MdxScript</ID>
                            <Name>MdxScript</Name>
                            <Commands>
                                <Command>
                                    <Text>CALCULATE; 
CREATE MEMBER CURRENTCUBE.Measures.[__No measures defined] AS 1; 
ALTER CUBE CURRENTCUBE UPDATE DIMENSION Measures, Default_Member = [__No measures defined]; 
{0}
</Text>
                                </Command>
                                <Command>
                                    <Text>
{1}
</Text>
                                </Command>
                            </Commands>
                            <CalculationProperties>{2}
                            </CalculationProperties>
                        </MdxScript>
                    ";
        /// <summary>
        /// Used for Multidimensional conversions
        /// 0 is the measures
        /// 1 is the calculation properties
        /// </summary>
        public const string constXMLAMDX_OnlyMembers = @"<MdxScript>
                            <ID>MdxScript</ID>
                            <Name>MdxScript</Name>
                            <Commands>
                                <Command>
                                    <Text>CALCULATE; 
CREATE MEMBER CURRENTCUBE.Measures.[__No measures defined] AS 1; 
ALTER CUBE CURRENTCUBE UPDATE DIMENSION Measures, Default_Member = [__No measures defined]; 
{0}
</Text>
                                </Command>
                            </Commands>
                            <CalculationProperties>{1}
                            </CalculationProperties>
                        </MdxScript>
                    ";
        /// <summary>
        /// 0 is Measure name
        /// 1 is Format (Default to General"
        /// 2 is Format String (default to '')
        /// </summary>
        public const string constXMLACalcProp = @"<CalculationProperty>
                                    <Annotations>
                                        <Annotation>
                                            <Name>Type</Name>
                                            <Value>User</Value>
                                        </Annotation>
                                        <Annotation>
                                            <Name>IsPrivate</Name>
                                            <Value>False</Value>
                                        </Annotation>
                                        <Annotation>
                                            <Name>Format</Name>
                                            <Value>
                                                <Format Format=""{1}"" xmlns="""" />
                                            </Value>
                                        </Annotation>
                                    </Annotations>
                                    <CalculationReference>{0}</CalculationReference>
                                    <CalculationType>Member</CalculationType>
                                    <FormatString>{2}</FormatString>
                                </CalculationProperty>
                                ";

        /// <summary>
        /// 0  is ID
        /// 1 is Name
        /// 2 is list of dimensions
        /// 3 is list of Measure groups
        /// 4 is MdxScripts
        /// </summary>
        public const string constXMLACube = @"<Cube>
                  <ID>{0}</ID>
                  <Name>{1}</Name>
                  <Annotations>
                    <Annotation>
                      <Name>DefaultMeasure</Name>
                      <Value>__No measures defined</Value>
                    </Annotation>
                  </Annotations>
                  <Dimensions>
                    {2}
                   </Dimensions>
                <MeasureGroups>
                    {3}
                </MeasureGroups>

	<Source>
		<DataSourceViewID>Sandbox</DataSourceViewID>
	</Source>
                 <!-- <Source>
                    <DataSourceViewID>Sandbox</DataSourceViewID>
                  </Source>-->
                  <MdxScripts>{4}
                  </MdxScripts>
<StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
</Cube>
";

        #endregion
        #endregion

        public string connDestConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2k8r2;Initial Catalog=TimesheetsCube";
        public string sDBName = "Timesheets";
        public string sCubeName = "Model";
        public string XMLADefinition = "";

        public PW.XMLA.Reader.MultiDimensionalReader srcCubeReader;

        public string XMLACreateDatabase;
        #region Individual XMLA
        #region Create
        public string XMLACreateDB = @"<Create xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
    <ObjectDefinition>
        <Database xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
            <ID>{0}</ID>
            <Name>{1}</Name>
            <Annotations>
                <Annotation>
                    <Name>SandboxVersion</Name>
                    <Value>SQL11_Denali</Value>
                </Annotation>
            </Annotations>
            <Language>7177</Language>
            <DataSourceImpersonationInfo>
                <ImpersonationMode>Default</ImpersonationMode>
            </DataSourceImpersonationInfo>
            <ddl200_200:StorageEngineUsed>InMemory</ddl200_200:StorageEngineUsed>
            <ddl200:CompatibilityLevel>1100</ddl200:CompatibilityLevel>
        </Database>
    </ObjectDefinition>
</Create>";

        public string XMLACreateDataSources = @"<Create xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
    <ParentObject>
        <DatabaseID>{0}</DatabaseID>
    </ParentObject>
    <ObjectDefinition>
        <DataSource xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"" xsi:type=""RelationalDataSource"">
            <ID>{1}</ID>
            <Name>{2}</Name>
            <Annotations>
                <Annotation>
                    <Name>ConnectionEditUISource</Name>
                    <Value>SqlServer</Value>
                </Annotation>
            </Annotations>
            <ConnectionString>{3}</ConnectionString>
            {4}
            <Timeout>PT0S</Timeout>
        </DataSource>
    </ObjectDefinition>
</Create>";
        #endregion

        #region Impersonation
        public string XMLAImpersonationInfoDefault = @"<ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
            </ImpersonationInfo>";

        public string XMLAImpersonationInfoUser = @"            <ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
                <Account>{1}</Account>
            </ImpersonationInfo>";
        #endregion

        #region DSV
        /// <summary>
        /// Database ID is 0
        /// DSV ID is 1
        /// DSV Name is 2 
        /// DatasourceID is 3
        /// Schema - all the elements - is 4
        /// Database ID ???? is 5
        /// </summary>
        public string XMLADSV = @"<Create xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
	<ParentObject>
		<DatabaseID>{0}</DatabaseID>
	</ParentObject>
	<ObjectDefinition>
		<DataSourceView xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
			<ID>{1}</ID>
			<Name>{2}</Name>
			<DataSourceID>{3}</DataSourceID>
            <Schema>
                <xs:schema id=""{1}"" xmlns="""" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:msdata=""urn:schemas-microsoft-com:xml-msdata"" xmlns:msprop=""urn:schemas-microsoft-com:xml-msprop"">
            {4}
            </xs:schema>
            </Schema>
            
		</DataSourceView>
	</ObjectDefinition>
</Create>
";
        #endregion

        #region XMLASchema
        /// <summary>
        /// ID is 0
        /// Name is 1
        /// All the tables go into 2
        /// All the constraints go into 3
        /// </summary>
        public string XMLASchema = @"				<xs:schema id=""{0}"" xmlns="""" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:msdata=""urn:schemas-microsoft-com:xml-msdata"" xmlns:msprop=""urn:schemas-microsoft-com:xml-msprop"">
					<xs:element name=""{1}"" msdata:IsDataSet=""true"" msdata:UseCurrentLocale=""true"">
						<xs:complexType>{2}
                         </xs:complexType>
                        {2}
";
        /// <summary>
        /// Name is 0
        /// DBTableName is 1
        /// Friendly Name is 2
        /// Schema name is 3
        /// Table type is 4
        /// Columns stored in 5
        /// </summary>
        public string XMLATableElementViewTable = @"								<xs:element name=""{0}"" msprop:DbTableName=""{1}"" msprop:FriendlyName=""{2}"" msprop:DbSchemaName=""{3}"" msprop:TableType=""{4}"" msprop:Description=""{2}"" >
									<xs:complexType>
										<xs:sequence>
                                        {5}
                                        </xs:sequence>
                                    </xs:complexType>
                                </xs:element>";
        /// <summary>
        /// Name is 0
        /// DBTableName is 1
        /// Friendly Name is 2
        /// Schema name is 3
        /// Table type is 4
        /// Query definition in 5
        /// Columns stored in 6
        /// </summary>
        public string XMLATableElementQuery = @"								<xs:element name=""{0}"" msprop:DbTableName=""{1}"" msprop:FriendlyName=""{2}"" msprop:DbSchemaName=""{3}"" msprop:TableType=""{4}"" msprop:QueryDefinition=""{5}"">
									<xs:complexType>
										<xs:sequence>
                                        {6}
                                        </xs:sequence>
                                    </xs:complexType>
                                </xs:element>";

        /// <summary>
        /// Name is 0
        /// DB Columnn name is 1
        /// Friendly name is 2
        /// Type is 3
        /// </summary>
        public string XMLAColumnElement = @"<xs:element name=""{0}"" msdata:ReadOnly=""true"" msdata:AutoIncrement=""true"" msprop:DbColumnName=""{1}"" msprop:FriendlyName=""{2}"" type=""{3}"" />";

        /// <summary>
        /// Name is 0
        /// Columnn name is 1
        /// Friendly name is 2
        /// Restriction base is 3 (Almost always xs:string)
        /// MaxLength is 4
        /// </summary>
        public string XMLAColumnElementString = @"<xs:element name=""{0}"" msprop:DbColumnName=""{1}"" msprop:FriendlyName=""{2}"" minOccurs=""0"">
												<xs:simpleType>
													<xs:restriction base=""{3}"">
														<xs:maxLength value=""{4}"" />
													</xs:restriction>
												</xs:simpleType>
		
									</xs:element>";
        #endregion

        #region Table

        /// <summary>
        /// 0 is DatabaseID
        /// 1 is CubeID (always Model)
        /// 2 is MeasureGroupID (all tables are degenerate measure group dimensions)
        /// 3 is MeasureGroup (table) name
        /// 4 is the list of dimension attributes 
        /// 5 is the list of partitions
        /// </summary>
        public string XMLACreateTableFromDimensionString = @"<Alter AllowCreate=""true"" ObjectExpansion=""ExpandFull"" xmlns=""http://schemas.microsoft.com/analysisservices/2003/engine"">
  <Object>
    <DatabaseID>{0}</DatabaseID>

  </Object>
  <ObjectDefinition>
    
<Cubes>
				<Cube>
					<ID>{1}</ID>
					<Name>{1}</Name>
					<Annotations>
						<Annotation>
							<Name>DefaultMeasure</Name>
							<Value>__No measures defined</Value>
						</Annotation>
					</Annotations>

<Dimensions>
            <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
              <ID>{2}</ID>
					<Name>{2}</Name>  
              <Attributes>
                {4}
                </Attributes>
            </Dimension>
          </Dimensions>
					<MeasureGroups>
    <MeasureGroup xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xmlns:ddl2=""http://schemas.microsoft.com/analysisservices/2003/engine/2"" xmlns:ddl2_2=""http://schemas.microsoft.com/analysisservices/2003/engine/2/2"" xmlns:ddl100_100=""http://schemas.microsoft.com/analysisservices/2008/engine/100/100"" xmlns:ddl200=""http://schemas.microsoft.com/analysisservices/2010/engine/200"" xmlns:ddl200_200=""http://schemas.microsoft.com/analysisservices/2010/engine/200/200"" xmlns:ddl300=""http://schemas.microsoft.com/analysisservices/2011/engine/300"" xmlns:ddl300_300=""http://schemas.microsoft.com/analysisservices/2011/engine/300/300"">
          <ID>{2}</ID>
          <Name>{3}</Name>
          <Measures>
            <Measure>
              <ID>{2}</ID>
              <Name>_Count {3}</Name>
              <AggregateFunction>Count</AggregateFunction>
              <DataType>BigInt</DataType>
              <Source>
                <DataType>BigInt</DataType>
                <DataSize>8</DataSize>
                <Source xsi:type=""RowBinding"">
                  <TableID>{2}</TableID>
                </Source>
              </Source>
              <Visible>false</Visible>
            </Measure>
          </Measures>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProcessingMode>Regular</ProcessingMode>
          <Dimensions>
            <Dimension xsi:type=""DegenerateMeasureGroupDimension"">
              <CubeDimensionID>{2}</CubeDimensionID>
              <Attributes>
                {4}
                </Attributes>
            </Dimension>
          </Dimensions>
          <Partitions>
           {5}
          </Partitions>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </MeasureGroup>
    </MeasureGroups>
</Cube>
</Cubes>
			<ddl200_200:StorageEngineUsed>InMemory</ddl200_200:StorageEngineUsed>
			<ddl200:CompatibilityLevel>1100</ddl200:CompatibilityLevel>
</Database>

      </ObjectDefinition>
</Alter>";




        /// <summary>
        /// 0 is Table ID
        /// </summary>
        public string XMLARowNumberAttribute = @"<Attribute>
              <AttributeID>RowNumber</AttributeID>
              <KeyColumns>
                <KeyColumn>
                  <DataType>Integer</DataType>
                  <Source xsi:type=""ColumnBinding"">
                    <TableID>{0}</TableID>
                    <ColumnID>RowNumber</ColumnID>
                  </Source>
                </KeyColumn>
              </KeyColumns>
              <Type>Granularity</Type>
            </Attribute>";

        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Data Type
        /// 2 is Data Size
        /// 3 is Table ID
        /// 4 is DB Column
        /// </summary>
        public string XMLAAttribute = @"<Attribute>
              <AttributeID>{0}</AttributeID>
              <KeyColumns>
                <KeyColumn>
                  <DataType>{1}</DataType>
                  <DataSize>{2}</DataSize>
                  <NullProcessing>Preserve</NullProcessing>
                  <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                  <Source xsi:type=""ColumnBinding"">
                    <TableID>{3}</TableID>
                    <ColumnID>{4}</ColumnID>
                  </Source>
                </KeyColumn>
              </KeyColumns>
            </Attribute>";

        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Data Type
        /// 2 is Data Size
        /// 3 is Table ID
        /// 4 is DB Column
        /// </summary>
        public string XMLAAttributeRelated = @"<Attribute>
              <AttributeID>{0}</AttributeID>
              <KeyColumns>
                                                <KeyColumn>
                                                    <DataType>Empty</DataType>
                                                    <Source xsi:type=""ddl200_200:ExpressionBinding"">
                                                        <Expression>RELATED('{1}'[{2}])</Expression>
                                                    </Source>
                                                </KeyColumn>
                                            </KeyColumns>
            </Attribute>";

        #endregion

        #region Dimension
        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Attribute Name
        /// 2 is Data Type
        /// 3 is Data Size
        /// 4 is Table ID
        /// 5 is DB Column
        /// </summary>
        public string XMLADimensionAttribute = @"<Attribute>
              <ID>{0}</ID>
              <Name>{1}</Name>
              <KeyColumns>
                <KeyColumn>
                  <DataType>{2}</DataType>
                  <DataSize>{3}</DataSize>
                  <NullProcessing>Preserve</NullProcessing>
                  <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                  <Source xsi:type=""ColumnBinding"">
                    <TableID>{4}</TableID>
                    <ColumnID>{5}</ColumnID>
                  </Source>
                </KeyColumn>
              </KeyColumns>
              <NameColumn>
                <DataType>{2}</DataType>
                <DataSize>{3}</DataSize>
                <NullProcessing>ZeroOrBlank</NullProcessing>
                <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                <Source xsi:type=""ColumnBinding"">
                    <TableID>{4}</TableID>
                    <ColumnID>{5}</ColumnID>
                 </Source>
               </NameColumn>
               <OrderBy>Key</OrderBy>
            </Attribute>"; /*Order by needs to be updated*/

        /// <summary>
        /// 0 is ID
        /// 1 is Name
        /// 2 is IsQueryEditorUsed
        /// 3 is Data Source ID
        /// 4 is Query Definition
        /// 
        /// </summary>
        public string XMLADimensionPartition = @"        <Partition>
          <ID>{0}</ID>
          <Name>{1}</Name>
          <Annotations>
            <Annotation>
              <Name>IsQueryEditorUsed</Name>
              <Value>{2}</Value>
            </Annotation>
            <Annotation>
              <Name>QueryEditorSerialization</Name>
            </Annotation>
            <Annotation>
              <Name>TableWidgetSerialization</Name>
            </Annotation>
          </Annotations>
          <Source xsi:type=""QueryBinding"">
            <DataSourceID>{3}</DataSourceID>
            <QueryDefinition>{4}</QueryDefinition>
          </Source>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ProcessingMode>Regular</ProcessingMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </Partition>";




        /// <summary>
        /// 0 is ID
        /// 1 is Name
        /// 2 is IsQueryEditorUsed
        /// 3 is Data Source ID
        /// 4 is Query Definition
        /// 
        /// </summary>
        public string XMLADimension = @"        <Dimension>
          <ID>{0}</ID>
          <Name>{1}</Name>
          <Annotations>
            <Annotation>
              <Name>IsQueryEditorUsed</Name>
              <Value>{2}</Value>
            </Annotation>
            <Annotation>
              <Name>QueryEditorSerialization</Name>
            </Annotation>
            <Annotation>
              <Name>TableWidgetSerialization</Name>
            </Annotation>
          </Annotations>
          <Source xsi:type=""QueryBinding"">
            <DataSourceID>{3}</DataSourceID>
            <QueryDefinition>{4}</QueryDefinition>
          </Source>
          <StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
          <ProcessingMode>Regular</ProcessingMode>
          <ErrorConfiguration>
            <KeyNotFound>IgnoreError</KeyNotFound>
            <KeyDuplicate>ReportAndStop</KeyDuplicate>
            <NullKeyNotAllowed>ReportAndStop</NullKeyNotAllowed>
          </ErrorConfiguration>
          <ProactiveCaching>
            <SilenceInterval>-PT1S</SilenceInterval>
            <Latency>-PT1S</Latency>
            <SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
            <ForceRebuildInterval>-PT1S</ForceRebuildInterval>
            <Source xsi:type=""ProactiveCachingInheritedBinding"" />
          </ProactiveCaching>
        </Dimension>";
        #endregion
        #endregion

        #region XMLA Materialised dimensions
        /// <summary>
        /// 0 is CubeDimensionID, 1 is list of attributes, 2 is Intermediate Cube dimension, 3 is intermediate granularity attribute, 4 is relationship ID, 5 is Materalisation type
        /// </summary>
        public const string XMLAMaterialisedDimension = @"<Dimension xsi:type=""ReferenceMeasureGroupDimension"">
                                    <CubeDimensionID>{0}</CubeDimensionID>
                                    <Attributes>
                                        {1}
                                    </Attributes>
                                    <IntermediateCubeDimensionID>{2}</IntermediateCubeDimensionID>
                                    <IntermediateGranularityAttributeID>{3}</IntermediateGranularityAttributeID>
                                    <Materialization>{5}</Materialization>
                                    <ddl300:RelationshipID>{4}</ddl300:RelationshipID>
                                </Dimension>
";
        /// <summary>
        /// RowNumber is assumed
        /// </summary>
        public const string XMLAMaterialisedRowNumber = @"
                                        <Attribute>
                                            <AttributeID>RowNumber</AttributeID>
                                            <KeyColumns>
                                                <KeyColumn>
                                                    <DataType>Integer</DataType>
                                                    <DataSize>4</DataSize>
                                                    <NullProcessing>Error</NullProcessing>
                                                    <Source xsi:type=""ddl200_200:RowNumberBinding"" />
                                                </KeyColumn>
                                            </KeyColumns>
                                        </Attribute>                                        
";
        /// <summary>
        /// 0 is attribute ID, 1 is data type, 2 is data size, 3 is table ID, 4 is column id
        /// </summary>
        public const string XMLAMaterialisedGranularity = @"
                                        <Attribute>
                                            <AttributeID>{0}</AttributeID>
                                            <KeyColumns>
                                                <KeyColumn>
                                                    <DataType>{1}</DataType>
                                                    <DataSize>{2}</DataSize>
                                                    <NullProcessing>Error</NullProcessing>
                                                    <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                                                    <Source xsi:type=""ColumnBinding"">
                                                        <TableID>{3}</TableID>
                                                        <ColumnID>{4}</ColumnID>
                                                    </Source>
                                                </KeyColumn>
                                            </KeyColumns>
                                            <Type>Granularity</Type>
                                        </Attribute>
";

        /// <summary>
        /// 0 is AttributeID, 1 is data type, 2 is data size, 3 is table ID, 4 is column id
        /// </summary>
        public const string XMLAMaterialisedAttribute = @"
<Attribute>
                                            <AttributeID>{0}</AttributeID>
                                            <KeyColumns>
                                                <KeyColumn>
                                                    <DataType>{1}</DataType>
                                                    <DataSize>{2}</DataSize>
                                                    <NullProcessing>Error</NullProcessing>
                                                    <InvalidXmlCharacters>Remove</InvalidXmlCharacters>
                                                    <Source xsi:type=""ColumnBinding"">
                                                        <TableID>{3}</TableID>
                                                        <ColumnID>{4}</ColumnID>
                                                    </Source>
                                                </KeyColumn>
                                            </KeyColumns>
                                        </Attribute>
                                        ";
        #endregion

        #region XMLAProperties

        public string sXMLAAlterStatement = "";
        public string sXMLADataSource = "";
        public string sXMLADSV = "";
        public string sXMLADbDimensions = "";
        public string sXMLACubeDimensions = "";
        public string sXMLADimensionMeasureGroups = "";
        public string sXMLACubes = "";
        string sXMLAProcess = "";


        #endregion 
    
        #region AMO properties
        Microsoft.AnalysisServices.Server cubeServer = new Server();
        //Microsoft.AnalysisServices.Database cubeDatabase;
        #endregion



        #region PopulateXML

        public void BuildTabularXMLA()
        {
            //FixUp the snowflake dimensions

            
            SnowflakeDimensions.ProcessSnowflakes(ref this.srcCubeReader);
            FactDimensions.ProcessFacts (ref this.srcCubeReader);
            DSVRename.FixDSVTableNames(ref this.srcCubeReader);
            this.BuildDataSourceXMLA();
            this.BuildDSVXMLA();
            this.BuildDbDimensionXMLA();
            this.BuildCubeDimensionXMLA();
            this.BuildMeasureGroupsForDims();
            this.BuildCubeModelXMLA();
            this.BuildAlterForDimensions(); 
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }
            XmlaResultCollection result = cubeServer.Execute(this.sXMLAAlterStatement);
        }

        public void ProcessCubeFull()
        {
            string sProcessCommand = string.Format(this.XMLAProcessFull, this.sDBName);
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }
            XmlaResultCollection result = cubeServer.Execute(sProcessCommand);
       
        }

        public void DeleteCube()
        {
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(string.Format(this.connDestConnection, this.sDBName));
            }
            string sXMLADelete = string.Format(constXMLADelete, this.sDBName);
            XmlaResultCollection result = cubeServer.Execute(sXMLADelete);
        
        }


        public void ProcessAdd(List<string> pTables, string pDate)
        {
            string sQuery = "";
            string sSrcQuery = "";
            
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }
            foreach (string sTable in pTables)
            {
                XMLADimension xDim = this.srcCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(item => item.sName == sTable);
                XMLAMeasureGroup xMG = this.srcCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.Find(item => item.sName == sTable);
                DSV xDSV = this.srcCubeReader.cbOriginalCube.lstDSV.Find( item => item.sID == xMG.sDSVID);
                //XMLADataSource xDS = this.srcCubeReader.cbOriginalCube.lstDataSources.Find(item => item.sID == xDSV.sDataSourceID);

                string sMGID =xMG.sID;
                string sPartitionID =xMG.sID;
                string sDSID = xDSV.sDataSourceID;
            
                sSrcQuery = xDim.sQueryDefinition;
                /// Need to fix this to be more generic.
                DateTime dtStart;
                 if (pDate.Length == 10 && pDate.Contains("/"))
                 {
                    dtStart = System.Convert.ToDateTime(pDate,System.Globalization.DateTimeFormatInfo.CurrentInfo);
                 }
                 else 
                 {
                     if(pDate.Length == 8)
                     {
                         string sDate = pDate.Substring(0, 4) + "/" + pDate.Substring(3, 2) + "/" + pDate.Substring(5, 2);
                        dtStart = System.Convert.ToDateTime(pDate, System.Globalization.DateTimeFormatInfo.CurrentInfo);
                     } else 
                     {
                         throw new System.Exception("Filter value must either in format YYYY/MM/DD or YYYYMMDD");
                     }
                 }
                dtStart =  dtStart.AddDays(1);
                for  (DateTime dtFilter = dtStart ; dtFilter < DateTime.Now.Date; dtFilter = dtFilter.AddDays(1)) {


                    string sIntDate = dtFilter.Year.ToString() + dtFilter.Month.ToString().PadLeft(2, '0') + dtFilter.Day.ToString().PadLeft(2, '0');
                    sQuery = sSrcQuery.Replace( pDate, sIntDate);
                    sQuery = sQuery.Replace(pDate.Replace("/",""), sIntDate);


                    this.sXMLAProcess = string.Format(this.XMLAProcessAdd,this.sDBName,"Model",sMGID,sPartitionID,sDSID, sQuery);
                    XmlaResultCollection result = cubeServer.Execute(this.sXMLAProcess);
                }

                this.sXMLAProcess = string.Format(this.XMLAProcessDefrag,this.sDBName, sMGID);
                XmlaResultCollection resultDefrag = cubeServer.Execute(this.sXMLAProcess);
                
            }
       
        }

        public void ProcessTabular()
        {

            cubeServer.Refresh();
            cubeServer.Databases.FindByName(this.sDBName).Process(ProcessType.ProcessFull);
        }
        public void BuildDataSourceXMLA()
        {

            this.sXMLADataSource = "";
            foreach (XMLADataSource cbsSrc in this.srcCubeReader.cbOriginalCube.lstDataSources)
            {

                if (cbsSrc.sImpersonationMode == "ImpersonateServiceAccount" || cbsSrc.sImpersonationMode == "ImpersonateCurrentUser" || cbsSrc.sImpersonationMode == "Default")
                {
                    this.sXMLADataSource += string.Format(constXMLADataSources
                      
                      , cbsSrc.sID.Replace(" ", "_")
                      , cbsSrc.sName
                      , cbsSrc.sConnectionString
                      , string.Format(constXMLAImpersonationInfoDefault, cbsSrc.sImpersonationMode));
                }
                else
                {
                    this.sXMLADataSource += string.Format(constXMLADataSources

                        , cbsSrc.sID.Replace(" ", "_")
                        , cbsSrc.sName
                        , cbsSrc.sConnectionString
                        , string.Format(constXMLAImpersonationInfoUser, cbsSrc.sImpersonationMode, cbsSrc.sImpersonationAccount));
                }
            }
        }

        public void BuildDSVXMLA()
        {
            this.sXMLADSV = "";
            foreach (DSV dsvDSV in this.srcCubeReader.cbOriginalCube.lstDSV)
            {

                string sTables = "";
                string sConstraints = "";

                foreach (DSVTable dsvT in dsvDSV.lstDSVTables)
                {
                    string sColumns = "";
                    foreach (DSVColumn dsvC in dsvT.lstColumns)
                    {
#region columns
                        if (dsvC.sRestrictionBase != null)
                        {
                            dsvC.sRestrictionBase = dsvC.sRestrictionBase.Replace(" ", "");
                        }
                        if (dsvC.sType != null)
                        {
                            dsvC.sType = dsvC.sType.Replace(" ", "");
                            dsvC.sType = dsvC.sType.Replace("datetime", "dateTime");
                        }
                        if (dsvC.sRestrictionBase == "string" || dsvC.sRestrictionBase == "xs: string" || dsvC.sRestrictionBase == "xs:string")
                        {
                            dsvC.sRestrictionBase = "xs:string";
                            //Apparently tabular uses the name as the DB Name
                            sColumns += string.Format(this.XMLAColumnElementString, FormatColumnID(FactDimensions.FixIDs( dsvC.sDBColumnName)), FormatDBColumnName(dsvC.sDBColumnName), dsvC.sFriendlyName, dsvC.sRestrictionBase, dsvC.sRestrictionMaxLength.Replace("-1", "8000"));
                        }
                        else
                        {
                            switch (dsvC.sType) 
                            {
                                case "xs:int64":
                                    dsvC.sType = "xs:long";
                                    break;
                                case "xs:int16":
                                    dsvC.sType = "xs:int";
                                    break;
                                case "Integer":
                                    dsvC.sType = "xs:int";
                                    break;
                                case "Double":
                                    dsvC.sType = "xs:float";
                                    break;
                                case "xs:single":
                                    dsvC.sType = "xs:float";
                                    break;

                            }
                            /*if (dsvC.sType == "xs:int64")
                            {
                                dsvC.sType = "xs:long";
                            }
                            if (dsvC.sType == "xs:int16" )
                            {
                                dsvC.sType = "xs:int";
                            }
                            if (dsvC.sType == "xs:single")
                            {
                                dsvC.sType = "xs:float";
                            }
                             * */

                            //Apparently tabular uses the name as the DB Name
                            sColumns += string.Format(this.XMLAColumnElement, FormatColumnID (FactDimensions.FixIDs( dsvC.sDBColumnName)), FormatDBColumnName(dsvC.sDBColumnName), dsvC.sID.Replace(" ", "_"), dsvC.sType);
                        }
#endregion 
                    }

                    if (dsvT.sQueryDefiniton == null)
                    {
                        ///TODO: change to table name, not DB Table name
                        sTables += string.Format(XMLATableElementViewTable, dsvT.sName, dsvT.sTableName, dsvT.sFriendlyName, dsvT.sSchemaName, dsvT.sTableType, sColumns);
                    }
                    else
                    {
                        sTables += string.Format(this.XMLATableElementQuery, dsvT.sName, dsvT.sTableName, FormatColumnName(dsvT.sFriendlyName), dsvT.sSchemaName, dsvT.sTableType, FormatQuery(dsvT.sQueryDefiniton), sColumns);
                    }

                }
                /*
                 * Do the Constraints here
                 * */

                string sSchema;
                if (!this.isNewPowerPivotSchema)
                {

                    sSchema = sTables + " " + sConstraints;
                }
                else
                {
                    sSchema = sTables + " " + sConstraints;
                }
                /* Check this assumption that cube ID is Model*/
                this.sXMLADSV += string.Format(constXMLADSV, dsvDSV.sID.Replace(" ", "_"), dsvDSV.sName, dsvDSV.sDataSourceID.Replace(" ", "_"), sSchema);
            }

        }

        public void BuildDbDimensionXMLA()
        {
            this.sXMLADbDimensions = "";
            string sXMLADimensionAttributesLst = "";
           //For now, just do the first model
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimension dimCD in cmActiveModel.lstDimensions)
            {
                string sAttributeRelationshipsLst = "";
                sXMLADimensionAttributesLst = "";
                //sXMLADimensionAttributesLst = string.Format(constXMLADbRowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    if (daColumns.sName == "RowNumber") 
                    {
                        continue;
                    }
                    if (daColumns.sName.ToUpper() == "ID")
                    {
                        daColumns.sName = dimCD.sName + daColumns.sName;
                    }

                    if (daColumns.sName.ToUpper() == "NAME")
                    {
                        daColumns.sName = dimCD.sName + daColumns.sName;
                    }

                    if (daColumns.sID.ToUpper() == "ID")
                    {
                        daColumns.sID = dimCD.sID + daColumns.sID;
                    }

                    if (daColumns.sID.ToUpper() == "NAME")
                    {
                        daColumns.sID = dimCD.sID + daColumns.sID;
                    }
                    //Building the list of relationships

                    if (dimCD.sID.Contains("ActivityDetails"))
                    {
                    }

                    ///TODO: Check this. Using sID instead of sName for rownumber relationship
                    //sAttributeRelationshipsLst += string.Format(constXMLADbRowNumberAttributeRelationships, FormatColumnName(daColumns.sName) , daColumns.sCardinality);
                    sAttributeRelationshipsLst += string.Format(constXMLADbRowNumberAttributeRelationships, FormatColumnName(daColumns.sID), daColumns.sCardinality);

                    //sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute,daColumns.sID,  daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                    //Need to use the resultant table ID, NOT the table name 
                   
                        
                    if (daColumns.boolVisible)
                    {
                        if (daColumns.boolRelated)
                        {

                            sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttributeRelated, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDimensionID, daColumns.sDBColumnName);
                        }
                        else
                        {
                            //sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDataType, daColumns.sDataSize, daColumns.sDimensionID, FormatColumnID(daColumns.sID.Replace(" ", ""))/*_x0020_*/, daColumns.sNullProcessing, "");
                            
                            sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDataType, daColumns.sDataSize, daColumns.sDimensionID, FormatColumnID(daColumns.sDBColumnName.Replace(" ", ""))/*_x0020_*/, daColumns.sNullProcessing, "");
                        }
                    }
                    else
                    {
                        ///TODO: Handle non visible related columnsif (daColumns.boolRelated)
                       
                        if (daColumns.boolRelated)
                        {
                            sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttributeRelated, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDimensionID, daColumns.sDBColumnName);
                        }
                        else
                        {
                            //sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDataType, daColumns.sDataSize, daColumns.sDimensionID, FormatColumnID(daColumns.sID.Replace(" ", ""))/*_x0020_*/, daColumns.sNullProcessing, constXMLAAttributeVisibility);
                            sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute, FormatColumnName(daColumns.sID)/*_x0020_*/, FormatColumnName(daColumns.sName), daColumns.sDataType, daColumns.sDataSize, daColumns.sDimensionID, FormatColumnID(daColumns.sDBColumnName.Replace(" ", ""))/*_x0020_*/, daColumns.sNullProcessing, constXMLAAttributeVisibility);
                        }
                    }
                    if (daColumns.sDimensionID == "")
                    {
                        throw new Exception() ;
                    }
                }

                if (dimCD.sID.Contains("ActivityDetails"))
                {
                }

                sXMLADimensionAttributesLst = string.Format(constXMLADbRowNumberAttribute, sAttributeRelationshipsLst)  + sXMLADimensionAttributesLst;
                //sXMLADbDimensions += string.Format(constXMLADbDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition, sXMLADimensionAttributesLst, dimCD.sDSVID);

                //Creating relationships XMLA
                string sXMLARelationships = "";
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLARelationship rel in dimCD.lstRelationships)
                {
                    //Needed when subsets of tables are included
                    if (cmActiveModel.lstDimensions.Exists(item => item.sID == rel.toTable))
                    {
                        sXMLARelationships += string.Format(constXMLADbDimensionRelationship, rel.sID, rel.fromTable, rel.fromColumn, rel.toTable, rel.toColumn);
                    }
                    else
                    {
                        var x = rel;
                    }
                }


                //HERE constXMLADbDimensionList

                string lstHierarchies = "";
                foreach (XMLADimensionHierarchy xHier in dimCD.lstHierarchies)
                {
                    string lstLevels = "";
                    foreach (XMLADimensionHierarchyLevel xLevel in xHier.lstLevels)
                    {
                        lstLevels += string.Format(constXMLAHierarchyLevel, xLevel.sID, xLevel.sName, xLevel.sSourceAttributeID);
                    }
                    lstHierarchies += string.Format(constXMLADimensionHierachy, xHier.sID, xHier.sName, lstLevels);
                }

                lstHierarchies = @"
                    <Hierarchies>
                    " + lstHierarchies + @"                
                    </Hierarchies>";
					
                sXMLADbDimensions += string.Format(constXMLADbDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition, sXMLADimensionAttributesLst, sXMLARelationships, lstHierarchies);
            }
        }
        /// <summary>
        /// Formats a columns ID
        /// </summary>
        /// <param name="daColumns"></param>
        /// <returns></returns>
        private static string FormatColumnID(string sID)
        {
            //return "_x005B_" + sID.Replace(" ", "").Replace("|", "_x007C_") + "_x005D_";
            return sID.Replace(" ", "").Replace("|", "_x007C_") ;
        }

        /// <summary>
        /// Formats a columns name
        /// </summary>
        /// <param name="daColumns"></param>
        /// <returns></returns>
        private static string FormatColumnName(string sName)
        {
            return sName.Replace(" ", "").Replace("|", "");
        }


        /// <summary>
        /// Formats a DB columns name
        /// </summary>
        /// <param name="daColumns"></param>
        /// <returns></returns>
        private static string FormatDBColumnName(string sName)
        {
            return sName;
        }
        /// <summary>
        /// Formats a Query
        /// </summary>
        /// <param name="daColumns"></param>
        /// <returns></returns>
        private static string FormatQuery(string sQuery)
        {
            return sQuery.Replace(@"""", "&quot;");
        }

        public void BuildCubeDimensionXMLA()
        {
            this.sXMLACubeDimensions = "";
            string sXMLADimensionAttributesLst = "";
            //For now, just do the first model
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimension dimCD in cmActiveModel.lstDimensions)
            {
                sXMLADimensionAttributesLst = string.Format(constXMLARowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {

                    if (daColumns.sName.ToUpper() == "ID")
                    {
                        daColumns.sName = dimCD.sName + daColumns.sName;
                    }

                    if (daColumns.sName.ToUpper() == "NAME")
                    {
                        daColumns.sName = dimCD.sName + daColumns.sName;
                    }

                    if (daColumns.boolVisible)
                    {
                        sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, FormatColumnName(daColumns.sID.Replace(" ", "")), ""/*_x0020*/);//, daColumns.sDataType, daColumns.sDataSize, daColumns.sDimensionID, daColumns.sDBColumnName);
                    }
                    else
                    {
                        sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, FormatColumnName(daColumns.sID.Replace(" ", "")), constXMLAAttributeVisibility);
                    }
                    if (daColumns.sDimensionID == "")
                    {
                        throw new Exception();
                    }
                }
                ///TODO: Check this
                
                string lstHierarchyIDs = "";
                foreach (XMLADimensionHierarchy xHier in dimCD.lstHierarchies)
                {
                    lstHierarchyIDs += string.Format(constXMLACubeDimensionHierarchy, xHier.sID);
                }
                	
                
                //this.sXMLACubeDimensions += string.Format(constXMLACubeDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, lstHierarchyIDs);

                if (dimCD.boolVisible)
                {
                    this.sXMLACubeDimensions += string.Format(constXMLACubeDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst,"");
                }
                else
                {
                    this.sXMLACubeDimensions += string.Format(constXMLACubeDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, "<Visible>false</Visible>");
                }
            
            }
        }

        public void BuildMeasureGroupsForDims()
        {
            //constXMLAMeasureGroupsForDim
            //this.sXMLADimensionMeasureGroups = "";
            //Need to reset object on restart
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            string sXMLADimensionAttributesLst  = "";
            foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimension dimCD in cmActiveModel.lstDimensions)
            {

                
                //Set up attributes
                //AttributeID // constXMLADbDimensionAttribute
                //sXMLADimensionAttributesLst = string.Format(constXMLARowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                //Handled in measure group code

                sXMLADimensionAttributesLst = "";
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    //sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                    //sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute,FormatColumnName( daColumns.sID.Replace(" ", ""))/*_x0020_*/, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                    if (daColumns.boolRelated)
                    {
                        sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttributeForMGRelated, FormatColumnName(daColumns.sID.Replace(" ", "")), daColumns.sDimensionID, daColumns.sDBColumnName);
                    }
                    else
                    {
                        sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttributeForMG, FormatColumnName(daColumns.sID.Replace(" ", ""))/*_x0020_*/, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, FormatColumnID(daColumns.sDBColumnName));
                    }
                }
                string sPartitions = string.Format(constXMLADimensionPartition, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition);

                ///Adding reference dims for materialised dimensions
                ///

                string sRefDim = "";
                //foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLARelationship xRel in dimCD.lstRelationships)
                foreach(XMLAReferenceDimension sRelDim in dimCD.lstReferenceDimensions)
                {

                    if (dimCD.lstRelationships.Exists(item => item.toTable == sRefDim))
                    {
                        PW.XMLA.Reader.XMLAPropertyClasses.XMLARelationship xRel = dimCD.lstRelationships.Find(item => item.toTable == sRefDim);

                        //if (xRel.bMaterialised && dimCD.sID == "EventDetails" )
                        if (xRel.bReference)
                        {
                            string sMaterialisation = "Indirect";
                            if (xRel.bMaterialised) sMaterialisation = "Regular";
                            sRefDim += CreateReferenceDim(cmActiveModel, sMaterialisation, xRel.toTable,xRel.toColumn, xRel.sIntermediateDimensionID,xRel.sIntermediateGranularityID,xRel.sID);
                        }
                    }
                    else
                    {
                        //Reference dimension, but no relationship exists
                        sRefDim += CreateReferenceDim(cmActiveModel, sRelDim.sMaterialisation, sRelDim.sTable, sRelDim.sColumn, sRelDim.sIntermediateDimensionID, sRelDim.sIntermediateGranularityID, sRelDim.sID);
                    }
                }
#region relOnly
                /*foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLARelationship xRel in dimCD.lstRelationships)
                {
                    //if (xRel.bMaterialised && dimCD.sID == "EventDetails" )
                    if (xRel.bReference)
                    
                    {
                        string sMaterialisation = "Indirect";
                        if (xRel.bMaterialised) sMaterialisation = "Regular";
                        string sAttributeList = "";
                        sAttributeList += XMLAMaterialisedRowNumber;


                        XMLADimension xDim = cmActiveModel.lstDimensions.Find(item => item.sID == xRel.toTable);

                        //Key attributes
                        string sAttributeID = xRel.toColumn ;
                        string sDataType = xDim.lstDimensionAttributes.Find(item => item.sID == xRel.toColumn || item.sID == xRel.toColumn + "|").sDataType;
                        string sDataSize = xDim.lstDimensionAttributes.Find(item => item.sID == xRel.toColumn || item.sID == xRel.toColumn + "|").sDataSize;                        

                        sAttributeList += string.Format(XMLAMaterialisedGranularity, sAttributeID, sDataType, sDataSize, xRel.toTable, xRel.toColumn);

                        //Rest of attributes
                        foreach (XMLADimensionAttribute xDArel in xDim.lstDimensionAttributes)
                        {
                            if (xDArel.sID != sAttributeID && xDArel.sID != sAttributeID + "|") 
                            {
                                DSVTable dsvTable = this.srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(
                                        item => item.sFriendlyName == xRel.toTable);
                                DSVColumn dsvColumn = dsvTable.lstColumns.Find(
                                        item => item.sFriendlyName == xDArel.sName);

                                sAttributeList += string.Format(XMLAMaterialisedAttribute, xDArel.sID.Replace("|", ""), xDArel.sDataType, xDArel.sDataSize, xDim.sID, TabularXMLAWriter.FormatColumnID(xDArel.sID));
                            }
                        }

                        sRefDim += string.Format(XMLAMaterialisedDimension, FormatColumnName(xRel.toTable), sAttributeList, FormatColumnName(xRel.sIntermediateDimensionID), FormatColumnName(xRel.sIntermediateGranularityID), xRel.sID, sMaterialisation);
                    }
                }*/
#endregion
                ///TODO: Visible
                string sMGDim = "";
                if (dimCD.boolVisible)
                {
                     sMGDim = string.Format(constXMLAMeasureGroupsForDim, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, sPartitions, sRefDim, "");
                }
                else
                {
                     sMGDim = string.Format(constXMLAMeasureGroupsForDim, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, sPartitions, sRefDim, constXMLAMeasureGroupPrivate);
                }

                this.sXMLADimensionMeasureGroups += sMGDim;
                }
        }

        private string CreateReferenceDim(XMLAModel cmActiveModel,  string pMaterialisation, string pToTable, string pToColumn, string pIntermediateDimensionID, string pIntermediateGranularityID, string pID)
        {
            string sRefDim = "";
            string sMaterialisation = pMaterialisation;
            
            string sAttributeList = "";
            sAttributeList += XMLAMaterialisedRowNumber;


            XMLADimension xDim = cmActiveModel.lstDimensions.Find(item => item.sID == pToTable);
            if (xDim == null)
            {
                return "";
            }
            //Key attributes
            string sAttributeID = pToColumn;
            string sDataType = "";
            string sDataSize = "";
            if (xDim.lstDimensionAttributes.Exists(item => item.sID == pToColumn || item.sID == pToColumn + "|"))
            {
                sDataType = xDim.lstDimensionAttributes.Find(item => item.sID == pToColumn || item.sID == pToColumn + "|").sDataType;
                sDataSize = xDim.lstDimensionAttributes.Find(item => item.sID == pToColumn || item.sID == pToColumn + "|").sDataSize;
            }
            else
            {
                sDataType = "Integer";
                sDataSize = "-1";
            }
            sAttributeList += string.Format(XMLAMaterialisedGranularity, sAttributeID, sDataType, sDataSize, pToTable, pToColumn);

            //Rest of attributes
            foreach (XMLADimensionAttribute xDArel in xDim.lstDimensionAttributes)
            {
                if (xDArel.sID != sAttributeID && xDArel.sID != sAttributeID + "|")
                {
                    //We need to filter out fields that come in via related attributes for MDM sources
                    

                    DSVTable dsvTable = this.srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(
                            item => item.sFriendlyName == pToTable);
                    if (dsvTable == null)
                    {
                        dsvTable = this.srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(
                            item => item.sName == pToTable);
                    }
                    if (isTabularSource || dsvTable.sTableName == xDArel.sDBTableName)
                    {
                        DSVColumn dsvColumn = dsvTable.lstColumns.Find(
                                item => item.sFriendlyName == xDArel.sName);

                        sAttributeList += string.Format(XMLAMaterialisedAttribute, xDArel.sID.Replace("|", ""), xDArel.sDataType, xDArel.sDataSize, xDim.sID, TabularXMLAWriter.FormatColumnID(xDArel.sID));
                    }
                    else
                    {
                    }
                }
            }

            sRefDim += string.Format(XMLAMaterialisedDimension, FormatColumnName(pToTable), sAttributeList, FormatColumnName(pIntermediateDimensionID), FormatColumnName(pIntermediateGranularityID), pID, sMaterialisation);

            return sRefDim;
        }

        public void BuildCubeModelXMLA()
        {
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];


            string sMDX = "";
            string sMeasuresList ="";
            string sCalculationOptionsList = "";
            foreach (XMLAMeasureGroup xMG in cmActiveModel.lstMeasureGroups) 
            {
                //if (xMG.sID.Contains("DimPerson"))
                //{
                    //We need to map up measures to dimensions where we have non-degenerate relationships
                    //Use the first measure
                    if (xMG.lstMeasures.Count > 0&& (xMG.lstMeasures[0].sAggregationFunction != "Count"))
                        {
                            XMLADimension xd = cmActiveModel.lstDimensions.Find(item => item.sKeySchemaName == xMG.lstMeasures[0].sDBSchemaName && item.sKeyTableName == xMG.lstMeasures[0].sDBTableName);
                            if (xd != null)
                            {
                                xMG.sID = xd.sID;
                            }
                        }
                        else
                        {
                            if (xMG.lstMeasures.Count > 1 && xMG.lstMeasures[1].sAggregationFunction != "Count")
                            {
                                XMLADimension xd = cmActiveModel.lstDimensions.Find(item => item.sKeySchemaName == xMG.lstMeasures[1].sDBSchemaName && item.sKeyTableName == xMG.lstMeasures[1].sDBTableName);
                                if (xd != null)
                                {
                                    xMG.sID = xd.sID;
                                }
                            }
                    }
                    

                //}
                //if( cmActiveModel.lstDimensions.Exists( item => item.sKeySchemaName == xMG.

                foreach (XMLAMeasure xm in xMG.lstMeasures)
                {
                    #region Build standard measures
                    string sMeasure = "";
                    if (xm.sAggregationFunction == "Count")
                    {
                        //sMeasure = string.Format(constXMLAMeasure, xm.sDBTableName, xm.sName, "COUNTROWS", xm.sDBColumnName); 
                        //Skip til we work out how to identify the table
                        if (xm.boolVisible)
                        {
                            //Only create measures that are visible
                            XMLADimension xd = cmActiveModel.lstDimensions.Find(item => item.sKeySchemaName == xMG.lstMeasures[0].sDBSchemaName && item.sKeyTableName == xMG.lstMeasures[0].sDBTableName);
                            if (xd != null)
                            {
                                if (xd.sKeyColumnName != null && xd.sKeyColumnName != "")
                                {
                                    sMeasure = string.Format(constXMLAMeasureCountID, xMG.sID, FormatColumnName(xm.sID), xm.sAggregationFunction, xd.sKeyColumnName);
                                }
                                else
                                {
                                    //try find it by name
                                    XMLADimensionAttribute xda = xd.lstDimensionAttributes.Find(item => item.sName.Contains(xd.sName) && item.sName.Contains("ID"));
                                    if (xda != null)
                                    {
                                        sMeasure = string.Format(constXMLAMeasureCountID, xMG.sID, FormatColumnName(xm.sID), xm.sAggregationFunction, xda.sName);
                                    }
                                    else
                                    {
                                        sMeasure = string.Format(constXMLAMeasureCountID, xMG.sID, FormatColumnName(xm.sID), xm.sAggregationFunction, xd.sKeyColumnName);
                                    }
                                }
                        
                            }
                            else
                            {
                                sMeasure = string.Format(constXMLAMeasureCount, xMG.sID, FormatColumnName(xm.sID), xm.sAggregationFunction);
                            }
                        }
                        else
                        {
                            ///TODO: Create non-visible measures
                        }
                    }
                    else
                    {

                        if ((xm.sAttributeName == null || xm.sAttributeName == "") && !(xm.sMeasureExpression == null))
                        {
                            sMeasure = string.Format(constXMLAMeasureCustom, xm.sDimensionID, xm.sID, xm.sMeasureExpression);
                        }
                        else
                        {
                            sMeasure = string.Format(constXMLAMeasure, xm.sDimensionID, xm.sID, xm.sAggregationFunction, xm.sAttributeName);
                        }
                    }
                    sMeasuresList += sMeasure + "\n";
                    #endregion
                }
            }
            //One set of calcs across the whole cube
            foreach (MDXScriptCalcProp calcProp in cmActiveModel.mdxScript.CalcProps)
            {
                string sCalculationOptions = "";
                sCalculationOptions = string.Format(constXMLACalcProp, calcProp.sCalculationReference, calcProp.sFormat, calcProp.sFormatString);
                sCalculationOptionsList += sCalculationOptions + "\n";
            }

            if (isTabularSource)
            {
                sMDX = string.Format(constXMLAMDX, sMeasuresList, this.srcCubeReader.cbOriginalCube.lstCubeModels[0].sPowerPivotMDXCommand, sCalculationOptionsList).Replace("\t", "");
            }
            else
            {
                ///TODO: Push standard measures onto DAX measures rather than buried in MDX script
                string sPowerPivotCalc = string.Format(constPowerPivotCommand, sMeasuresList);
                string sMDXList = "";
                foreach (XMLAMDXCommand comm in cmActiveModel.lstMDXCommands)
                {
                    //Allocate them to the first measure group as we don't have a measures group
                    sMDXList += string.Format(constXMLAMeasureCustom, cmActiveModel.lstMeasureGroups[0].sID, comm.sName, comm.sCommand.Replace("&", "&amp;"));
                        
                }
                sMDX = string.Format(constXMLAMDX, sMDXList, sPowerPivotCalc, sCalculationOptionsList).Replace("\t", "");
            
            }

            sMDX = sMDX.Replace(@"	", "");
            this.sXMLACubes = string.Format(constXMLACube, this.sCubeName, this.sCubeName, this.sXMLACubeDimensions, this.sXMLADimensionMeasureGroups, sMDX);
        }


        public void BuildAlterForDimensions()
        {


            //constXMLAAlterCube

            this.sXMLAAlterStatement = string.Format(constXMLAAlterCube, this.sDBName, this.sDBName, this.sXMLADbDimensions, this.sXMLACubes, this.sXMLADataSource, this.sXMLADSV);
            
        }
        
        public void BuildMeasureGroups()
        {
            this.sXMLADimensionMeasureGroups = "";
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            foreach (XMLAMeasureGroup xMG in cmActiveModel.lstMeasureGroups)
            {
                string sXMLADimensionAttributesLst = "";

                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLAMeasure xMeasure in xMG.lstMeasures)
                {
                    ///TODO: //Need table name and column no for measure groups
                    //sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, xMeasure.sName, xMeasure.sDataType, xMeasure.sDataSize, xMG., daColumns.sDBColumnName);
                }
            }

        }


        #endregion



        #region CreateComponents;
        public void CreateTabular()
        {
            this.CreateTabularDB();
            this.CreateTabularDataSource();
            this.CreateTabularDSVs();
            this.CreateTabularDimensions();
            //this.CreateTabularMeasureGroupTables();
            //this.CreateTabularMeasures();
            //this.CreateTabularCalculatedMDX();
        }

        /// <summary>
        /// Creates the initial Database
        /// </summary>
        public void CreateTabularDB()
        {

            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }

            this.XMLACreateDB = string.Format(this.XMLACreateDB, this.sDBName, this.sDBName);
            XmlaResultCollection result =  cubeServer.Execute(this.XMLACreateDB);
        }

        /// <summary>
        /// Creates the data sources
        /// </summary>
        public void CreateTabularDataSource()
        {

            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }

            foreach (XMLADataSource cbsSrc in this.srcCubeReader.cbOriginalCube.lstDataSources)
            {
                
                if( cbsSrc.sImpersonationMode == "ImpersonateServiceAccount" || cbsSrc.sImpersonationMode == "ImpersonateCurrentUser" || cbsSrc.sImpersonationMode == "Default") 
                {
                      this.XMLACreateDataSources = string.Format(this.XMLACreateDataSources
                        , this.sDBName
                        , cbsSrc.sID.Replace(" ", "_")
                        , cbsSrc.sName
                        , cbsSrc.sConnectionString
                        , string.Format(XMLAImpersonationInfoDefault, cbsSrc.sImpersonationMode));
                }
                else {
                    this.XMLACreateDataSources = string.Format(this.XMLACreateDataSources
                        , this.sDBName
                        , cbsSrc.sID.Replace(" ", "_")
                        , cbsSrc.sName
                        , cbsSrc.sConnectionString
                        , string.Format(XMLAImpersonationInfoUser, cbsSrc.sImpersonationMode, cbsSrc.sImpersonationAccount));
                }

                XmlaResultCollection result = cubeServer.Execute(this.XMLACreateDataSources);
            }
        }

        /// <summary>
        /// Creates the data source views - a little tricky, as these are internal in tabular, unlike in multi-dimensional
        /// </summary>
        public void CreateTabularDSVs()
        {
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connDestConnection);
            }

             string sXMLADSVLst = "";
             foreach (DSV dsvDSV in this.srcCubeReader.cbOriginalCube.lstDSV)
             {
                
                string sTables = "";
                string sConstraints = "";

                foreach (DSVTable dsvT in dsvDSV.lstDSVTables)
                {
                    string sColumns = "";
                    foreach (DSVColumn dsvC in dsvT.lstColumns)
                    {
                        #region StdColumns

                        if (dsvC.sRestrictionBase != null)
                        {
                            dsvC.sRestrictionBase = dsvC.sRestrictionBase.Replace(" ", "");
                        }
                        if (dsvC.sType != null)
                        {
                            dsvC.sType = dsvC.sType.Replace(" ", "");
                            dsvC.sType = dsvC.sType.Replace("datetime", "dateTime");
                        }
                        if (dsvC.sRestrictionBase == "string" || dsvC.sRestrictionBase == "xs: string" || dsvC.sRestrictionBase == "xs:string")
                        {
                            dsvC.sRestrictionBase = "xs:string";
                            sColumns += string.Format(this.XMLAColumnElementString, FormatColumnID(FactDimensions.FixIDs(dsvC.sName)), FormatDBColumnName(dsvC.sDBColumnName), dsvC.sFriendlyName, dsvC.sRestrictionBase, dsvC.sRestrictionMaxLength.Replace("-1", "8000"));
                        }
                        else
                        {
                            if (dsvC.sType == "xs:int64")
                            {
                                dsvC.sType = "xs:long";
                            }
                            if (dsvC.sType == "xs:int16")
                            {
                                dsvC.sType = "xs:int";
                            }
                            //Apparently tabular uses the name as the DB Name
                            sColumns += string.Format(this.XMLAColumnElement, FormatColumnID(FactDimensions.FixIDs(dsvC.sDBColumnName)), FormatDBColumnName(dsvC.sDBColumnName), dsvC.sID.Replace(" ", "_"), dsvC.sType);
                        }
                        #endregion
                    }

                    //Hard fix - adding columns when the source is tabular.
                    if (isTabularSource == true)
                    {
                        foreach (XMLADimensionAttribute xda in
                            this.srcCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(item => item.sName == dsvT.sName).lstDimensionAttributes.FindAll(item => item.bMicrosoft == true)
                            )
                        {
                            sColumns += string.Format(this.XMLAColumnElement, FormatColumnID(FactDimensions.FixIDs(xda.sDBColumnName)), FormatDBColumnName(xda.sDBColumnName), xda.sID.Replace(" ", "_"), xda.sDataType);
                        
                        }
                    }


                    if (dsvT.sQueryDefiniton == null)
                    {
                        sTables += string.Format(XMLATableElementViewTable, dsvT.sName, dsvT.sTableName, dsvT.sFriendlyName, dsvT.sSchemaName, dsvT.sTableType, sColumns);
                    }
                    else
                    {
                        sTables += string.Format(this.XMLATableElementQuery, dsvT.sName, dsvT.sTableName, FormatColumnName(dsvT.sFriendlyName), dsvT.sSchemaName, dsvT.sTableType, FormatQuery(dsvT.sQueryDefiniton), sColumns);
                    }
                   
                }
                 /*
                  * Do the Constraints here
                  * */

                 string sSchema = sTables + " " + sConstraints;
                 /* Check this assumption that cube ID is Model*/
                 sXMLADSVLst += string.Format(this.XMLADSV, this.sDBName, this.sCubeName, dsvDSV.sName, dsvDSV.sDataSourceID.Replace(" ", "_"), sSchema);
                XmlaResultCollection result = cubeServer.Execute(sXMLADSVLst);
             }
            
            
        }

        /// <summary>
        /// Create a dimension for each dimension in the source cube
        /// </summary>
        public void CreateTabularDimensions()
        {
        if (!cubeServer.Connected)
        {
            cubeServer.Connect(this.connDestConnection);
        }
        string XMLADimensionCreate = "";
            string sXMLADimensionAttributesLst = "";
            //string sXMLAPartition = "";
            //For now, just do the first model
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimension dimCD in cmActiveModel.lstDimensions)
            {
                XMLADimensionCreate = "";
                //Run a create for each dimension
                sXMLADimensionAttributesLst = string.Format(XMLARowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    if (daColumns.boolRelated)
                    {
                        sXMLADimensionAttributesLst += string.Format(XMLAAttribute, daColumns.sID, daColumns.sDBTableName, daColumns.sDBColumnName);
                    }
                    else
                    {
                        sXMLADimensionAttributesLst += string.Format(XMLAAttribute, daColumns.sID, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sID.Replace(" ", "_x0020"));
                    }
                }


                string sXMLAPartitions = string.Format(XMLADimensionPartition, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition);
                /*XMLADimensionCreate = string.Format(XMLACreateTableFromDimensionString, this.sDBName, this.sCubeName, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, sXMLAPartitions);
                */

                string sXMLACube = string.Format(constXMLACubeAndMeasureGroupsForDim, this.sCubeName, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, sXMLAPartitions);



                sXMLADimensionAttributesLst = "";
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    sXMLADimensionAttributesLst += string.Format(XMLADimensionAttribute, daColumns.sID, daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName.Replace(" ","")/*_x002_*/, daColumns.sID.Replace(" ", "")/*_x0020*/);
                }
                string lstHierarchies = "";
                foreach (XMLADimensionHierarchy xHier in dimCD.lstHierarchies)
                {
                    string lstLevels = "";
                    foreach (XMLADimensionHierarchyLevel xLevel in xHier.lstLevels)
                    {
                        lstLevels += string.Format(constXMLAHierarchyLevel, xLevel.sID, xLevel.sName, xLevel.sSourceAttributeID);
                    }
                    lstHierarchies += string.Format(constXMLADimensionHierachy, xHier.sID, xHier.sName, lstLevels);
                }
                lstHierarchies = @"
                    <Hierarchies>
                    " + lstHierarchies + @"                
                    </Hierarchies>";
					
                string sXMLADimensions = string.Format(constXMLADbDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition, sXMLADimensionAttributesLst, lstHierarchies);


                string sXMLADataSources = "";
                foreach (XMLADataSource cbsSrc in this.srcCubeReader.cbOriginalCube.lstDataSources)
                {

                    if (cbsSrc.sImpersonationMode == "ImpersonateServiceAccount" || cbsSrc.sImpersonationMode == "ImpersonateCurrentUser" || cbsSrc.sImpersonationMode == "Default")
                    {
                        sXMLADataSources += string.Format(this.XMLACreateDataSources
                          , this.sDBName
                          , cbsSrc.sID
                          , cbsSrc.sName
                          , cbsSrc.sConnectionString
                          , string.Format(XMLAImpersonationInfoDefault, cbsSrc.sImpersonationMode));
                    }
                    else
                    {
                        sXMLADataSources += string.Format(this.XMLACreateDataSources
                            , this.sDBName
                            , cbsSrc.sID
                            , cbsSrc.sName
                            , cbsSrc.sConnectionString
                            , string.Format(XMLAImpersonationInfoUser, cbsSrc.sImpersonationMode, cbsSrc.sImpersonationAccount));
                    }
                }

                string sXMLADSVLst = "";
                foreach (DSV dsvDSV in this.srcCubeReader.cbOriginalCube.lstDSV)
                {

                    string sTables = "";
                    string sConstraints = "";

                    foreach (DSVTable dsvT in dsvDSV.lstDSVTables)
                    {
                        string sColumns = "";
                        foreach (DSVColumn dsvC in dsvT.lstColumns)
                        {

                            if (dsvC.sRestrictionBase != null)
                            {
                                dsvC.sRestrictionBase = dsvC.sRestrictionBase.Replace(" ", "");
                            }
                            if (dsvC.sType != null)
                            {
                                dsvC.sType = dsvC.sType.Replace(" ", "");
                                dsvC.sType = dsvC.sType.Replace("datetime", "dateTime");
                            }
                            if (dsvC.sRestrictionBase == "string" || dsvC.sRestrictionBase == "xs: string" || dsvC.sRestrictionBase == "xs:string")
                            {
                                dsvC.sRestrictionBase = "xs:string";
                                //Apparently tabular uses the name as the DB Name
                                sColumns += string.Format(this.XMLAColumnElementString, FormatColumnID(FactDimensions.FixIDs(dsvC.sDBColumnName)),FormatDBColumnName( dsvC.sDBColumnName), dsvC.sFriendlyName, dsvC.sRestrictionBase, dsvC.sRestrictionMaxLength.Replace("-1", "8000"));
                            }
                            else
                            {
                                //Apparently tabular uses the name as the DB Name
                                sColumns += string.Format(this.XMLAColumnElement,FormatColumnID ( FactDimensions.FixIDs(dsvC.sDBColumnName)), FormatDBColumnName(dsvC.sDBColumnName), dsvC.sID.Replace(" ", "_"), dsvC.sType);
                            }
                        }

                        if (dsvT.sQueryDefiniton == null)
                        {
                            sTables += string.Format(XMLATableElementViewTable, dsvT.sTableName, dsvT.sName, dsvT.sFriendlyName, dsvT.sSchemaName, dsvT.sTableType, sColumns);
                        }
                        else
                        {
                            sTables += string.Format(this.XMLATableElementQuery, dsvT.sTableName, dsvT.sName, FormatColumnName(dsvT.sFriendlyName), dsvT.sSchemaName, dsvT.sTableType, FormatQuery(dsvT.sQueryDefiniton), sColumns);
                        }

                    }
                    /*
                     * Do the Constraints here
                     * */

                    string sSchema = sTables + " " + sConstraints;
                    /* Check this assumption that cube ID is Model*/
                    sXMLADSVLst += string.Format(this.XMLADSV, this.sDBName, this.sCubeName, dsvDSV.sName, dsvDSV.sDataSourceID.Replace(" ", "_"), sSchema);
                }

                lstHierarchies = "";
                foreach (XMLADimensionHierarchy xHier in dimCD.lstHierarchies)
                {
                    string lstLevels = "";
                    foreach (XMLADimensionHierarchyLevel xLevel in xHier.lstLevels)
                    {
                        lstLevels += string.Format(constXMLAHierarchyLevel, xLevel.sID, xLevel.sName, xLevel.sSourceAttributeID);
                    }
                    lstHierarchies += string.Format(constXMLADimensionHierachy, xHier.sID, xHier.sName, lstLevels);
                }
                lstHierarchies = @"
                    <Hierarchies>
                    " + lstHierarchies + @"                
                    </Hierarchies>";
					
                string sXMLADimensionCreate = string.Format(constXMLADbDimensionList, this.sDBName, this.sDBName, sXMLADimensions, sXMLACube, sXMLADataSources, sXMLADSVLst,lstHierarchies);
                XmlaResultCollection result = cubeServer.Execute(XMLADimensionCreate);
            }
        }



        #endregion

    }
}
