using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.AnalysisServices;
using PW.XMLA.Reader.XMLAPropertyClasses;

namespace PW.XMLA.Reader
{



    public class MultiDimensionalReader
    {

        public static string FixIDs(string sID)
        {
            string sRet = sID;
            // .,;'`:/\*|?"&%$!+=()[]{}<>
            sRet = sRet.Replace(@".", "");
            sRet = sRet.Replace(@",", "");
            sRet = sRet.Replace(@";", "");
            sRet = sRet.Replace(@"'", "");
            sRet = sRet.Replace(@"`", "");
            sRet = sRet.Replace(@":", "");
            sRet = sRet.Replace(@"/", "");
            sRet = sRet.Replace(@"\", "");
            sRet = sRet.Replace(@"*", "");
            sRet = sRet.Replace(@"|", "");
            sRet = sRet.Replace(@"?", "");
            sRet = sRet.Replace(@"""", "");
            sRet = sRet.Replace(@"&", "");
            sRet = sRet.Replace(@"%", "");
            sRet = sRet.Replace(@"$", "");
            sRet = sRet.Replace(@"!", "");
            sRet = sRet.Replace(@"+", "");
            sRet = sRet.Replace(@"=", "");
            sRet = sRet.Replace(@"(", "");
            sRet = sRet.Replace(@")", "");
            sRet = sRet.Replace(@"[", "");
            sRet = sRet.Replace(@"]", "");
            sRet = sRet.Replace(@"{", "");
            sRet = sRet.Replace(@"}", "");
            sRet = sRet.Replace(@"<", "");
            sRet = sRet.Replace(@">", "");
            return sRet;

        }


        public string connSrcConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2k8r2;Initial Catalog=TimesheetsCube";
        public string sSrcDBName = "Timesheets";
        public bool isTabular = false;
        public bool isTabularSource = false;


        public string XMLADefinition = "";

        public string XMLACreateDatabase;

        public CubeDatabase cbOriginalCube = new CubeDatabase();
        /// <summary>
        /// Cloning. Note that this is shallow clone. 
        /// </summary>
        /// <returns></returns>


            #region AMO properties
            Microsoft.AnalysisServices.Server cubeServer = new Server();
            Microsoft.AnalysisServices.Database cubeDatabase;
            #endregion
        //cubeServer.connect 

        public void PopulateDefinitionFromMultiDimensional()
        {

            if (!cubeServer.Connected)
            {
                cubeServer.Connect(this.connSrcConnection);
            }
            cubeDatabase = cubeServer.Databases.GetByName(this.sSrcDBName);
            
            //Populating the cubes
            foreach (Cube srcCube in cubeDatabase.Cubes)
            {
                XMLAModel cmModel = new XMLAModel();
                cmModel.sName = srcCube.Name;
                cmModel.sID = srcCube.ID.ToString();

                ///Do the dimensions here
                ExtractDimensions(srcCube, cmModel);
                ExtractMeasureGroups(srcCube, cmModel);
                ///Do the Measure groups here

                cbOriginalCube.lstCubeModels.Add(cmModel);
            }

            ExtractDataSources();

            ExtractDSVs();

            if (!isTabularSource)
            {

                BuildDimensionRelationships();
                //foreach (Cube srcCube in cubeDatabase.Cubes)
                //{

                //BuildMGDimensionRelationships(cbOriginalCube.lstCubeModels[0]);
                //Done in post Fact dimension
                //}
            }
        }

        private void BuildMGDimensionRelationships(XMLAModel xModel)
        {

            /*foreach (XMLAMeasureGroup xMG in xModel.lstMeasureGroups)
            {
                if (xMG.sID.Contains("Fact"))
                {
                    string sSchema = "";
                    string sTable = "";
                    string sKeyColumn = "";
                    XMLADimension xDInt = null;
                    if (xMG.lstMeasures.Count > 0 && (xMG.lstMeasures[0].sAggregationFunction != "Count"))
                    {
                        xDInt = xModel.lstDimensions.Find(item => item.sKeySchemaName == xMG.lstMeasures[0].sDBSchemaName && item.sKeyTableName == xMG.lstMeasures[0].sDBTableName);
                        if (xDInt != null)
                        {
                            xMG.sID = xDInt.sID;
                            sSchema = xDInt.sKeySchemaName;
                            sTable = xDInt.sKeyTableName;
                            sKeyColumn = xDInt.sKeyColumnName;
                        }
                    }
                    else
                    {
                        if (xMG.lstMeasures.Count > 1 && xMG.lstMeasures[1].sAggregationFunction != "Count")
                        {
                            xDInt = xModel.lstDimensions.Find(item => item.sKeySchemaName == xMG.lstMeasures[1].sDBSchemaName && item.sKeyTableName == xMG.lstMeasures[1].sDBTableName);
                            if (xDInt != null)
                            {
                                sSchema = xDInt.sKeySchemaName;
                                sTable = xDInt.sKeyTableName;
                                sKeyColumn = xDInt.sKeyColumnName;

                            }
                        }
                    }
                    if (xDInt != null)
                    {
                        string sID = xMG.sID + "-" + xDInt.sID;

                        if (sKeyColumn.Replace(" ", "") == "AnalysisServices")
                        {
                            sKeyColumn = "RowNumber";
                            if (xDInt.sName.ToUpper() == "UTCDATE")
                            {
                                sKeyColumn = "DateID";//d.Dimension.Attributes[1].Name;
                            }

                        }

                        foreach (XMLADimension xd in xMG.lstDimensions)
                        {
                            XMLARelationship xRel = xDInt.lstRelationships.Find(item => item.toTable == xd.sID);

                            if (xRel != null)
                            {
                                xDInt.lstReferenceDimensions.Add(new XMLAReferenceDimension(
                                    xd.sID,
                                    xd.sID,
                                    xDInt.sID,
                                    xRel.fromColumn,
                                    "Regular",
                                    xd.sName
                                    , xd.sKeyColumnName
                                    ));
                            }
                        }
                    }
                }

            }*/
               

        }
        

        private void BuildDimensionRelationships()
        {
            XMLAModel xModel = cbOriginalCube.lstCubeModels[0];
            foreach(DSVRelationship dsvR in this.cbOriginalCube.lstDSV[0].lstRelationships)
            {
                if( xModel.lstDimensions.Exists(
                    item => item.sKeyTableName == dsvR.childTable
                           && item.sKeySchemaName == dsvR.childSchema)
                    &&
                    xModel.lstDimensions.Exists(
                    item => item.sKeyTableName == dsvR.parentTable
                           && item.sKeySchemaName == dsvR.parentSchema)
                    ) 
                {
                    XMLADimension xDimChild = xModel.lstDimensions.Find(
                    item => item.sKeyTableName == dsvR.childTable
                           && item.sKeySchemaName == dsvR.childSchema);
                    XMLADimension xDimParent= xModel.lstDimensions.Find(
                    item => item.sKeyTableName == dsvR.parentTable
                           && item.sKeySchemaName == dsvR.parentSchema);
                    //Create a relationship
                    string fromColumn = xDimChild.lstDimensionAttributes.Find(item => item.sDBColumnName == dsvR.childColumn).sID;
                    string ToColumn = xDimParent.lstDimensionAttributes.Find(item => item.sDBColumnName == dsvR.parentColumn).sID;
                    if (!xDimChild.lstRelationships.Exists(item => item.fromColumn == fromColumn
                        && item.toColumn == ToColumn
                        && item.fromTable == xDimChild.sID
                        && item.toTable == xDimParent.sID
                        ))
                    {
                        this.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.childTable
                               && item.sKeySchemaName == dsvR.childSchema).lstRelationships.Add(
                            new XMLARelationship(
                                dsvR.sID, xDimChild.sID, fromColumn, xDimParent.sID, ToColumn)
                                );

                        //Set the attributes for the key column

                        this.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.parentTable
                               && item.sKeySchemaName == dsvR.parentSchema)
                               .lstDimensionAttributes.Find(item => item.sDBColumnName == ToColumn)
                               .sCardinality = "One";

                        this.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.parentTable
                               && item.sKeySchemaName == dsvR.parentSchema)
                               .lstDimensionAttributes.Find(item => item.sDBColumnName == ToColumn)
                               .sNullProcessing = "Error";
                    }   

                }
                    
            }
        }

        private void ExtractDSVs()
        {
            foreach (DataSourceView srcDSV in cubeDatabase.DataSourceViews)
            {

                
                DSV dsvDSV = new DSV();
                dsvDSV.sName = srcDSV.Name.ToString();

                dsvDSV.sID = srcDSV.ID.ToString();
                dsvDSV.sDataSourceID = srcDSV.DataSourceID.ToString();

                foreach (System.Data.DataTable srcDT in srcDSV.Schema.Tables)
                {
                    DSVTable dsvT = new DSVTable();

                    
                    /*if (srcDT.TableName.ToString() != "Report" && srcDT.TableName.ToString() != "FactBalance"
                          && srcDT.ExtendedProperties["DbTableName"].ToString() != "Report"
                        && srcDT.ExtendedProperties["DbTableName"].ToString() != "FactBalance"
                    )
                    {
                        continue;
                    }*/
                    
                    
                    dsvT.sName = srcDT.TableName.Replace(" ","").Replace("_","")/*x0020*/;

                    dsvT.sTableName = srcDT.ExtendedProperties["DbTableName"].ToString().Replace("_", "");
                    dsvT.sFriendlyName = srcDT.ExtendedProperties["FriendlyName"].ToString();
                    dsvT.sTableType = srcDT.ExtendedProperties["TableType"].ToString();

                    if (srcDT.PrimaryKey.Count() == 1)
                    {
                        dsvT.sKeyColumn = srcDT.PrimaryKey[0].ToString();
                    }
                    else
                    {
                        foreach (System.Data.DataColumn dc in srcDT.PrimaryKey)
                        {
                            dsvT.lstKeyColumns.Add(dc.ColumnName);
                        }
                    }

                    if (srcDT.ExtendedProperties["DbSchemaName"] != null)
                    {
                        dsvT.sSchemaName = srcDT.ExtendedProperties["DbSchemaName"].ToString();
                    }

                    foreach (System.Data.DataColumn srcDC in srcDT.Columns)
                    {
                        #region StdColumns
                        DSVColumn dsvC = new DSVColumn();
                        dsvC.sName = MultiDimensionalReader.FixIDs(srcDC.ColumnName.Replace(" ", "").Replace("_","")/*_x0020*/);
                        dsvC.sID = MultiDimensionalReader.FixIDs(srcDC.ColumnName).Replace("_", "");
                        if (!isTabular)
                        {
                            dsvC.sDBColumnName = MultiDimensionalReader.FixIDs(srcDC.ExtendedProperties["DbColumnName"].ToString().Replace("_", ""));
                        }
                        else 
                        {
                            dsvC.sDBColumnName = MultiDimensionalReader.FixIDs(srcDC.ColumnName.ToString().Replace("_", ""));
                        
                        }
                        
                        if (srcDC.ExtendedProperties["FriendlyName"] != null)
                        {
                            dsvC.sFriendlyName = MultiDimensionalReader.FixIDs(srcDC.ExtendedProperties["FriendlyName"].ToString());
                        }

                        if (srcDC.DataType.Name == "Int32")
                        {
                            dsvC.sType = "xs:int";
                        }
                        else if (srcDC.DataType.Name == "String")
                        {
                            dsvC.sRestrictionBase = "xs: " + srcDC.DataType.Name.ToString().ToLower();
                            dsvC.sRestrictionMaxLength = srcDC.MaxLength.ToString();
                        }
                        else
                        {
                            dsvC.sType = "xs: " + srcDC.DataType.Name.ToString().ToLower();
                        }

                        dsvT.lstColumns.Add(dsvC);
                        #endregion
                    }

                    //Hard fix - adding columns when the source is tabular.
                    if (isTabularSource == true)
                    {
                        foreach (XMLADimensionAttribute xda in
                            this.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(item => item.sID.Replace(" ", "").Replace("_", "") == dsvT.sName).lstDimensionAttributes.FindAll(item => item.bMicrosoft == true)
                            )
                        {
                            #region StdColumns
                            DSVColumn dsvC = new DSVColumn();
                            dsvC.sName = MultiDimensionalReader.FixIDs(xda.sName.Replace(" ", "").Replace("_", "")/*_x0020*/);
                            dsvC.sID = MultiDimensionalReader.FixIDs(xda.sName).Replace("_", "");
                            if (!isTabular)
                            {
                                dsvC.sDBColumnName = MultiDimensionalReader.FixIDs(xda.sDBColumnName.ToString().Replace("_", ""));
                            }
                            else
                            {
                                dsvC.sDBColumnName = MultiDimensionalReader.FixIDs(xda.sName.ToString().Replace("_", ""));

                            }

                            if (xda.sName != null)
                            {
                                dsvC.sFriendlyName = MultiDimensionalReader.FixIDs(xda.sName.ToString());
                            }

                            if (xda.sDataType == "Int32")
                            {
                                dsvC.sType = "xs:int";
                            }
                            else if (xda.sDataType == "String")
                            {
                                dsvC.sRestrictionBase = "xs: " + xda.sDataType.ToLower();
                                dsvC.sRestrictionMaxLength = xda.sDataSize.ToString();
                            }
                            else if (xda.sDataType == "WChar")
                            {
                                dsvC.sRestrictionBase = "xs:string";
                                dsvC.sRestrictionMaxLength = xda.sDataSize.ToString();
                            }
                            else
                            {
                                dsvC.sType = "xs: " + xda.sDataType.ToString().ToLower();
                            }

                            dsvT.lstColumns.Add(dsvC);
                            #endregion
                            //sColumns += string.Format(this.XMLAColumnElement, FormatColumnID(FactDimensions.FixIDs(xda.sDBColumnName)), FormatDBColumnName(xda.sDBColumnName), xda.sID.Replace(" ", "_"), xda.sDataType);


                        }
                    }

                    //Add all the relationships
                    foreach (System.Data.DataRelation relDSV in srcDT.ChildRelations)
                    {
                        DSVRelationship dsvrRelation = new DSVRelationship();
                        dsvrRelation.sID = relDSV.RelationName;
                        dsvrRelation.childSchema = relDSV.ChildTable.TableName.Split('_')[0];
                        dsvrRelation.childTable = relDSV.ChildTable.TableName.Split('_')[1];
                        if (relDSV.ChildColumns.Count() == 1)
                        {
                            dsvrRelation.childColumn = relDSV.ChildColumns[0].ColumnName;
                        }
                        else
                        {
                            foreach (System.Data.DataColumn dc in relDSV.ChildColumns)
                            {
                                dsvrRelation.lstChildColumns.Add(dc.ColumnName);
                            }
                        }
                        dsvrRelation.parentSchema = relDSV.ParentTable.TableName.Split('_')[0];
                        dsvrRelation.parentTable = relDSV.ParentTable.TableName.Split('_')[1];
                        if (relDSV.ParentColumns.Count() == 1)
                        {
                            dsvrRelation.parentColumn = relDSV.ParentColumns[0].ColumnName;
                        }
                        else
                        {
                            foreach (System.Data.DataColumn dc in relDSV.ParentColumns)
                            {
                                dsvrRelation.lstParentColumns.Add(dc.ColumnName);
                            }
                        }

                        dsvDSV.lstRelationships.Add(dsvrRelation);

                    }

                    dsvDSV.lstDSVTables.Add(dsvT);

                }

                cbOriginalCube.lstDSV.Add(dsvDSV);

            }
        }

        private void ExtractDataSources()
        {
            foreach (DataSource srcDataSources in cubeDatabase.DataSources)
            {
                XMLADataSource cdsDataSource = new XMLADataSource();
                cdsDataSource.sName = srcDataSources.Name;
                cdsDataSource.sID = srcDataSources.ID.ToString();
                cdsDataSource.sConnectionString = srcDataSources.ConnectionString;
                cdsDataSource.sConnectionStringSecurity = srcDataSources.ConnectionStringSecurity.ToString();
                cdsDataSource.sImpersonationMode = srcDataSources.ImpersonationInfo.ImpersonationMode.ToString();
                if (srcDataSources.ImpersonationInfo.Account != null)
                {
                    cdsDataSource.sImpersonationAccount = srcDataSources.ImpersonationInfo.Account.ToString();
                }

                cdsDataSource.sImpersonationInfoSecurity = srcDataSources.ImpersonationInfo.ImpersonationInfoSecurity.ToString();

                if (srcDataSources.ImpersonationInfo.Password != null)
                {
                    cdsDataSource.sPassword = srcDataSources.ImpersonationInfo.Password;
                }
                cbOriginalCube.lstDataSources.Add(cdsDataSource);
                //cdsDataSource.

            }
        }

        private void ExtractDimensions(Cube srcCube, XMLAModel cmModel)
        {

            CubeDimensionCollection colDim = srcCube.Dimensions ;
            foreach (CubeDimension cubedim in srcCube.Dimensions )
            {

                #region Dim Setup
                /*if (cubedim.Name != "Report")
                {
                    continue;
                }*/
                Dimension dim = cubedim.Dimension;
                XMLADimension cdDim = new XMLADimension();
                cdDim.boolVisible = cubedim.Visible;
                cdDim.sName = dim.Name.Replace(" ", "").Replace("_", "")/*x0020*/;
                cdDim.sID = dim.ID.Replace(" ", "").Replace("_", "")/*x0020*/;
                cdDim.boolIsParentChild = cubedim.Dimension.IsParentChild;
                //cdDim.sDSVID = dim.DataSourceView.ID.ToString().Replace(" ", "");
                cdDim.sDSVID = dim.DataSourceView.ID.ToString();
                if (!isTabular)
                {
                    cdDim.sKeySchemaName = (dim.KeyAttribute.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0];
                    cdDim.sKeyTableName = dim.KeyAttribute.NameColumn.Source.ToString().Split('.')[0].Replace((dim.KeyAttribute.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0] + "_", "");
                    
                }
                else
                {
                    cdDim.sKeyTableName = dim.KeyAttribute.NameColumn.Source.ToString().Split('.')[0];
                    //cdDim.sKeyTableName = cdDim.sKeyTableName.ToString().Split('_')[0];
                    cdDim.sKeySchemaName = "dbo";//Gotta fix this....

                }
                
                if (dim.KeyAttribute.KeyColumns.Count == 1)
                {
                    cdDim.sKeyColumnName = MultiDimensionalReader.FixIDs(dim.KeyAttribute.KeyColumns[0].Source.ToString().Split('.')[1].Replace(" ", "")/*_x0020*/);
                }
                else
                {

                    foreach (Microsoft.AnalysisServices.DataItem di in dim.KeyAttribute.KeyColumns)
                    {
                        cdDim.lstKeyColumnNames.Add(MultiDimensionalReader.FixIDs(di.Source.ToString().Split('.')[1].Replace(" ", "")/*_x0020*/));
                    }

                    /*foreach (System.Data.DataColumn dc in dim.KeyAttribute.KeyColumns)
                    {
                        cdDim.lstKeyColumnNames.Add(dc.ColumnName.ToString());
                    }*/
                }


                if (cdDim.sKeySchemaName == "Microsoft")
                {
                        throw new System.Exception("Error! RowNumber Binding in tabular mode not supported yet.");
                        // cdDim.sKeySchemaName = dim.DataSourceView.Schema.Tables[0].TableName;
                        //A fix for RowNumberBinding stuff
                        //DSV currDSV = cbOriginalCube.lstDSV.Find(item => item.sID == cdDim.sDSVID);
                        //DSVTable dsvt = currDSV.lstDSVTables.Find(item => item.sID == "");
                 
                }
                else if (cdDim.sKeyTableName == "Microsoft")
                {

                    if (!isTabular)
                    {
                        throw new System.Exception("Error! RowNumber Binding in tabular mode not supported yet.");
                        //cdDim.sQueryDefinition = "SELECT * FROM [" + cdDim.sKeySchemaName + "].[" + cdDim.sKeyTableName.Split('_')[0] + "]";

                    }
                    else
                    {
                        cdDim.sQueryDefinition = "SELECT * FROM [" + cdDim.sKeySchemaName + "].[" + cdDim.sName + "]";
                    
                    }
                }
                else
                {


                    if (!isTabular)
                    {
                        cdDim.sQueryDefinition = "SELECT * FROM [" + cdDim.sKeySchemaName + "].[" + cdDim.sKeyTableName + "]";
                    }
                    else
                    {
                        cdDim.sQueryDefinition = "SELECT * FROM [" + cdDim.sKeySchemaName + "].[" + cdDim.sKeyTableName.Split('_')[0] + "]";
                    }
                }
                #endregion

                #region Attributes
                foreach (DimensionAttribute atDim in dim.Attributes)

                {

                    if (!(atDim.ID == "RowNumber" || atDim.Name == "RowNumber" ))
                    {



                        ExtractDimension(dim, ref cdDim, atDim);
                    }
                    //Add the column always. Do a process to shift non-related tables later
                    /*if (cdColumn.sDBTableName == sTableName && cdColumn.sDBSchemaName == sSchemaName)
                    {
                        cdDim.lstDimensionAttributes.Add(cdColumn);
                    }
                    else
                    {
                        /// Put a subsidiary table here
                        string sSubTableName = dim.Name + "_" + atDim.NameColumn.Source.ToString();
                        XMLADimension XD = cmModel.lstDimensions.Find(item => item.sID == sSubTableName);
                        if (XD != null)
                        {
                        }
                        else
                        {
                        }
                     }
                     */

                }
                #endregion
                cdDim.sDataSourceID = dim.DataSource.ID.ToString();

                //Create relationships
                if (isTabularSource)
                {
                    #region Tabular
                    if (cubedim.Dimension.Name == "EventDetails")
                    {
                    }
                    #region MGDimRelationships
                    foreach (MeasureGroupDimension d in srcCube.MeasureGroups.FindByName(cubedim.Dimension.Name).Dimensions)
                    {
                        if (d.GetType() == typeof(ReferenceMeasureGroupDimension))
                        {
                            string sID = ((ReferenceMeasureGroupDimension)d).RelationshipID;
                            Relationship rel = cubedim.Dimension.Relationships.Find(sID);
                            if (rel != null)
                            {
                                cdDim.lstReferenceDimensions.Add(new XMLAReferenceDimension(
                                    rel.ID,
                                    rel.ID,
                                    ((ReferenceMeasureGroupDimension)d).IntermediateCubeDimension.Name.Replace("_", ""),
                                    ((ReferenceMeasureGroupDimension)d).IntermediateGranularityAttributeID,
                                    ((ReferenceMeasureGroupDimension)d).Materialization.ToString()
                                    , colDim.Find(rel.ToRelationshipEnd.DimensionID).Name.Replace(" ", "").Replace("_", "")
                                    , rel.ToRelationshipEnd.Attributes[0].AttributeID
                                    ));
                            }
                            else
                            {
                                string sKeyColumn = d.Dimension.KeyAttribute.KeyColumns[0].Source.ToString().Split('.')[1].Replace(" ", "");
                                if (sKeyColumn.Replace(" ", "") == "AnalysisServices")
                                {
                                    sKeyColumn = "RowNumber";
                                    if (d.Dimension.Name.ToUpper() == "UTCDATE")
                                    {
                                        sKeyColumn = "DateID";//d.Dimension.Attributes[1].Name;
                                    }
                                    else
                                    {
                                    }

                                }
                                cdDim.lstReferenceDimensions.Add(new XMLAReferenceDimension(
                                    d.CubeDimension.Name,
                                    d.CubeDimension.Name,
                                    ((ReferenceMeasureGroupDimension)d).IntermediateCubeDimension.Name,
                                    ((ReferenceMeasureGroupDimension)d).IntermediateGranularityAttributeID,
                                    ((ReferenceMeasureGroupDimension)d).Materialization.ToString()
                                    , d.CubeDimension.Name
                                    , MultiDimensionalReader.FixIDs(sKeyColumn)
                                    ));
                            }

                        }
                        else
                        {
                        }
                    }
                    #endregion

                    #region DimensionRelationships
                    foreach (Relationship rel in cubedim.Dimension.Relationships)
                    {
                        string fromDimName = colDim.Find(rel.FromRelationshipEnd.DimensionID).Name.Replace(" ", "").Replace("_", "");
                        string toDimName = colDim.Find(rel.ToRelationshipEnd.DimensionID).Name.Replace(" ", "").Replace("_", "");
                        //Only works for relationships with a single column each side, i.e. tabular

                        bool bMaterialised = false;
                        bool bReferenced = false;
                        string sIntermediateDimensionID = "";
                        string sIntermediareGranularityID = "";
                        if (fromDimName != "UserSiteBridge")
                        {
                            foreach (MeasureGroupDimension d in srcCube.MeasureGroups.FindByName(fromDimName).Dimensions)
                            {
                                if (d.Dimension.Name == toDimName)
                                {

                                    bReferenced = true;
                                    if (((ReferenceMeasureGroupDimension)d).Materialization == ReferenceDimensionMaterialization.Regular)
                                    {
                                        bMaterialised = true;
                                    }
                                    sIntermediateDimensionID = ((ReferenceMeasureGroupDimension)d).IntermediateCubeDimension.Name;
                                    sIntermediareGranularityID = ((ReferenceMeasureGroupDimension)d).IntermediateGranularityAttributeID;

                                    break;
                                }
                            }
                        }

                        //if (srcCube.MeasureGroups.IndexOfName(toDimName) > 0)
                        //if (!rel.Visible)
                        if (bReferenced)
                        {
                            cdDim.lstRelationships.Add(new XMLARelationship(rel.ID, fromDimName, rel.FromRelationshipEnd.Attributes[0].AttributeID, toDimName, rel.ToRelationshipEnd.Attributes[0].AttributeID, bReferenced, bMaterialised, sIntermediateDimensionID, sIntermediareGranularityID));
                        }
                        else
                        {
                            cdDim.lstRelationships.Add(new XMLARelationship(rel.ID, fromDimName, rel.FromRelationshipEnd.Attributes[0].AttributeID, toDimName, rel.ToRelationshipEnd.Attributes[0].AttributeID));
                        }

                    }
                    #endregion

                    #endregion
                }
                else
                {
                    //need to do MDM relationships
                    //These will be based on the relationships in the DSV so need to be done after that
                }

                //Extract hierarchies
                #region Hierarchies
                foreach ( Hierarchy srcHier in cubedim.Dimension.Hierarchies) 
                {
                    ///TODO: A neater version of this would be good.
                    XMLADimensionHierarchy xHier = new XMLADimensionHierarchy(srcHier.ID + new Guid().ToString(), srcHier.Name + " hier");
                    foreach ( Level srcLevel in srcHier.Levels) 
                    {
                        if (srcLevel.SourceAttributeID.Replace(" ", "").Contains("TimesheetDetailDateID") || srcLevel.ID.Replace(" ", "").Contains("TimesheetDetailDateID"))
                        {
                            int ii = 1;
                        }
                        string srcAttribute;
                        if (srcLevel.SourceAttributeID.Length >= 16 && srcLevel.SourceAttributeID.Substring(0, 16) == "CalculatedColumn")
                        {
                            srcAttribute = srcLevel.SourceAttribute.ID;                           
                            //xHier.lstLevels.Add(new XMLADimensionHierarchyLevel(srcLevel.ID.Replace(" ", ""), srcLevel.Name, srcLevel.SourceAttribute.ID));                        
                        }
                        else
                        {
                            //Removing 
                            srcAttribute = srcLevel.SourceAttributeID;
                            //xHier.lstLevels.Add(new XMLADimensionHierarchyLevel(srcLevel.ID.Replace(" ", ""), srcLevel.Name, srcLevel.SourceAttributeID));
                        }
                        //Here we strip out any trailing digits that SSAS has added for us
                        int result;
                        if (Int32.TryParse(((srcAttribute.Split(' ').Reverse().ToArray())[0]), out result))
                        {
                            srcAttribute = srcAttribute.Replace(result.ToString(), "").Replace(" ", "");
                        }
                        xHier.lstLevels.Add(new XMLADimensionHierarchyLevel(srcLevel.ID.Replace(" ", ""), srcLevel.Name, srcAttribute));
                         
                            
                    }
                    cdDim.lstHierarchies.Add( xHier );
                }

                #endregion
                cmModel.lstDimensions.Add(cdDim);
            }
        }

        private void ExtractDimension(Dimension dim, ref XMLADimension cdDim, DimensionAttribute atDim)
        {
            
            XMLADimensionAttribute cdColumn = new XMLADimensionAttribute();
            if (atDim.Name.Length >= 6 && atDim.Name.Substring(0, 6) == "Client")
            {
                int dd = 5;
            }
            if (atDim.NameColumn.Source.ToString().Split('.')[0].ToString().IndexOf("_") > 0)
            {
                cdColumn.sDBTableName = (atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[1];
                cdColumn.sDBSchemaName = (atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0];
            }
            else
            {
                cdColumn.sDBTableName = (atDim.NameColumn.Source.ToString().Split('.')[0]);
                    cdColumn.sDBSchemaName = "dbo";

            }
            if (cdColumn.sDBTableName.Contains("Project"))
            {
                int id = 1;
                if (cdColumn.sDBTableName.Contains("DimProject"))
                {
                    int ip = 1;
                }
                else
                {
                    int ip = 1;
                }
            }
            if (cdColumn.sDBTableName != cdDim.sKeyTableName)
            {
                int ii = 1;
                //if (cdDim.sKeyTableName.Contains("Project"))
                cdColumn.boolRelated = true;
                cdColumn.sExpression = "";

            }
            else
            {
                cdColumn.boolRelated = false;
            }

            if (dim.Name.Replace(" ", "").Replace("_", "").Contains("DimProject"))
            {
                int ip = 1;
            }
                        
            cdColumn.sDimensionName = dim.Name.Replace(" ", "").Replace("_", "")/*x0020*/;
            //cdColumn.sDimensionID = dim.ID.Replace(" ", "").Replace("_", "")/*x0020*/;
            cdColumn.sDimensionID = dim.Name.Replace(" ", "").Replace("_", "")/*x0020*/;
            cdColumn.sName = MultiDimensionalReader.FixIDs(atDim.Name.Replace(" ", "")/*_x0020*/);

            cdColumn.sID = atDim.Name.Replace(" ","");
            ///TODO: Double cehck typing of name vs key
            if (MultiDimensionalReader.FixIDs(atDim.NameColumn.Source.ToString().Split('.')[1]).Replace("_", "")
                ==
                MultiDimensionalReader.FixIDs(atDim.KeyColumns[0].Source.ToString().Split('.')[1]).Replace("_", "")
                )
            {
                cdColumn.sDataSize = atDim.KeyColumns[0].DataSize.ToString();
                cdColumn.sDataType = atDim.KeyColumns[0].DataType.ToString();
            }
            else
            {
                cdColumn.sDataSize = atDim.NameColumn.DataSize.ToString();
                cdColumn.sDataType = atDim.NameColumn.DataType.ToString();
            }
            //cdColumn.sDataType = atDim.NameColumn.DataType.ToString();
            cdColumn.sDBColumnName = MultiDimensionalReader.FixIDs(atDim.NameColumn.Source.ToString().Split('.')[1]).Replace("_", "");
            cdColumn.boolVisible = atDim.AttributeHierarchyVisible;

            
            string colName = atDim.NameColumn.Source.ToString().Split('.')[1];
            CreateNewDimensionAttribute(ref cdDim, cdColumn, colName);

            
            for (int iLoop = 0; iLoop < atDim.KeyColumns.Count; iLoop++)
            {
                if (MultiDimensionalReader.FixIDs(atDim.KeyColumns[iLoop].Source.ToString().Split('.')[1]).Replace("_", "") != colName)
                {


                    string keyName = MultiDimensionalReader.FixIDs(atDim.KeyColumns[iLoop].Source.ToString().Split('.')[1]).Replace("_", "");


                    string keyDim = "";
                    if (atDim.KeyColumns[iLoop].Source.ToString().Split('.')[0].ToString().IndexOf("_") > 0)
                    {
                        keyDim = MultiDimensionalReader.FixIDs(atDim.KeyColumns[iLoop].Source.ToString().Split('.')[0]).Split('_')[1];
                    }
                    else
                    {
                        keyDim = MultiDimensionalReader.FixIDs(atDim.KeyColumns[iLoop].Source.ToString()).Replace(keyName, "");
                    }


                    if (keyDim != cdDim.sID && keyDim == cdDim.sKeyTableName)
                    {
                        keyDim = cdDim.sID;
                    }
                    if (keyName.Substring(0, 6) == "Client")
                    {
                        int x = 8;
                    }
                    cdColumn = new XMLADimensionAttribute();
                    cdColumn.sDBTableName = (atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[1];
                    cdColumn.sDBSchemaName = (atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0];
                    if (cdColumn.sDBTableName.Contains("Project"))
                    {
                        int id = 1;
                        if (cdColumn.sDBTableName.Contains("DimProject"))
                        {
                            int ip = 1;
                        }
                    }
            

                    if (keyName.Replace(" ", "").Replace("_", "").Contains("TimesheetDetailID") || keyDim.Replace(" ", "").Replace("_", "").Contains("TimesheetDetailID"))
                    {
                        int ip = 1;
                    }

                    //MGS 2013//12/18
                    //Adding this to it's own table hopefully. Snowflake code should then pick it up
                    //cdColumn.sDimensionName = keyName.Replace(" ", "").Replace("_", "")/*x0020*/;
                    cdColumn.sDimensionName = keyDim.Replace(" ", "").Replace("_", "")/*x0020*/;
                    //cdColumn.sDimensionID = dim.ID.Replace(" ", "").Replace("_", "")/*x0020*/;
                    //cdColumn.sDimensionID = keyName.Replace(" ", "").Replace("_", "")/*x0020*/;
                    cdColumn.sDimensionID = keyDim.Replace(" ", "").Replace("_", "")/*x0020*/;

                    

                    if (cdColumn.sDimensionID != cdDim.sID)
                    {
                        cdColumn.boolRelated = true;
                    }

                    if (cdColumn.sDimensionID.Contains("DimProject"))
                    {
                        int ip = 1;
                    }
                    
                    
                    cdColumn.sName = MultiDimensionalReader.FixIDs(keyName.Replace(" ", "")/*_x0020*/);

                    cdColumn.sID = keyName;
                    cdColumn.sDataSize = atDim.KeyColumns[0].DataSize.ToString();
                    cdColumn.sDataType = atDim.KeyColumns[0].DataType.ToString();
                    //cdColumn.sDataType = atDim.NameColumn.DataType.ToString();
                    cdColumn.sDBColumnName = keyName;
                    cdColumn.boolVisible = false;

                    //keyName = atDim.NameColumn.Source.ToString().Split('.')[0];



                    CreateNewDimensionAttribute(ref cdDim, cdColumn, atDim.KeyColumns[iLoop].Source.ToString().Split('.')[0]);
                }
            }
        }

        private void CreateNewDimensionAttribute(ref XMLADimension cdDim, XMLADimensionAttribute cdColumn, string colName)
        {
            
            /*if (!cdColumn.boolVisible)
            {
                ///TODO: Non-visible dimension keys
                if (colName.Split('_').Count() > 1)
                {
                    cdColumn.sDBTableName = colName.Split('_')[0];
                    cdColumn.sDBSchemaName = colName.Replace((colName).Split('_')[0] + "_", "");
                }
                else
                {
                    cdColumn.sDBTableName = tableName;
                    cdColumn.sDBSchemaName = "dbo";//Gotta fix this....
                }

                

            }
            if (!isTabular)
            {
                cdColumn.sDBSchemaName = (colName).Split('_')[0];
                cdColumn.sDBTableName = colName.Replace((colName).Split('_')[0] + "_", "");
            }
            else
            {
                ///TODO: test Schema fix
                //cdColumn.sDBTableName = colName;
                //cdColumn.sDBSchemaName = "dbo";//Gotta fix this....*
                 
                if (colName.Split('_').Count() > 0)
                {
                    cdColumn.sDBTableName = colName.Split('_')[0];
                    cdColumn.sDBTableName = colName.Replace((colName).Split('_')[0] + "_", "");
                }
                else
                {
                    cdColumn.sDBTableName = colName;
                    cdColumn.sDBSchemaName = "dbo";//Gotta fix this....
                }

            
            }*/



            if (cdColumn.sDBTableName != cdDim.sKeyTableName)
            {
                int ii = 1;
                //if (cdDim.sKeyTableName.Contains("Project"))
                if (cdColumn.sName.Contains("ProjectName"))
                {
                    int ik = 1;
                }
                cdColumn.boolRelated = true;
                cdColumn.sExpression = "";

            }
            else
            {
                cdColumn.boolRelated = false;
            }


            if (cdColumn.sDBTableName != "Microsoft" || isTabularSource == true)
            {

                if (isTabularSource && cdColumn.sDBTableName == "Microsoft")
                {
                    //Need to add this to the DSV as this *was* an internal field, and now isn't
                    //cbOriginalCube.lstDSV.Find( item => item.sName == cdColumn.sDimensionName).lstDSVTables
                    //MiX specific hardcoding.
                    if (cdColumn.sName.Contains("Score"))
                    {
                        cdColumn.sDataType = "Double";
                    }
                    else
                    {
                        cdColumn.sDataType = "WChar";
                        cdColumn.sDataSize = "-1";
                    }
                    cdColumn.bMicrosoft = true;
                }

                if (!cdDim.lstDimensionAttributes.Exists(item => item.sID == cdColumn.sID))
                {
                    cdDim.lstDimensionAttributes.Add(cdColumn);
                }
                else
                {
                    int iLoop = 1; //This attribute exists
                }
            }
        }


        private void ExtractMeasureGroups(Cube srcCube, XMLAModel cmModel)
        {

            List<XMLAMDXCommand> lstCommands = new List<XMLAMDXCommand>();
            if (srcCube.MdxScripts[0].Commands.Count > 0)
            {
                cmModel.mdxScript.Commands.Add( srcCube.MdxScripts[0].Commands[0].Text);
                lstCommands = ExtractMeasureCommandsList(srcCube.MdxScripts[0].Commands[0].Text);
                cmModel.lstMDXCommands = lstCommands;
            }

            #region Tabular 
            if (isTabular == true)
            {
                cmModel.sPowerPivotMDXCommand = @"----------------------------------------------------------
-- PowerPivot measures command (do not modify manually) --
----------------------------------------------------------
";
                cmModel.mdxScript.Commands.Add(srcCube.MdxScripts[0].Commands[1].Text.Replace("\t", ""));
                cmModel.sPowerPivotMDXCommand += ExtractMeasureCommands(srcCube.MdxScripts[0].Commands[1].Text);
                ;
                    /*

                cmModel.sPowerPivotMDXCommand +=
                    srcCube.MdxScripts[0].Commands[1].Text.Substring(
                        srcCube.MdxScripts[0].Commands[1].Text.IndexOf("CREATE")
                        , srcCube.MdxScripts[0].Commands[1].Text.Length - srcCube.MdxScripts[0].Commands[1].Text.IndexOf("CREATE")
                        ).Replace("\t", "").Replace(
@"----------------------------------------------------------
-- PowerPivot measures command (do not modify manually) --
----------------------------------------------------------","");
                    */
                
                //cmModel.sPowerPivotMDXCommand = srcCube.MdxScripts[0].Commands[1].Text.Replace("\t",""); ;
                for (int i = 2; i < srcCube.MdxScripts[0].Commands.Count; i++)
                {
                    cmModel.mdxScript.Commands.Add(srcCube.MdxScripts[0].Commands[i].Text);
                    cmModel.sPowerPivotMDXCommand += ExtractMeasureCommands(srcCube.MdxScripts[0].Commands[i].Text);                
                }
                //Now do the calculation properties
                //This one is tabular specific
                foreach ( CalculationProperty calcProp in srcCube.MdxScripts[0].CalculationProperties) 
                //for (int iCalc = 0; iCalc < srcCube.MdxScripts[0].CalculationProperties.Count; iCalc++)
                {
                    cmModel.mdxScript.CalcProps.Add( new MDXScriptCalcProp( calcProp.CalculationReference ,calcProp.CalculationType.ToString(), calcProp.FormatString));
                }

                //Now, DR for measures with no properties.
                string section = cmModel.sPowerPivotMDXCommand;
                string Calc = "";
                string[] split = new string[]{"\nCREATE "};
                string[] measures = section.Split(split,StringSplitOptions.RemoveEmptyEntries);
                foreach (string measure in measures)
                {
                    if (measure.IndexOf("[") > 0) {
                    Calc = measure.Substring(
                            measure.IndexOf("[")
                            , (measure.IndexOf("]")) - (measure.IndexOf("[")) + 1
                            );
                    if (!cmModel.mdxScript.CalcProps.Exists(item => item.sID == Calc))
                    {
                        cmModel.mdxScript.CalcProps.Add(new MDXScriptCalcProp(Calc));
                    }
                        }
                }
                /*while (section.IndexOf("CREATE") > -1)
                {
                    section = section.Substring(
                        section.IndexOf("CREATE") + 6 
                        , section.Length - (section.IndexOf("CREATE") + 6)
                        );
                    Calc = section.Substring(
                            section.IndexOf("[") 
                            , (section.IndexOf("]") ) - (section.IndexOf("[")) + 1
                            );
                    if (! cmModel.mdxScript.CalcProps.Exists( item => item.sID == Calc) )
                    {
                        cmModel.mdxScript.CalcProps.Add(new MDXScriptCalcProp(Calc));
                    }
                }*/


            }
#endregion
            foreach (MeasureGroup srcMG in srcCube.MeasureGroups)
            {
                #region MG Basics
                XMLAMeasureGroup xMG  = new XMLAMeasureGroup();
                xMG.sDescription = srcMG.Description;
                xMG.sID = srcMG.ID.Replace(" ", "").Replace("_", "")/*x0020*/;
                xMG.sName = srcMG.Name.Replace(" ", "").Replace("_", "")/*x0020*/;

                //Measure groups have to come from same DSV?
                //xMG.sDSVID = srcMG.Dimensions[0].Dimension.DataSourceView.ID.ToString().Replace(" ", "");
                xMG.sDSVID = srcMG.Dimensions[0].Dimension.DataSourceView.ID.ToString();
                xMG.sProcessingMode = srcMG.ProcessingMode.ToString();

                if (srcMG.StorageLocation != null)
                {
                    xMG.sStorageLocation = srcMG.StorageLocation.ToString();
                }
                #endregion
                //Copy all the measures
                foreach (Measure srcMeasure in srcMG.Measures)
                {
                    #region CopyMeasure
                    XMLAMeasure xMeasure = new XMLAMeasure();
                    //xMeasure.sID = srcMeasure.ID;
                    xMeasure.sID = srcMeasure.Name; //Doing this because renamed measures keep their old ID
                    xMeasure.sName = srcMeasure.Name;
                    xMeasure.boolVisible = srcMeasure.Visible;
                    
                   // xMeasure.sAnnotations = srcMeasure.Annotations.ToString();
                    //Work out if we need them
                    xMeasure.sDataType = srcMeasure.DataType.ToString();
                    xMeasure.sDataSize = "-1";
                    xMeasure.sFormatString = srcMeasure.FormatString;
                    xMeasure.sDisplayFolder = srcMeasure.DisplayFolder;
                    xMeasure.sAggregationFunction = srcMeasure.AggregateFunction.ToString();
                    
                    xMeasure.sMeasureExpression = srcMeasure.MeasureExpression;
                    if (xMeasure.sMeasureExpression != null)
                    {
                    }
                    if (xMeasure.boolVisible && xMeasure.sAggregationFunction != "Count")
                    {
                    }
                    if (srcMeasure.Source.ToString().Split('.').Count(item => 1 == 1) > 1)
                    {
                        xMeasure.sDBSchemaName = (srcMeasure.Source.ToString().Split('.')[0]).Split('_')[0];
                        xMeasure.sDBTableName = srcMeasure.Source.ToString().Split('.')[0].Replace((srcMeasure.Source.ToString().Split('.')[0]).Split('_')[0] + "_", "");
                        xMeasure.sDBColumnName = MultiDimensionalReader.FixIDs(srcMeasure.Source.ToString().Split('.')[1]).Replace("_", "");
                        xMeasure.sAttributeName = xMeasure.sDBColumnName;
                        if (xMeasure.sDBColumnName.Length == 0 || xMeasure.sDBColumnName == null || xMeasure.sDBColumnName == "")
                        {
                        }

                    }
                    else
                    {
                        if (xMeasure.sAggregationFunction != "Count")
                        {
                            ///Counts seem to be fine

                        }
                        if (xMeasure.boolVisible)
                        {
                        }
                        //xMeasure.sDBTableName 
                    }

                    if (cmModel.lstDimensions.Exists(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName))
                    {
                        xMeasure.sDimensionID = cmModel.lstDimensions.Find(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName)
                            .sID;
                        xMeasure.sDimensionName = cmModel.lstDimensions.Find(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName)
                                                    .sName;

                        

                    }
                    else
                    {
                        ///Here be dragons
                        ///Soooo..
                        if (xMeasure.sAggregationFunction != "Count")
                        {
                            ///Counts seem to be fine
                        
                        }
                    }


                    #endregion
                    xMG.lstMeasures.Add(xMeasure);
                }


                //Copy all the partitions

                foreach (Partition srcPartition in srcMG.Partitions)
                {
                    #region Copy Partition
                    XMLAPartitions xPartition = new XMLAPartitions();
                    xPartition.sID = srcPartition.ID;
                    xPartition.sName = srcPartition.Name.Replace(" ", "").Replace("_", "")/*x0020*/;
                    if (srcPartition.Source.GetType().Name == "DsvTableBinding")
                    {
                        xPartition.boolTableBinding = true;
                        xPartition.sDSVID = ((Microsoft.AnalysisServices.DsvTableBinding)srcPartition.Source).DataSourceViewID;
                        xPartition.sTableID = ((Microsoft.AnalysisServices.DsvTableBinding)srcPartition.Source).TableID.Replace(" ", "").Replace("_", "")/*_x0020*/;

                        //Only partition, table bound
                    }
                    else if (srcPartition.Source.GetType().Name == "QueryBinding")
                    {
                        xPartition.boolTableBinding = false;
                        xPartition.sQueryDefinition = ((Microsoft.AnalysisServices.QueryBinding)srcPartition.Source).QueryDefinition;
                        xPartition.sDataSourceID = ((Microsoft.AnalysisServices.QueryBinding)srcPartition.Source).DataSourceID;
                    }
                    #endregion
                    xMG.lstPartitions.Add(xPartition);
                }


                //Copy all the dimensions
                //Only truly need the Id and relationship as the dimensions are up at cube level
                foreach (MeasureGroupDimension srcMGDim in srcMG.Dimensions)
                {
                    XMLAMGDimension xMGDim = new XMLAMGDimension();
                    xMGDim.sDimensionID = srcMGDim.CubeDimensionID; 
                
                    //srcDim.Relationships 
                }

                cmModel.lstMeasureGroups.Add(xMG);
            }

        }

        private static string ExtractMeasureCommands(string sParm)
        {
            string sCommand = "";
            string[] measures = sParm.Split(
new string[] { "CREATE MEASURE" }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string measure in measures)
            {
                if (measure.IndexOf("[") > -1)
                {
                    sCommand += "CREATE MEASURE" + measure.Substring(0, measure.IndexOf(";") + 1) + "\n";
                }
            }
            return sCommand;
        }

        private static List<XMLAMDXCommand> ExtractMeasureCommandsList(string sParm)
        {
            string sCommand = "";
            string sTable = "";
            string sName = "";
            string sMG = "";
            List<XMLAMDXCommand> dCommands = new List<XMLAMDXCommand>();
            string[] measures = sParm.Split(
new string[] { "CREATE MEMBER CURRENTCUBE." }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string measure in measures)
            {
                if (measure.IndexOf("[") > -1)
                {
                    
                    sCommand = measure.Substring(0, measure.IndexOf(";") + 1).Replace("\n", "\n") + "\n";
                    if (!sCommand.StartsWith("/*")) //Skip the comment
                    {
                        string[] component = sCommand.Split(']');
                        sTable = component[0].Replace("[", "");
                        sName = component[1].Replace("[", "").Replace(".", "");
                        component = sCommand.Split(
                        new string[] { " AS " }, StringSplitOptions.RemoveEmptyEntries);
                        sCommand = component[1];
                        component = sCommand.Split(
                        new string[] { "FORMAT_STRING" }, StringSplitOptions.RemoveEmptyEntries);
                        if (component.Length > 1)
                        {
                            sCommand = component[0].Trim();
                            sMG = ((component[1].Split(
                                new string[] { "ASSOCIATED_MEASURE_GROUP = " }, StringSplitOptions.RemoveEmptyEntries)
                                )[1]).Replace(@"'", "").Replace(";", "");
                        }
                        else
                        {
                            component = sCommand.Split(
                                new string[] { "VISIBLE" }, StringSplitOptions.RemoveEmptyEntries);
                            sCommand = component[0].Trim();
                            sMG = ((component[1].Split(
                                new string[] { "ASSOCIATED_MEASURE_GROUP = " }, StringSplitOptions.RemoveEmptyEntries)
                                )[1]).Replace(@"'", "").Replace(";", "");
                        
                        }

                        sCommand = sCommand.Substring(0, sCommand.Length - 1);
                        dCommands.Add(new XMLAMDXCommand(sTable, sName, sCommand, sMG));

                    }
                }
            }
            return dCommands;
        }

    }
}
