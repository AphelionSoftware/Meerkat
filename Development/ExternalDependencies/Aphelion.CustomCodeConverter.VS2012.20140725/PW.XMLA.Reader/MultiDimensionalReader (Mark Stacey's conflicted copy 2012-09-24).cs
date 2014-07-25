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
        public string connSrcConnection = @"Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source=.\sql2k8r2;Initial Catalog=TimesheetsCube";
        public string sSrcDBName = "Timesheets";
        public bool isTabular = false;
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
                    dsvT.sName = srcDT.TableName;

                    dsvT.sTableName = srcDT.ExtendedProperties["DbTableName"].ToString();
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
                        DSVColumn dsvC = new DSVColumn();
                        dsvC.sName = srcDC.ColumnName;
                        dsvC.sID = srcDC.ColumnName;
                        dsvC.sDBColumnName = srcDC.ExtendedProperties["DbColumnName"].ToString();
                        if (srcDC.ExtendedProperties["FriendlyName"] != null)
                        {
                            dsvC.sFriendlyName = srcDC.ExtendedProperties["FriendlyName"].ToString();
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
                    }

                    //Add all the relationships
                    foreach (System.Data.DataRelation relDSV in srcDT.ChildRelations)
                    {
                        DSVRelationship dsvrRelation = new DSVRelationship();
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
            foreach (CubeDimension cubedim in srcCube.Dimensions)
            {

                Dimension dim = cubedim.Dimension;
                XMLADimension cdDim = new XMLADimension();
                cdDim.sName = dim.Name;
                cdDim.sID = dim.ID;
                cdDim.boolIsParentChild = cubedim.Dimension.IsParentChild;
                cdDim.sDSVID = dim.DataSourceView.ID.ToString().Replace(" ", "");
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
                    cdDim.sKeyColumnName = dim.KeyAttribute.KeyColumns[0].Source.ToString().Split('.')[1];
                }
                else
                {
                    foreach (System.Data.DataColumn dc in dim.KeyAttribute.KeyColumns)
                    {
                        cdDim.lstKeyColumnNames.Add(dc.ColumnName.ToString());
                    }
                }


                if (cdDim.sKeySchemaName == "Microsoft")
                {
                    throw new System.Exception("Error! RowNumber Binding in tabular mode not supported yet.");
                   // cdDim.sKeySchemaName = dim.DataSourceView.Schema.Tables[0].TableName;
                    //A fix for RowNumberBinding stuff
                    DSV currDSV = cbOriginalCube.lstDSV.Find(item => item.sID == cdDim.sDSVID);
                    //DSVTable dsvt = currDSV.lstDSVTables.Find(item => item.sID == "");
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
                foreach (DimensionAttribute atDim in dim.Attributes)

                {

                    if (!(atDim.ID == "RowNumber" || atDim.Name == "RowNumber" ))
                    {
                        
                    
                        XMLADimensionAttribute cdColumn = new XMLADimensionAttribute();

                        cdColumn.sName = atDim.Name;
                        cdColumn.sID = atDim.ID;
                        cdColumn.sDataSize = atDim.NameColumn.DataSize.ToString();
                        cdColumn.sDataType = atDim.NameColumn.DataType.ToString();
                        cdColumn.sDBColumnName = atDim.NameColumn.Source.ToString().Split('.')[1];

                        if (!isTabular)
                        {
                            cdColumn.sDBSchemaName = (atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0];
                            cdColumn.sDBTableName = atDim.NameColumn.Source.ToString().Split('.')[0].Replace((atDim.NameColumn.Source.ToString().Split('.')[0]).Split('_')[0] + "_", "");
                        }
                        else
                        {
                            cdColumn.sDBTableName = atDim.NameColumn.Source.ToString().Split('.')[0];
                            cdColumn.sDBSchemaName = "dbo";//Gotta fix this....

                        }
                        if (cdColumn.sDBTableName != "Microsoft")
                        {
                            cdDim.lstDimensionAttributes.Add(cdColumn);
                        }
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
                cdDim.sDataSourceID = dim.DataSource.ID.ToString();

                cmModel.lstDimensions.Add(cdDim);
            }
        }


        private void ExtractMeasureGroups(Cube srcCube, XMLAModel cmModel)
        {
            foreach (MeasureGroup srcMG in srcCube.MeasureGroups)
            {
                XMLAMeasureGroup xMG  = new XMLAMeasureGroup();
                xMG.sDescription = srcMG.Description;
                xMG.sID =  srcMG.ID;
                xMG.sName = srcMG.Name;


                xMG.sProcessingMode = srcMG.ProcessingMode.ToString();

                if (srcMG.StorageLocation != null)
                {
                    xMG.sStorageLocation = srcMG.StorageLocation.ToString();
                }
                //Copy all the measures
                foreach (Measure srcMeasure in srcMG.Measures)
                {
                    XMLAMeasure xMeasure = new XMLAMeasure();
                    xMeasure.sID = srcMeasure.ID;
                    xMeasure.sName = srcMeasure.Name;
                   // xMeasure.sAnnotations = srcMeasure.Annotations.ToString();
                    //Work out if we need them
                    xMeasure.sDataType = srcMeasure.DataType.ToString();
                    xMeasure.sDataSize = "-1";
                    xMG.lstMeasures.Add(xMeasure);
                }


                //Copy all the partitions

                foreach (Partition srcPartition in srcMG.Partitions)
                {
                    XMLAPartitions xPartition = new XMLAPartitions();
                    xPartition.sID = srcPartition.ID;
                    xPartition.sName = srcPartition.Name;
                    if (srcPartition.Source.GetType().Name == "DsvTableBinding")
                    {
                        xPartition.boolTableBinding = true;
                        xPartition.sDSVID = ((Microsoft.AnalysisServices.DsvTableBinding)srcPartition.Source).DataSourceViewID;
                        xPartition.sTableID = ((Microsoft.AnalysisServices.DsvTableBinding)srcPartition.Source).TableID;

                        //Only partition, table bound
                    }
                    else if (srcPartition.Source.GetType().Name == "QueryBinding")
                    {
                        xPartition.boolTableBinding = false;
                        xPartition.sQueryDefinition = ((Microsoft.AnalysisServices.QueryBinding)srcPartition.Source).QueryDefinition;
                        xPartition.sDataSourceID = ((Microsoft.AnalysisServices.QueryBinding)srcPartition.Source).DataSourceID;
                    }
                }


                //Copy all the dimensions
                //Only truly need the Id and relationship as the dimensions are up at cube level
                foreach (MeasureGroupDimension srcMGDim in srcMG.Dimensions)
                {
                    XMLAMGDimension xMGDim = new XMLAMGDimension();
                    xMGDim.sDimensionID = srcMGDim.CubeDimensionID; 
                
                    //srcDim.Relationships 
                }
            }

        }

    }
}
