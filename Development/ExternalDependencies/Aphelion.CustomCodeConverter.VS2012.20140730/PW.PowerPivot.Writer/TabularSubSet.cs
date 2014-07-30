using System;
using System.Collections.Generic;
using System.Text;
using PW.XMLA.Reader;
using PW.XMLA.Reader.XMLAPropertyClasses;
using PW.XMLA.Writer;
namespace PW.PowerPivot.Writer
{
    public class TabularSubSet
    {
        public PW.XMLA.Reader.MultiDimensionalReader xmlaReader = null;
        public PW.XMLA.Writer.TabularXMLAWriter xmlaWriter = null;

        public string sFilterTable ;
        public string sFilterColumn;
        public string sFilterColumnType;

        public string sFilterValue;
        public string sFilterCondition = " >= ";
        bool boolProcessAdd = false;
        bool boolFilter = false;
        public List<string> sOnlyTable = new List<string>();
        public List<string> sProcessAddTable = new List<string>();



        public TabularSubSet()
        {

        }

        /// <summary>
        /// Only used for deletions
        /// </summary>
        /// <param name="pServer"></param>
        /// <param name="pDBName"></param>
        public TabularSubSet(string pServer, string pDBName, string pOrginalDB)
        {
            xmlaWriter = new TabularXMLAWriter();
            xmlaWriter.isTabularSource = true;
            xmlaWriter.sDBName = pDBName;
            xmlaWriter.connDestConnection = string.Format("Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1}", pServer, pOrginalDB);
            
        }

        public void CreateTabular(string pServer, string pDBName, string pOrginalDB) 
        {
            /*sOnlyTable.Add("EventDetails");
            sOnlyTable.Add("ActivityDetails");
            sOnlyTable.Add("UtcDate");*/
            /*sOnlyTable.Add("Drivers");
            sOnlyTable.Add("Vehicles");
            sOnlyTable.Add("ActivityDetails");
            sOnlyTable.Add("ActivityDetailsExclusion");
            sOnlyTable.Add("Dates");
            sOnlyTable.Add("EventDescriptions");
            sOnlyTable.Add("EventDetails");
            sOnlyTable.Add("EventRoadspeedLimits");
            sOnlyTable.Add("ExclusionReasons");
            sOnlyTable.Add("FuelCapture");
            sOnlyTable.Add("Geography");
            sOnlyTable.Add("GeoLocation");
            sOnlyTable.Add("LocalTime");
            sOnlyTable.Add("MeasureUnits");
            sOnlyTable.Add("Organisation");
            sOnlyTable.Add("OrganisationHierarchy");
            sOnlyTable.Add("PassengerActivities");
            sOnlyTable.Add("ReportingGroups");
            sOnlyTable.Add("Shape");
            sOnlyTable.Add("ShapeVisits");
            sOnlyTable.Add("SimpleScoreCriteria");
            sOnlyTable.Add("SimpleScoreDetails");
            sOnlyTable.Add("Sites");
            sOnlyTable.Add("TableColumnLookups");
            sOnlyTable.Add("Trailers");
            sOnlyTable.Add("Users");
            sOnlyTable.Add("UserSiteBridge");
            sOnlyTable.Add("UtcDate");
            sOnlyTable.Add("UTCTime");
            sOnlyTable.Add("VehicleExclusion");*/

            if (xmlaReader == null) throw new Exception("Reader is not set");
            xmlaWriter = new TabularXMLAWriter();
            xmlaWriter.isTabularSource = true;
            xmlaWriter.sDBName = pDBName;
            xmlaWriter.sCubeName = "Model";
            xmlaWriter.connDestConnection = string.Format("Provider=MSOLAP.4;Integrated Security=SSPI;Persist Security Info=True;Data Source={0};Initial Catalog={1}", pServer, pOrginalDB);
            xmlaWriter.srcCubeReader = new MultiDimensionalReader();

            //xmlaWriter.srcCubeReader.cbOriginalCube.lstDSV.Add( new DSV("Sandbox","Sandbox","OriginalCube") );

            
            DSV destDSV = new DSV("Sandbox", "Sandbox", "CubeSource");
            xmlaWriter.srcCubeReader.isTabular = true;
            xmlaWriter.srcCubeReader.isTabularSource = true;
            xmlaWriter.srcCubeReader.connSrcConnection = xmlaWriter.connDestConnection;
            xmlaWriter.srcCubeReader.sSrcDBName = pDBName;
            //xmlaWriter.srcCubeReader.cbOriginalCube.lstCubeModels
            //xmlaWriter.srcCubeReader.cbOriginalCube.lstDataSources

            XMLADataSource xDS = new XMLADataSource("CubeSource", "CubeSource", xmlaWriter.connDestConnection, "", "Default", "", "", "");
            xmlaWriter.srcCubeReader.cbOriginalCube.lstDataSources.Add(xDS);
            

            XMLAModel destModel = new XMLAModel("Model", "Model");
            //Only expecting 1....
            
            foreach (XMLAModel xModel in xmlaReader.cbOriginalCube.lstCubeModels)
            {
                destModel.sPowerPivotMDXCommand = xModel.sPowerPivotMDXCommand;
                destModel.mdxScript = xModel.mdxScript;
                #region dimensions

                List<XMLARelationship> lstXRel = new List<XMLARelationship>();
                foreach (XMLADimension dim in xModel.lstDimensions)
                {
                    foreach (XMLARelationship xRel in dim.lstRelationships)
                    {
                        lstXRel.Add(xRel);
                    }
                }
                boolProcessAdd = false;
                foreach (XMLADimension dim in xModel.lstDimensions)
                {
                    //Skip any tables not listed in array, unless it's empty
                    if (((sOnlyTable.Count > 0 && (sOnlyTable.IndexOf(dim.sName) == -1))) 
                            )
                    {
                        continue;
                    }

                    //Also mark any tables that we will be doing process adds to later
                    if (sProcessAddTable.IndexOf(dim.sName) != -1)
                    {
                        boolProcessAdd = true;
                    }
                        

                    XMLADimension destDim = new XMLADimension(dim.sName, dim.sName, "CubeSource", "Sandbox", dim.sName);
                    foreach (XMLADimensionAttribute dimAtt in dim.lstDimensionAttributes)
                    {
                        if (dim.sName == "RowNumber")
                        {
                            continue;
                        }
                        //Need to reset the source (DB) names to the new ones, i.e. the source column name is the same as the column name
                        XMLADimensionAttribute destAtt = new XMLADimensionAttribute(dimAtt.sName + "|", dimAtt.sName + "|", dimAtt.sName + "|", dim.sName , "", dimAtt.sAttributeName + "|", dimAtt.sDataType, dimAtt.sDataSize, dimAtt.sDimensionName, dimAtt.sDimensionName);
                        destAtt.boolVisible = dimAtt.boolVisible;
                        if (lstXRel.Exists(item => item.toColumn == dimAtt.sName
                                                    && item.toTable == dim.sName))
                        {
                            destAtt.sCardinality = "One";
                            destAtt.sNullProcessing = "Error";
                        }

                        destDim.lstDimensionAttributes.Add(destAtt);
                    }
                    destDim.lstRelationships = dim.lstRelationships;
                    destDim.lstReferenceDimensions = dim.lstReferenceDimensions;
                    destDim.lstHierarchies = dim.lstHierarchies;
                    destDim.boolVisible = dim.boolVisible;
                    destModel.lstDimensions.Add(destDim);
                }
                #endregion
                #region Measure Groups
                foreach (XMLAMeasureGroup Measure in xModel.lstMeasureGroups)
                {
                    if (sOnlyTable.Count > 0 && (sOnlyTable.IndexOf (Measure.sName) == -1 ))
                    {
                        continue;
                    }
                    XMLAMeasureGroup destMG = new XMLAMeasureGroup(Measure.sName, Measure.sName,  "Sandbox");
                    foreach (XMLAMeasure MeasureAtt in Measure.lstMeasures)
                    {
                        if (MeasureAtt.sName == "RowNumber")
                        {
                            continue;
                        }
                        //Need to reset the source (DB) names to the new ones, i.e. the source column name is the same as the column name
                        XMLAMeasure destMeasure = new XMLAMeasure(MeasureAtt.sName + "|", MeasureAtt.sName + "|", MeasureAtt.sAggregationFunction, MeasureAtt.sMeasureExpression, MeasureAtt.sFormatString, MeasureAtt.sAnnotations, MeasureAtt.sDataType, MeasureAtt.sDataSize, MeasureAtt.sDisplayFolder, MeasureAtt.sDBColumnName, MeasureAtt.sDBSchemaName, MeasureAtt.sDBTableName, MeasureAtt.sDimensionName, MeasureAtt.sDimensionID, MeasureAtt.sAttributeName, MeasureAtt.boolVisible);
                        destMG.lstMeasures.Add(destMeasure);
                    }
                    destModel.lstMeasureGroups.Add(destMG);
                    
                }
                #endregion

            }
            

            #region DSV
            foreach (DSV dsv in xmlaReader.cbOriginalCube.lstDSV) 
            {              
                foreach(DSVTable table in dsv.lstDSVTables) 
                {
                    boolProcessAdd = false;
                    if (sOnlyTable.Count > 0 && (sOnlyTable.IndexOf(table.sFriendlyName.Replace("_","")) == -1))
                    {
                        continue;
                    }
                    table.sFriendlyName = table.sFriendlyName.Replace(" ", "").Replace("_","");
                    table.sName = table.sName.Replace(" ", "").Replace("_", "");
                    if (table.sID != null)
                    {
                        table.sID = table.sID.Replace(" ", "").Replace("_", "");
                    }
                    else
                    {
                        table.sID = table.sName;
                    }

                    //Use name as ID
                    DSVTable destTbl = new DSVTable(table.sFriendlyName, table.sFriendlyName, table.sFriendlyName, "View", table.sFriendlyName);
                    XMLADimension xDim = new XMLADimension(table.sFriendlyName, table.sFriendlyName, "CubeSource", "Sandbox", table.sFriendlyName);

                    string sQuery = "";
                    string sAddColumns = "";
                    string sSummarize = "";
                    boolFilter = false;
                    
                    //Override query to enable  filtering
                    if ( sFilterTable != "" && sFilterCondition != "" && sFilterValue != "") 
                    {

                        if (
                        destModel.lstDimensions.Find(
                                    item => item.sName == destTbl.sName
                                    ).lstRelationships.Exists(item => item.toTable == this.sFilterTable))
                        {
                            string sColumn = destModel.lstDimensions.Find(
                                    item => item.sName == destTbl.sName
                                    ).lstRelationships.Find(item => item.toTable == this.sFilterTable).fromColumn;
                            sFilterColumn = "'" + destTbl.sName + "'" + "[" + destModel.lstDimensions.Find(
                                    item => item.sName == destTbl.sName
                                    ).lstRelationships.Find(item => item.toTable == this.sFilterTable).fromColumn 
                                    + "]";


                            sFilterColumnType = table.lstColumns.Find( item => item.sID == sColumn).sType;
                            
                        
                            this.boolFilter = true;
                        }
                    }


                    if (sProcessAddTable.IndexOf( xDim.sName) != -1)
                    {
                        boolProcessAdd = true;
                    }
                    

                    
                    if (!this.boolFilter)
                    {
                        sQuery = @"
EVALUATE ( 
    SUMMARIZE( 
    ADDCOLUMNS ( '{0}'
                {1}
                )
        {2}
            )
        )";
                    }
                    else
                    {
                        
                        sQuery = @"
EVALUATE ( 
    SUMMARIZE( 
    ADDCOLUMNS ( 

            FILTER( '{0}', {3} {4} VALUE(""{5}"") )
                {1}
                )
        {2}
            )
        )";
                    }



                    //For the special case of calculated columns, which did not exist and now should, we need to add them to the model
                    //destModel.lstDimensions.Find(item => item.sID == destTbl.sName).lstDimensionAttributes;


                    //xModel.lstDimensions.Add
                    foreach (DSVColumn column in table.lstColumns)
                    {
                        #region columnAdd
                        if (column.sName == "RowNumber")
                        {
                            continue;
                        }
                        DSVColumn destColumn = new DSVColumn(column.sName + "|", column.sID + "|", column.sName + "|", column.sName + "|", column.sType, column.sComputedColumnExpression, column.sRestrictionBase, column.sRestrictionMaxLength);
                        if (table.sFriendlyName == "UserSiteBridge")
                        {
                            sAddColumns += string.Format(@"
        , ""{0}|"", '{1}'[{0}]", column.sName, "User_Site_Bridge");
                        }
                        else
                        {
                            sAddColumns += string.Format(@"
        , ""{0}|"", '{1}'[{0}]", column.sName, table.sFriendlyName);
                        }
                        /*if (sSummarize == "") {
                            sSummarize = string.Format("[{0}_]", column.sName);
                        }
                        else 
                        {*/
                        sSummarize += string.Format(",[{0}|]", column.sName);
                        //}

                        ///TODO: add relationships here
                        destTbl.lstColumns.Add(destColumn);

                        //XMLADimensionAttribute xDA = new XMLADimensionAttribute(column.sName, column.sID, column.sName ,table.sName,"",column.sName,column.da);
                        #endregion
                    }


                    //
                    if (table.sFriendlyName == "UserSiteBridge")
                    {
                        if (boolFilter)
                        {
                            if (!boolProcessAdd)
                            {
                                sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize, sFilterColumn, sFilterCondition, sFilterValue);
                            }
                            else
                            {
                                //In this case ignore the condition, just give us a single filter value. 
                                //The rest of the data will be processed in a separate Process add step
                                sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize, sFilterColumn, "=", sFilterValue);
                            
                            }
                        }
                        else
                        {
                            sQuery = string.Format(sQuery, "User_Site_Bridge", sAddColumns, sSummarize);
                        }
                    }
                    else
                    {
                        if (boolFilter)
                        {
                            if (!boolProcessAdd)
                            {
                                sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize, sFilterColumn, sFilterCondition, sFilterValue);
                            }
                            else
                            {
                                //In this case ignore the condition, just give us a single filter value. 
                                //The rest of the data will be processed in a separate Process add step

                                ///HERE To change by type
                                ///
                                if (sFilterColumnType == "xs:int")
                                {
                                    if (sFilterValue.Length == 10 && sFilterValue.Contains("/"))
                                    {
                                        DateTime dtFilter = System.Convert.ToDateTime(sFilterValue);
                                        string sNewFilter = dtFilter.Year.ToString() + dtFilter.Month.ToString().PadLeft(2, '0') + dtFilter.Day.ToString().PadLeft(2, '0');
                                        sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize, sFilterColumn, "=", sNewFilter);
                                    }
                                }
                                else
                                {
                                    sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize, sFilterColumn, "=", sFilterValue);
                                }

                            }
                        }
                        else
                        {
                            sQuery = string.Format(sQuery, table.sFriendlyName, sAddColumns, sSummarize);
                        }
                    }
                    destTbl.sQuery = sQuery;
                    destTbl.sQueryDefiniton = sQuery;
                    //Fix the dimension query
                    destModel.lstDimensions.Find(
                                item => item.sName == destTbl.sName
                                ).sQueryDefinition = sQuery;
                    

                    destDSV.lstDSVTables.Add(destTbl);
                }
            }
            #endregion
            xmlaWriter.srcCubeReader.cbOriginalCube.lstDSV.Add( destDSV );

            xmlaWriter.srcCubeReader.cbOriginalCube.lstCubeModels.Add(destModel);
        }
        
    }
}
