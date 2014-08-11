using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PW.XMLA.Reader.XMLAPropertyClasses;

namespace PW.XMLA.Writer
{
    public static class FactDimensions
    {

        public static void ProcessFacts(ref  PW.XMLA.Reader.MultiDimensionalReader srcCubeReader)
        {

            foreach (XMLAModel xModel in srcCubeReader.cbOriginalCube.lstCubeModels)
            {
                //Make a copy so we can alter the original one
                List<XMLAMeasureGroup> lstMG = new List<XMLAMeasureGroup>(xModel.lstMeasureGroups);

                List<XMLAMDXCommand> lstCommands = ExtractMeasureCommandsList(xModel.mdxScript.Commands[0]);

                foreach (XMLAMeasureGroup xMG in lstMG ) 
                {                    
                    
                    CreateDimensions(ref srcCubeReader, xModel,
                        xMG
                        );
                    foreach (XMLAMeasure xMeasure in xMG.lstMeasures)
                    {
                        #region SetDim
                        
                        if (xModel.lstDimensions.Exists(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName))
                        {
                            XMLADimension xD = xModel.lstDimensions.Find(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName);
                            xMeasure.sDimensionID = xD.sID;
                            xMeasure.sDimensionName = xD.sName;
                            if (xMeasure.sID.Contains("Hours"))
                            {
                            }
                                    
                            XMLADimensionAttribute xda = xD.lstDimensionAttributes.Find(item => item.sDBColumnName == xMeasure.sDBColumnName);
                            if (xda == null)
                            {
                                DSV dsvSrc = srcCubeReader.cbOriginalCube.lstDSV.Find(item => item.sID == xMG.sDSVID);
                                DSVTable dsvT = dsvSrc.lstDSVTables.Find(item => item.sSchemaName == xD.sKeySchemaName && item.sTableName == xD.sKeyTableName);
                                DSVColumn dsvC = dsvT.lstColumns.Find(item => item.sDBColumnName == xMeasure.sDBColumnName);
                                if (dsvC != null)
                                {
                                    xda = new XMLADimensionAttribute();
                                    xda.sID = xMeasure.sID.Replace(" ","") + "_src";
                                    xda.sName = xMeasure.sName.Replace(" ", "") + "_src";
                                    xda.sDBSchemaName = xMeasure.sDBSchemaName;
                                    xda.sDBTableName = xMeasure.sDBTableName;
                                    xda.sDBColumnName = xMeasure.sDBColumnName;
                                    xda.sDimensionID = xMeasure.sDimensionID;
                                    xda.boolAddToTabular = true;
                                    xda.boolVisible = true;
                                    xda.sDataType = xMeasure.sDataType;
                                    xda.sDataSize = xMeasure.sDataSize;
                                    xda.sAttributeName = dsvC.sFriendlyName;
                                    xD.lstDimensionAttributes.Add(xda);
                                    srcCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                                        srcCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == xD.sID)]
                                    = xD;
                                    xMeasure.sAttributeName = xda.sName;
                                }
                                else
                                {
                                    //No matching column found in DSV
                                }
                            }
                                


                            if (xMeasure.sAttributeName == null || xMeasure.sAttributeName == "")
                            {
                                if (xda != null)
                                {
                                    xMeasure.sAttributeName = xD.lstDimensionAttributes.Find(item => item.sDBColumnName == xMeasure.sDBColumnName).sID;
                                }
                                else
                                {

                                    //More dragons..
                                }
                            }
                        }

                        else
                        {
                            ///Here still be dragons! Bring on sir george
                            if (xMeasure.sAggregationFunction != "Count")
                            {
                                ///Counts seem to be fine
                            }
                        }
                        #endregion
                        
                    }

                    BuildMGDimensionRelationships(xModel, xMG);
                }


            }
                
        }

        private static void BuildMGDimensionRelationships(XMLAModel xModel, XMLAMeasureGroup xMG)
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
                ///TODO: Check why key columns are null.
                if (xDInt != null && sKeyColumn != null)
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

                    foreach (XMLARelationship xRel in xDInt.lstRelationships)
                    {
                        XMLADimension xd = xModel.lstDimensions.Find(item => item.sID == xRel.toTable);
                        if (xd != null)
                        {
                            xDInt.lstReferenceDimensions.Add(new XMLAReferenceDimension(
                                xDInt.sKeyTableName + "-" + xd.sKeyTableName,
                                xDInt.sKeyTableName + "-" + xd.sKeyTableName,
                                xDInt.sID,
                                xRel.fromColumn,
                                "Regular",
                                /*xd.sName*/ xd.sID,
                                xd.sKeyColumnName
                                ));
                        }
                    }
                }
            }
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
                ///TODO: Check that the measures for tabular are created correctly
                if (measure.IndexOf("[") > -1 && !measure.Contains("ALTER CUBE") && !measure.Contains("CALCULATE"))
                {

                    sCommand = measure.Substring(0, measure.IndexOf(";") + 1) + "\n";
                    if (!sCommand.StartsWith("/*")) //Skip the comment
                    {
                        string[] component = sCommand.Split(']');
                        sTable = component[0].Replace("[", "");
                        sName = component[1].Replace("[", "").Replace(".", "");
                        sCommand = sCommand.Replace(string.Format("[{0}].[{1}]", sTable, sName), "");
                        component = sCommand.Split(
                        new string[] { " AS " }, StringSplitOptions.RemoveEmptyEntries);
                        sCommand = sCommand.Replace(component[0], "").Replace(" AS ", "");
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


        private static void CreateDimensions(ref PW.XMLA.Reader.MultiDimensionalReader targetCubeReader, XMLAModel xModel, XMLAMeasureGroup xMG)
        {

            DSV dsvDim = targetCubeReader.cbOriginalCube.lstDSV.Find(item => item.sID == xMG.sDSVID);

            //Copy the list of measures as we'll be writing back to it
            List<XMLAMeasure> lstMeasures = new List<XMLAMeasure>(xMG.lstMeasures);


            foreach (XMLAMeasure xMeasure in lstMeasures)
            {
                #region Measure
                //Skip any count measures, as they don't need an underlying column
                if (xMeasure.sAggregationFunction != "Count")
                {
                    //While it may seem backwards, doing the dimension check for each and every measure, but there may be some measures that are (in a different XMLA model) not sourced from a DSV table that the measure group is
                    //Hence we check for each measure if it's table exists as a dimension
                    bool   boolDimExists = true;
                    XMLADimension xSubDim = xModel.lstDimensions.Find(item =>
                                item.sKeySchemaName == xMeasure.sDBSchemaName
                                    && item.sKeyTableName == xMeasure.sDBTableName);

                    XMLADimension dimNew = new XMLADimension();
                    if (xSubDim == null)
                    {
                    #region Dim
                        boolDimExists = false;

                        dimNew.sDSVID = xMG.sDSVID;
                        dimNew.sDataSourceID = dsvDim.sDataSourceID;

                        DSVTable dsvtSubDim = dsvDim.lstDSVTables.Find(item => item.sSchemaName == xMeasure.sDBSchemaName
                                                                                && item.sTableName == xMeasure.sDBTableName);

                        dimNew.sID = FactDimensions.FixIDs( dsvtSubDim.sTableName );
                        dimNew.sName = dsvtSubDim.sTableName;
                        dimNew.sKeyTableName = dsvtSubDim.sTableName;
                        dimNew.sKeySchemaName = dsvtSubDim.sSchemaName;
                        if (dsvtSubDim.lstKeyColumns.Count != 0)
                        {
                            //Tabular handles this by having individual columns, and then having a hierarchy. 
                            //So we will do the same
                            foreach (string dColName in dsvtSubDim.lstKeyColumns)
                            {
                                //AddDimensionColumn(ref targetCubeReader, xMG, xMeasure, dimNew, dColName);
                            }
                            //throw new Exception("Multi-keyed column");
                        }
                        else
                        {
                            dimNew.sKeyColumnName = dsvtSubDim.sKeyColumn;
                        }


                        //Set the Query Definition
                        if (dsvtSubDim.sTableType == "View" || dsvtSubDim.sTableType == "Table")
                        {
                            dimNew.sQueryDefinition = "SELECT * FROM [" + dsvtSubDim.sSchemaName + "].[" + dsvtSubDim.sTableName + "]";
                        }
                        else
                        {
                            throw new Exception("Named queries not implemented yet!");
                        }

                        //Add the current column and the key column
                        xSubDim = dimNew;
                    #endregion //Dim

                    }
                    //Add the current column
                    //Second clause added as a measure could exist already
                    if (xMeasure.sName.Contains("Rates") || xMeasure.sDBColumnName.Contains("Rates"))
                    {
                    }
                    if (!xSubDim.lstDimensionAttributes.Exists(item => item.sDBSchemaName == xMeasure.sDBSchemaName &&
                                                                        item.sDBTableName == xMeasure.sDBTableName &&
                                                                        item.sDBColumnName == xMeasure.sDBColumnName
                                            )
                        && !xSubDim.lstDimensionAttributes.Exists(item => item.sDBSchemaName == xMeasure.sDBSchemaName &&
                                                                        item.sDBTableName == xMeasure.sDBTableName &&
                                                                        item.sDBColumnName == xMeasure.sName
                        
                        ))
                    {
                        AddDimensionColumn(ref targetCubeReader, xMG, xMeasure, xSubDim);

                    }
                    if (!boolDimExists)
                    {
                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Add(xSubDim);
                    }
                    else
                    {
                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == xSubDim.sID)
                            ]
                            = xSubDim;
                    }
                }
                #endregion



            }


            #region Check Measures - in case of new dimensions created
            foreach (XMLAMeasure xMeasure in lstMeasures)
            {

                if (xMeasure.sAttributeName == null)
                {
                 XMLADimension xD = xModel.lstDimensions.Find(item =>
                             item.sKeySchemaName == xMeasure.sDBSchemaName
                                 && item.sKeyTableName == xMeasure.sDBTableName);
                 if (xD != null)
                 {
                     if (xD.lstDimensionAttributes.Exists(item => item.sDBColumnName == xMeasure.sDBColumnName))
                     {
                         xMeasure.sAttributeName = xD.lstDimensionAttributes.Find(item => item.sDBColumnName == xMeasure.sDBColumnName).sID;
                     }
                     else
                     {
                     }
                 }
                }
            }

            #endregion

            #region Check Dimension keys
            XMLADimension xDim = xModel.lstDimensions.Find( item => item.sID == xMG.sID);
            if (xDim != null)
            {
                if (xDim.sKeyColumnName == null || xDim.sKeyColumnName == "")
                {
                    DSVTable dsvT = dsvDim.lstDSVTables.Find(item => item.sSchemaName == xDim.sKeySchemaName && item.sTableName == xDim.sKeyTableName);
                    if (dsvT != null)
                    {
                        if (dsvT.sKeyColumn != null)
                        {
                            xDim.sKeyColumnName = dsvT.sKeyColumn;
                        }
                        else
                        {
                            ///TODO: Using the first key column as the key. Ugly hack when we have multiple....
                            if (dsvT.lstKeyColumns.Count > 0)
                            {
                                xDim.sKeyColumnName = dsvT.lstKeyColumns[0];
                            }
                        }

                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sKeySchemaName == xDim.sKeySchemaName && item.sKeyTableName == xDim.sKeyTableName)
                ] = xDim;
        
                    }
                }
            }
            


            #endregion
        }

        private static void AddDimensionColumn(ref PW.XMLA.Reader.MultiDimensionalReader targetCubeReader, XMLAMeasureGroup xMG, XMLAMeasure xMeasure, XMLADimension xSubDim, string sColumnName)
        {
            XMLADimensionAttribute xdaNew = new XMLADimensionAttribute();
                xdaNew.sName = sColumnName;
                xdaNew.sID = sColumnName;
            xdaNew.sDataSize = xMeasure.sDataSize;
            xdaNew.sDataType = xMeasure.sDataType;
            xdaNew.sAttributeName = xdaNew.sName;

            xdaNew.sDBSchemaName = xMeasure.sDBSchemaName;
            xdaNew.sDBTableName = xMeasure.sDBTableName;
            xdaNew.sDBColumnName = xMeasure.sDBColumnName;
            xdaNew.sDimensionID = xSubDim.sID;
            xMeasure.sDimensionID = xSubDim.sID;

            
            xMeasure.sDimensionName = xSubDim.sName;
            xMeasure.sAttributeName = xdaNew.sAttributeName;
            xSubDim.lstDimensionAttributes.Add(xdaNew);
            //Write back to the original measure
            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups[
                targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.FindIndex(item => item.sID == xMG.sID)
                ].lstMeasures[
                     targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups[
                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.FindIndex(Inneritem => Inneritem.sID == xMG.sID)
                        ].lstMeasures.FindIndex(mItem => mItem.sID == xMeasure.sID)
                ] = xMeasure;
        }



        private static void AddDimensionColumn(ref PW.XMLA.Reader.MultiDimensionalReader targetCubeReader, XMLAMeasureGroup xMG, XMLAMeasure xMeasure, XMLADimension xSubDim)
        {
            
            //if ( !targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.

            if (true) return;
            ///TODO: Fix this behaviour : Adding a dimension column for the measure is breaking as attributes aren't being added correctly
            
            XMLADimensionAttribute xdaNew = new XMLADimensionAttribute();
            if (xMeasure.sDBColumnName == xMeasure.sName)
            {
                xdaNew.sName = FactDimensions.FixIDs(xMeasure.sDBColumnName).Replace(" ", "")/*_x0020*/;
                xdaNew.sID = FactDimensions.FixIDs(xMeasure.sDBColumnName);
            }
            else
            {
                //xdaNew.sName = FactDimensions.FixIDs(xMeasure.sDBTableName + "_" + xMeasure.sName).Replace(" ", "")/*_x0020*/;
                //xdaNew.sID = FactDimensions.FixIDs(xMeasure.sDBTableName + "_" + xMeasure.sName).Replace(" ", "")/*_x0020*/;
                xdaNew.sName = FactDimensions.FixIDs(xMeasure.sName).Replace(" ", "")/*_x0020*/;
                xdaNew.sID = FactDimensions.FixIDs(xMeasure.sID).Replace(" ", "")/*_x0020*/;
                
            }
            xdaNew.sDataSize = xMeasure.sDataSize;
            xdaNew.sDataType = xMeasure.sDataType;
            xdaNew.sAttributeName = xdaNew.sID;

            xdaNew.sDBSchemaName = xMeasure.sDBSchemaName;
            xdaNew.sDBTableName = xMeasure.sDBTableName;
            xdaNew.sDBColumnName = xMeasure.sDBColumnName;
            xdaNew.sDimensionID = xSubDim.sID;
            xMeasure.sDimensionID = xSubDim.sID;
            
            xMeasure.sDimensionName = xSubDim.sName;
            xMeasure.sAttributeName = xdaNew.sAttributeName;
            xSubDim.lstDimensionAttributes.Add(xdaNew);
            //Write back to the original measure
            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups[
                targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.FindIndex(item => item.sID == xMG.sID)
                ].lstMeasures[
                     targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups[
                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.FindIndex(Inneritem => Inneritem.sID == xMG.sID)
                        ].lstMeasures.FindIndex(mItem => mItem.sID == xMeasure.sID)
                ] = xMeasure;
        }


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
            sRet = sRet.Replace(@"|", "_x007C_");
            sRet = sRet.Replace(@"?", "");
            sRet = sRet.Replace(@"""", "");
            sRet = sRet.Replace(@"&", "");
            sRet = sRet.Replace(@"%", "");
            sRet = sRet.Replace(@"$", "");
            sRet = sRet.Replace(@"!", "");
            sRet = sRet.Replace(@"+", "");
            sRet = sRet.Replace(@"=", "");
            sRet = sRet.Replace(@"(", "_x0028_");
            sRet = sRet.Replace(@")", "_x0029_");
            sRet = sRet.Replace(@"[", "");
            sRet = sRet.Replace(@"]", "");
            sRet = sRet.Replace(@"{", "");
            sRet = sRet.Replace(@"}", "");
            sRet = sRet.Replace(@"<", "");
            sRet = sRet.Replace(@">", "");
            return sRet;

        }
    }

}

