using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PW.XMLA.Reader;
using Microsoft.AnalysisServices;
using PW.XMLA.Reader.XMLAPropertyClasses;
using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Excel;
using System.IO.Packaging;
using System.IO;

namespace PW.ExcelCode.Writer
{
    public class ExcelSrcCopyWriter
    {

        #region constants
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
        /// 0 is ID
        /// 1 is Name
        /// 2 is list of dimension attributes
        /// 3 is list of partitions
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
        /// </summary>
        public const string constXMLAMeasureGroupsForDim = @"
                    <MeasureGroup>
                      <ID>{0}</ID>
                      <Name>{1}</Name>
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
        /// </summary>
        public const string constXMLACubeDimensionList = @"
                    <Dimension>
                      <ID>{0}</ID>
                      <Name>{1}</Name>
                      <DimensionID>{0}</DimensionID>
                      <Attributes>
                       {2}
                      </Attributes>
                    </Dimension>
                 ";

        /// <summary>
        ///0 is ID
        /// 1 is Name
        /// 2 is IsQueryEditorUsed
        /// 3 is Data Source ID
        /// 4 is Query Definition
        /// 5 is attributes list
        /// 6 is Data Source View ID
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
		                <DataSourceViewID>{6}</DataSourceViewID>
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
					<ProactiveCaching>
						<SilenceInterval>-PT1S</SilenceInterval>
						<Latency>-PT1S</Latency>
						<SilenceOverrideInterval>-PT1S</SilenceOverrideInterval>
						<ForceRebuildInterval>-PT1S</ForceRebuildInterval>
						<Source xsi:type=""ProactiveCachingInheritedBinding""/>
					</ProactiveCaching>
				</Dimension>
			";

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

        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Data Type
        /// 2 is Data Size
        /// 3 is Table ID
        /// 4 is DB Column
        /// </summary>
        /// 

        public const string constXMLADbDimensionAttribute = @"<Attribute>
              <ID>{0}</ID>
              <Name>{0}</Name>
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
<OrderBy>Key</OrderBy>
            </Attribute>";


        /// <summary>
        /// 0 is Attribute ID
        /// 1 is Data Type /Invalid
        /// 2 is Data Size/Invalid
        /// 3 is Table ID/Invalid
        /// 4 is DB Column/Invalid
        /// </summary>
        public const string constXMLACubeDimensionAttribute = @"<Attribute>
              <AttributeID>{0}</AttributeID>
            </Attribute>";

        #endregion


        #region genericConstants

        /// <summary>
        /// 0 is Table ID
        /// </summary>
        public const string constXMLARowNumberAttribute = @"<Attribute>
              <AttributeID>RowNumber</AttributeID>
            </Attribute>";


        /// <summary>
        /// 0 is Table ID
        /// </summary>
        public const string constXMLADbRowNumberAttribute = @"<Attribute>
              <ID>RowNumber</ID>
              <Name>RowNumber</Name>
			<Type valuens=""ddl200_200"">RowNumber</Type>
			<Usage>Key</Usage>
              <KeyColumns>
                <KeyColumn>
                    <NullProcessing>Error</NullProcessing>
                    <DataType>Integer</DataType>
                    <DataSize>4</DataSize>
                  <Source xsi:type=""ddl200_200:RowNumberBinding""/>
                </KeyColumn>
              </KeyColumns>
            <OrderBy>Key</OrderBy>
            <AttributeHierarchyVisible>false</AttributeHierarchyVisible>
            </Attribute>";

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
			<ID>{0}</ID>
			<Name>{1}</Name>
			<DataSourceID>{2}</DataSourceID>
            <Schema>
                <xs:schema id=""{0}"" xmlns="""" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:msdata=""urn:schemas-microsoft-com:xml-msdata"" xmlns:msprop=""urn:schemas-microsoft-com:xml-msprop"">
            {3}
            </xs:schema>
            </Schema>
            
		</DataSourceView>";

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
                  <MdxScripts>
                    {4}
                  </MdxScripts>
<StorageMode valuens=""ddl200_200"">InMemory</StorageMode>
</Cube>

";

        #endregion
        #endregion
        #region Properties
        public string connSrcConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2012Tabular;Initial Catalog=PWZero1RCS";
        public string connDestConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2012Tabular;Initial Catalog={0}";
        public string sFilename = @"D:\Dropbox\Clients\XMLA_TabularConverter\Test123.xlsx";
        public string sTemplateFilename = @"D:\Dropbox\Clients\XMLA_TabularConverterD:\Dropbox\Clients\XMLA_TabularConverter\ExcelCode\PW.PowerPivotTemplate.xlsx";
        public string sDBName = "PWZero1RCS";
        public string sCubeName = "Model";
        public string XMLADefinition = "";

        public PW.XMLA.Reader.MultiDimensionalReader srcCubeReader;
        #endregion 
        public string XMLACreateDatabase;
        public string strBackupFilename;
        #region Individual XMLA
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


        public string XMLAImpersonationInfoDefault = @"<ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
            </ImpersonationInfo>";

        public string XMLAImpersonationInfoUser = @"            <ImpersonationInfo>
                <ImpersonationMode>{0}</ImpersonationMode>
                <Account>{1}</Account>
            </ImpersonationInfo>";

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
        public string XMLATableElementViewTable = @"								<xs:element name=""{0}"" msprop:DbTableName=""{1}"" msprop:FriendlyName=""{2}"" msprop:DbSchemaName=""{3}"" msprop:TableType=""{4}"">
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
        public string XMLADimensionAttribute = @"<Attribute>
              <ID>{0}</ID>
              <Name>{0}</Name>
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

        #region XMLAProperties

        public string sXMLAAlterStatement = "";
        public string sXMLADataSource = "";
        public string sXMLADSV = "";
        public string sXMLADbDimensions = "";
        public string sXMLACubeDimensions = "";
        public string sXMLADimensionMeasureGroups = "";
        public string sXMLACubes = "";



        #endregion

        #region AMO properties
        Microsoft.AnalysisServices.Server cubeServer = new Server();
        Microsoft.AnalysisServices.Database cubeDatabase;
        #endregion


        #region ExcelCreation
        
        private Application app = null;
        private Workbook workbook = null;
        private Worksheet worksheet = null;
        private Range workSheet_range = null;

        public void CreateExcel() 
        {
            CreateExcelWorkbook();
            CreateNewPowerPivotModel();
            //CreatePowerPivotCube();
            InsertCubeIntoWorkbook();
        }


        public void InsertCubeIntoWorkbook()
        {
            BackupCube();


            WritePackagePartContents(sFilename, @"/xl/customData/item1.data", ReadContentsFromFile(strBackupFilename));
        

        }

        public void BackupCube()
        {

            sDBName = "PWZero1RCS";
            if (!cubeServer.Connected)
            {
                cubeServer.Connect(string.Format(this.connDestConnection, this.sDBName));
            }
            strBackupFilename = @"D:\Dropbox\Clients\XMLA_TabularConverter\" + DateTime.Now.ToString().Replace("/","").Replace(":","") + ".abf";
            cubeServer.Databases.FindByName(this.sDBName).Backup(strBackupFilename, true);
        }


        #region InsertZip

        const string DBName = "Testing";
        const string OriginalBackupPath = @"\\MyLocation\BKUP.abf";
        const string ModifiedBackupPath = @"\\MyLocation\BKUPAfter.abf";
        const string ServerPath = @"machineName\powerpivot";

        private static readonly Server srv = new Server();
        private static readonly Scripter scripter = new Scripter();
        private static Database db;

        private static byte[] GetPackagePartContents(string packagePath, string partPath)
        {
            var pack = Package.Open(packagePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            var part = pack.GetPart(new Uri(partPath, UriKind.Relative));
            var stream = part.GetStream();
            var b = new byte[stream.Length];
            stream.Read(b, 0, b.Length);
            stream.Flush();
            stream.Close();
            pack.Flush();
            pack.Close();
            return b;
        }

        private static byte[] ReadContentsFromFile(string filePath)
        {
            var fileStream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            var b = new byte[fileStream.Length];
            fileStream.Read(b, 0, b.Length);
            fileStream.Flush();
            fileStream.Close();
            return b;
        }

        private static void WritePackagePartContents(string packagePath, string partPath, byte[] contents)
        {
            var uri = new Uri(partPath, UriKind.Relative);
            var pack = Package.Open(packagePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            var part = pack.GetPart(uri);
            var type = part.ContentType;
            pack.DeletePart(uri);
            pack.CreatePart(uri, type);
            part = pack.GetPart(uri);
            var stream = part.GetStream();
            stream.Write(contents, 0, contents.Length);
            stream.Flush();
            stream.Close();
            pack.Flush();
            pack.Close();
        }


        #endregion

        public void CreateExcelWorkbook()
        {
            try
            {
                app = new Application();
                app.Visible = true;
                app.DisplayAlerts = false; 
                workbook  = app.Workbooks.Open(sTemplateFilename,         0, false, 5, "", "", false, XlPlatform.xlWindows, "",        true, false, 0, true, false, false);
                //workbook = app.Workbooks.Add(1);
                workbook.SaveAs(this.sFilename);
                worksheet = (Worksheet)workbook.Sheets[1];
               
            }
            catch (Exception e)
            {
                workbook.Save();
                //Console.Write("Error");
            }
            finally
            {
                workbook.Close();
                
            }


        }

        public void CreateNewPowerPivotModel()
        {
            //using Template
        }

        public void CreatePowerPivotCube()
        {
            Guid g =  System.Guid.NewGuid();
            //string sTempName = "PowerPivotOutput_" + g.ToString();
            this.connDestConnection = this.connSrcConnection;//string.Format(this.connDestConnection, sTempName);
            this.srcCubeReader.cbOriginalCube.sID = "PowerPivotOutput_" + g.ToString();
            this.srcCubeReader.cbOriginalCube.sName = "PowerPivotOutput_" + g.ToString();

            this.sDBName = "PowerPivotOutput_" + g.ToString();
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
        #endregion

        #region PopulateXML

        public void BuildTabularXMLA()
        {
            //FixUp the snowflake dimensions
            //SnowflakeDimensions.ProcessSnowflakes(ref this.srcCubeReader);
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
                            sColumns += string.Format(this.XMLAColumnElementString, dsvC.sName, dsvC.sDBColumnName, dsvC.sFriendlyName, dsvC.sRestrictionBase, dsvC.sRestrictionMaxLength.Replace("-1", "8000"));
                        }
                        else
                        {
                            if (dsvC.sType == "xs:int64")
                            {
                                dsvC.sType = "xs:long";
                            }
                            sColumns += string.Format(this.XMLAColumnElement, dsvC.sName, dsvC.sDBColumnName, dsvC.sID.Replace(" ", "_"), dsvC.sType);
                        }
                    }

                    if (dsvT.sQueryDefiniton == null)
                    {
                        sTables += string.Format(XMLATableElementViewTable, dsvT.sTableName, dsvT.sName, dsvT.sFriendlyName, dsvT.sSchemaName, dsvT.sTableType, sColumns);
                    }
                    else
                    {
                        sTables += string.Format(this.XMLATableElementViewTable, dsvT.sTableName, dsvT.sName, dsvT.sSchemaName, dsvT.sTableType, dsvT.sQueryDefiniton, sColumns);
                    }

                }
                /*
                 * Do the Constraints here
                 * */

                string sSchema = sTables + " " + sConstraints;
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
                sXMLADimensionAttributesLst = string.Format(constXMLADbRowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    sXMLADimensionAttributesLst += string.Format(constXMLADbDimensionAttribute, daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                }
                sXMLADbDimensions += string.Format(constXMLADbDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition, sXMLADimensionAttributesLst, dimCD.sDSVID);
            }
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
                    sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                }
                this.sXMLACubeDimensions += string.Format(constXMLACubeDimensionList, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst);
            }
        }

        public void BuildMeasureGroupsForDims()
        {
            //constXMLAMeasureGroupsForDim
            //this.sXMLADimensionMeasureGroups = "";
            //Need to reset object on restart
            XMLAModel cmActiveModel = this.srcCubeReader.cbOriginalCube.lstCubeModels[0];
            string sXMLADimensionAttributesLst = "";
            foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimension dimCD in cmActiveModel.lstDimensions)
            {

                //Set up attributes
                //AttributeID // constXMLADbDimensionAttribute
                //sXMLADimensionAttributesLst = string.Format(constXMLARowNumberAttribute, dimCD.sID.Replace(" ", "_"));
                //Handled in measure group code

                sXMLADimensionAttributesLst = "";
                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLADimensionAttribute daColumns in dimCD.lstDimensionAttributes)
                {
                    sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, daColumns.sName, daColumns.sDataType, daColumns.sDataSize, daColumns.sDBTableName, daColumns.sDBColumnName);
                }
                string sPartitions = string.Format(constXMLADimensionPartition, dimCD.sID.Replace(" ", "_"), dimCD.sName, "False", dimCD.sDataSourceID.Replace(" ", "_"), dimCD.sQueryDefinition);

                this.sXMLADimensionMeasureGroups += string.Format(constXMLAMeasureGroupsForDim, dimCD.sID.Replace(" ", "_"), dimCD.sName, sXMLADimensionAttributesLst, sPartitions);
            }
        }

        public void BuildCubeModelXMLA()
        {
            this.sXMLACubes = string.Format(constXMLACube, this.sCubeName, this.sCubeName, this.sXMLACubeDimensions, this.sXMLADimensionMeasureGroups, "" /*No MDX Scripts yet*/);
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
            foreach (XMLAMeasureGroup xMG in cmActiveModel.lstMeasureGrous)
            {
                string sXMLADimensionAttributesLst = "";

                foreach (PW.XMLA.Reader.XMLAPropertyClasses.XMLAMeasure xMeasure in xMG.lstMeasures)
                {//Need table name and column no
                    ///TODO:
                    //sXMLADimensionAttributesLst += string.Format(constXMLACubeDimensionAttribute, xMeasure.sName, xMeasure.sDataType, xMeasure.sDataSize, xMG., daColumns.sDBColumnName);
                }
            }

        }


        #endregion

    }
}
