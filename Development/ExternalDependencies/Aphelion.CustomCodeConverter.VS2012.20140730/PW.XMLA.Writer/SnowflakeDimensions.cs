using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PW.XMLA.Reader.XMLAPropertyClasses;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

namespace PW.XMLA.Writer
{
    public static class SnowflakeDimensions
    {

        //private PW.XMLA.Reader.MultiDimensionalReader srcCubeReader;

        public static void ProcessSnowflakes(ref  PW.XMLA.Reader.MultiDimensionalReader srcCubeReader)
        {
            
            
            foreach (XMLAModel xModel in srcCubeReader.cbOriginalCube.lstCubeModels)
            {
                List<XMLADimension> lstDim = new List<XMLADimension>(xModel.lstDimensions);                
                //Make a copy as we're modifying the list of dimensions
                foreach (XMLADimension xDim in lstDim)
                {
                    CreateDimensions(ref srcCubeReader, xModel, xDim);
                }
                //Do a second pass to fix up any relationships not created for the new tables.
                lstDim = new List<XMLADimension>(xModel.lstDimensions);
                //Make a copy as we're modifying the list of dimensions
                foreach (XMLADimension xDim in lstDim)
                {
                    CreateDimensions(ref srcCubeReader, xModel, xDim);
                }

                //Now we need to fix any measures that are orphaned - i.e. they belong on a measure group that is created during snowflaking

                foreach (XMLAMeasureGroup mg in xModel.lstMeasureGroups)
                {
                    foreach (XMLAMeasure xMeasure in mg.lstMeasures)
                    {
                        if (xModel.lstDimensions.Exists(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName))
                        {
                            XMLADimension xD = xModel.lstDimensions.Find(item => item.sKeyTableName == xMeasure.sDBTableName && item.sKeySchemaName == xMeasure.sDBSchemaName);
                            if (xD.sID.Contains("Customer"))
                            {
                            }
                            xMeasure.sDimensionID = xD.sID;
                            xMeasure.sDimensionName = xD.sName;

                            if (xMeasure.sAttributeName == null)
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
                        else
                        {
                            ///Here still be dragons! Bring on sir george
                            if (xMeasure.sAggregationFunction != "Count")
                            {
                                ///Counts seem to be fine
                                //Fixed these, now fact tables that didn't have dimensions yet. 
                                //So onto FactDimension
                            }
                        }

                        
                    }
                }

            }
            BuildDimensionRelationships( ref srcCubeReader.cbOriginalCube);
        }

        private static void BuildDimensionRelationships( ref Reader.CubeDatabase cbOriginalCube)
        {
            XMLAModel xModel = cbOriginalCube.lstCubeModels[0];
            foreach (DSVRelationship dsvR in cbOriginalCube.lstDSV[0].lstRelationships)
            {
                if (xModel.lstDimensions.Exists(
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
                    XMLADimension xDimParent = xModel.lstDimensions.Find(
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
                        cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.childTable
                               && item.sKeySchemaName == dsvR.childSchema).lstRelationships.Add(
                            new XMLARelationship(
                                dsvR.sID, xDimChild.sID, fromColumn, xDimParent.sID, ToColumn)
                                );

                        //Set the attributes for the key column

                        cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.parentTable
                               && item.sKeySchemaName == dsvR.parentSchema)
                               .lstDimensionAttributes.Find(item => item.sDBColumnName == ToColumn)
                               .sCardinality = "One";

                        cbOriginalCube.lstCubeModels[0].lstDimensions.Find(
                        item => item.sKeyTableName == dsvR.parentTable
                               && item.sKeySchemaName == dsvR.parentSchema)
                               .lstDimensionAttributes.Find(item => item.sDBColumnName == ToColumn)
                               .sNullProcessing = "Error";
                    }

                }
                else { var x = 1; }

            }
        }


        private static void CreateDimensions(ref PW.XMLA.Reader.MultiDimensionalReader targetCubeReader, XMLAModel xModel, XMLADimension xDim)
        {
            //string sSchemaName = xDim.lstDimensionAttributes;


            //Copying List so we can remove items
            List<XMLADimensionAttribute> lstXDA = new List<XMLADimensionAttribute>(xDim.lstDimensionAttributes);

            bool replaced = false;
            foreach (XMLADimensionAttribute xColumn in lstXDA)
            {
                replaced = false;
                string sDimensionID = xColumn.sDimensionID;
                string sDimensionName = xColumn.sDimensionName;
                if ((xColumn.sID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (sDimensionID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (xColumn.sID.Contains("Billable") && sDimensionID.Contains("DimClient"))
                            )
                {
                    int ipb = 1;
                }
                //if (xColumn.sDimensionID.Contains("DimProject") || xColumn.sDimensionName.Contains("DimProject"))
                //{
                if (
                    xModel.lstDimensions.Exists(item => item.sKeyTableName == xColumn.sDBTableName
                    ))
                {
                    string sDimID = xModel.lstDimensions.Find(item => item.sKeyTableName == xColumn.sDBTableName).sID;
                    string sDimName = xModel.lstDimensions.Find(item => item.sKeyTableName == xColumn.sDBTableName).sName;

                    if (sDimID.Contains("DimProject"))
                    {
                        int ipc = 1;
                    }

                    if (xColumn.sDimensionID != sDimID)
                    {

                        if (xColumn.sDimensionID.Contains("Customer"))
                        {
                        }
                        sDimensionID = sDimID;
                        sDimensionName = sDimName;
                        replaced = true;
                    }
                }
                    
                //}
                    
                ///TODO: Check that adding a new dimension is done correctly for snowflakes

                    if (!(xColumn.sDBSchemaName == xDim.sKeySchemaName && xColumn.sDBTableName == xDim.sKeyTableName)

                        )
                    {
                        #region Snowflake

                        if ((xColumn.sDBSchemaName == xDim.sKeySchemaName && xColumn.sDBTableName == xDim.sKeyTableName))
                        {
                            int ips = 1;
                        }
                        //We have a snowflaked column from a different table
                        //First check if we have a table already
                        DSV dsvDim = targetCubeReader.cbOriginalCube.lstDSV.Find(item => item.sID == xDim.sDSVID);
                        XMLADimension xSubDim = xModel.lstDimensions.Find(item =>
                                item.sKeySchemaName == xColumn.sDBSchemaName
                                    && item.sKeyTableName == xColumn.sDBTableName);

                        XMLADimension dimNew;
                        if (xSubDim == null)
                        {
                            #region New Table/Dimension
                            //Create a new table
                            dimNew = new XMLADimension();

                            dimNew.sDSVID = xDim.sDSVID;
                            dimNew.sDataSourceID = xDim.sDataSourceID;

                            DSVTable dsvtSubDim = dsvDim.lstDSVTables.Find(item => item.sSchemaName == xColumn.sDBSchemaName
                                                                                && item.sTableName == xColumn.sDBTableName);


                            dimNew.sID = dsvtSubDim.sTableName;
                            dimNew.sName = dsvtSubDim.sTableName;
                            dimNew.sKeyTableName = dsvtSubDim.sTableName;
                            dimNew.sKeySchemaName = dsvtSubDim.sSchemaName;
                            if (dsvtSubDim.lstKeyColumns.Count != 0)
                            {
                                throw new Exception("Multi-keyed column");
                            }
                            else
                            {
                                dimNew.sKeyColumnName = dsvtSubDim.sKeyColumn;
                            }
                            //We need to find the column that is the key column and add it
                            if (targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Exists(item => item.sID == dimNew.sID))
                            {
                                XMLADimensionAttribute xdaSrc = targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Find(item => item.sID == dimNew.sID)
                                    .lstDimensionAttributes.Find(item => item.sID == dimNew.sKeyColumnName);

                                dimNew.lstDimensionAttributes.Add(xdaSrc);
                            }
                            else
                            {
                                //We don't have a findable key column.....
                                //Not all that surprising as this will mostly be a new dimension
                                int iii = 1;
                                if ( targetCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Exists( item => item.sSchemaName == dimNew.sKeySchemaName
                                    && item.sTableName == dimNew.sKeyTableName))
                                {
                                    DSVTable dsvT = targetCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find( item => item.sSchemaName == dimNew.sKeySchemaName
                                        && item.sTableName == dimNew.sKeyTableName);
                                    DSVColumn dsvC = dsvT.lstColumns.Find(item => item.sName == dsvtSubDim.sKeyColumn);
                                    string sDataType;
                                    if (dsvC.sType.Contains("int"))
                                    {
                                        sDataType = "Integer";
                                    }
                                    else
                                    {
                                        sDataType = "WChar";
                                    }
                                    string sDataSize;
                                    if (dsvC.sRestrictionMaxLength == null)
                                    {
                                        sDataSize = "0";
                                    } else
                                    {
                                        sDataSize = dsvC.sRestrictionMaxLength;
                                    }
                                    XMLADimensionAttribute xdaSrc = new XMLADimensionAttribute(
                                        dsvC.sName
                                        , dsvC.sID
                                        , dsvC.sDBColumnName
                                        , dsvT.sTableName
                                        , dsvT.sSchemaName
                                        , dsvC.sID
                                        , sDataType
                                        , sDataSize
                                        , dimNew.sName
                                        , dimNew.sID
                                        );
                                    if (dimNew.sID.Contains("Customer"))
                                    {
                                    }
                                    dimNew.lstDimensionAttributes.Add(xdaSrc);
                            
                                    
                                }
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



                            //Add a key column

                            if (xColumn.sDBColumnName != dimNew.sKeyColumnName)
                            {
                                //Assumption here is single key column. If it wasn't, either error thrown earlier or fixed by earlier code
                                XMLADimensionAttribute xdaKey = xDim.lstDimensionAttributes.Find(item => item.sName == xDim.sKeyColumnName);
                                //xdaKey.sDimensionID = sDimensionID;
                                ///TODO: Check if key needs new SID for dims
                                if (xdaKey != null)
                                {
                                    dimNew.lstDimensionAttributes.Add(xdaKey);
                                }
                            }
                            //Add the current column
                            if (xColumn.sDimensionID.Contains("Client"))
                            {
                                DSVTable dsvTCheck = targetCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(item => item.sSchemaName == xColumn.sDBSchemaName && item.sTableName == xColumn.sDBTableName);
                                if (dsvTCheck != null)
                                {
                                    if (dsvTCheck.lstColumns.Exists(item => item.sDBColumnName == xColumn.sDBColumnName))
                                    {
                                    }
                                    else
                                    {
                                    }
                                }
                            }
                            XMLADimensionAttribute xdaNew = xColumn.DeepClone();
                            xdaNew.sDimensionID = sDimensionID;
                            xdaNew.sDimensionName = sDimensionName;
                            xdaNew.boolRelated = false;
                            dimNew.lstDimensionAttributes.Add(xdaNew);

                            xDim.lstSubsidiaryDimensions.Add(dimNew);
                            #endregion
                        }
                        else
                        {
                            #region Existing
                            //We have an existing table
                            dimNew = xSubDim;
                            //Check for the current column in that table
                            if (dimNew.lstDimensionAttributes.Count == 0)
                            {
                            }

                            if ((xColumn.sID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (sDimensionID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (xColumn.sID.Contains("Billable") && sDimensionID.Contains("DimClient"))
                            )
                            {
                                int ipb = 1;
                            }
                            try
                            {
                                if (!dimNew.lstDimensionAttributes.Exists(item => item.sID == xColumn.sID)
                                    /*|| xColumn.boolRelated == true*/
                                    )

                                    
                                {
                                    DSVTable dsvTMatch = (targetCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(
                                            item => item.sSchemaName == xColumn.sDBSchemaName
                                                && item.sTableName == xColumn.sDBTableName));
                                    if ((dsvTMatch != null) && (dsvTMatch.lstColumns.Exists(item => item.sDBColumnName == xColumn.sDBColumnName)))
                                    {


                                        if (xColumn.boolRelated)
                                        {
                                            int xxx = 1;
                                            if (xColumn.sDimensionID != sDimensionID)
                                            {
                                                if (xColumn.sDimensionID.Contains("Customer"))
                                                {
                                                }
                                                //MGS
                                                if (sDimensionID == dimNew.sID)
                                                {
                                                    //We are fixing a misnaming in the dimension. So remove the old dim
                                                    dimNew.lstDimensionAttributes.Remove(xColumn);
                                                }
                                                else
                                                {
                                                    //Snowflake, so leave the related column
                                                    replaced = false;
                                                }
                                                XMLADimensionAttribute xdaKey = xColumn;
                                                xdaKey.sDimensionID = sDimensionID;
                                                xdaKey.sDimensionName = sDimensionName;
                                                xdaKey.boolRelated = false;
                                                dimNew.lstDimensionAttributes.Add(xdaKey);

                                                //xColumn.boolRelated = false; //Hack to get it removed later
                                            }
                                        }
                                        else
                                        {
                                            XMLADimensionAttribute xdaKey = xColumn;
                                            xdaKey.sDimensionID = sDimensionID;
                                            xdaKey.sDimensionName = sDimensionName;
                                            dimNew.lstDimensionAttributes.Add(xdaKey);
                                        }
                                    }
                                    else
                                    {
                                        //We haven't found this field in the DSV. It's a mismatch
                                    }
                                }
                                
                            }
                            catch (System.Exception ex)
                            {
                                throw ex;
                            }
                            #endregion
                        }

                        #region Relationships
                        if (!dsvDim.lstXMLARelationships.Exists(
                            item => item.fromTable == xDim.sKeyTableName
                            && item.toTable == dimNew.sKeyTableName
                            )
                            )
                        {
                            DSVRelationship dsvrDim = dsvDim.lstRelationships.Find(
                                item => item.parentSchema == dimNew.sKeySchemaName
                                    && item.parentTable == dimNew.sKeyTableName
                                    && item.parentColumn == dimNew.sKeyColumnName
                                    && item.childSchema == xDim.sKeySchemaName
                                    && item.childTable == xDim.sKeyTableName
                                /*&& item.childTable == xDim.sKeyColumnName*//*Don't check on the child Dim - we don't know what the key column would be, it won't be the child's key*/
                                    );

                            if (dsvrDim != null)
                            {
                                //Tables are directly related
                                if (dsvrDim.lstChildColumns.Count > 0 || dsvrDim.lstParentColumns.Count > 0)
                                {
                                    throw new Exception("Multi-keyed columns not implemented yet");
                                }
                                XMLARelationship xRel = new XMLARelationship();
                                xRel.fromTable = dsvrDim.childTable;
                                xRel.fromColumn = dsvrDim.childColumn;
                                xRel.toTable = dsvrDim.parentTable;
                                xRel.toColumn = dsvrDim.parentColumn;


                                //Push changes back into original cube
                                targetCubeReader.cbOriginalCube.lstDSV[
                                    targetCubeReader.cbOriginalCube.lstDSV.FindIndex(item => item.sID == xDim.sDSVID)]
                                   = dsvDim;
                            }
                            else
                            {
                                //First do a single intermediate dimension
                                List<DSVRelationship> lstDSV = dsvDim.lstRelationships.FindAll(
                                item => item.parentSchema == dimNew.sKeySchemaName
                                    && item.parentTable == dimNew.sKeyTableName
                                    && item.parentColumn == dimNew.sKeyColumnName);

                                foreach (DSVRelationship rTo in lstDSV)
                                {
                                    DSVRelationship rFrom = dsvDim.lstRelationships.Find(
                                item =>
                                    item.childSchema == xDim.sKeySchemaName
                                    && item.childTable == xDim.sKeyTableName
                                    && item.parentTable == rTo.childTable
                                    );
                                    if (rFrom != null )
                                    {
                                        XMLAReferenceDimension xRel = new XMLAReferenceDimension();

                                         XMLADimension xRefDim = xModel.lstDimensions.Find(item => item.sKeyTableName == rFrom.parentTable);
                                        xRel.sIntermediateDimensionID = xRefDim.sID;
                                        xRel.sIntermediateGranularityID = xRefDim.sKeyColumnName;
                                        xRel.sTable = rTo.parentTable;
                                        xRel.sColumn = rTo.parentColumn;
                                        xRel.sID = xDim.sKeyTableName + "-" + xRel.sIntermediateDimensionID + "-" + xRel.sTable ;
                                        xRel.sName = xRel.sID;
                                        xRel.sMaterialisation = "Indirect";
                                        //xModel.lstMeasureGroups[0].lstDimensions[0].lstReferenceDimensions

                                        XMLADimension xd = xModel.lstDimensions.Find(item => item.sID == rFrom.childTable);
                                        if (!xd.lstReferenceDimensions.Exists(item => item.sID == xRel.sID))
                                        {
                                            xd.lstReferenceDimensions.Add(xRel);
                                            //Push changes back into original cube
                                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                                                targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == rFrom.childTable)]
                                               = xd;
                                        }

                                        //If a measure group doesn't exist, we need that too.
                                        if (! xModel.lstMeasureGroups.Exists(item => item.sID == xRefDim.sID) )
                                        {
                                            XMLAMeasureGroup xMGNew = new XMLAMeasureGroup(xRefDim.sName, xRefDim.sID, xRefDim.sDSVID);
                                            xMGNew.sDescription = xRefDim.sID;
                                            xMGNew.sProcessingMode = "Regular";
                                            XMLAReferenceDimension xRefNew = new XMLAReferenceDimension();

                                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.Add(xMGNew);
                                            xRefNew.sIntermediateDimensionID = xRefDim.sID;
                                            xRefNew.sIntermediateGranularityID = rTo.childColumn;
                                            xRefNew.sTable = rTo.parentTable;
                                            xRefNew.sColumn = rTo.parentColumn;
                                            xRefNew.sID = rFrom.parentTable + "-" + xRel.sTable;
                                            xRefNew.sName = xRel.sID;
                                            xRefNew.sMaterialisation = "Regular";


                                            XMLADimension xdDim = xModel.lstDimensions.Find(item => item.sKeyTableName == rFrom.parentTable);
                                            xdDim.lstReferenceDimensions.Add(xRefNew);
                                            if (!xdDim.lstReferenceDimensions.Exists(item => item.sID == xRefNew.sID))
                                            {
                                                xdDim.lstReferenceDimensions.Add(xRefNew);
                                                //Push changes back into original cube
                                                targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                                                    targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sKeyTableName == rFrom.parentTable)]
                                                   = xdDim;
                                            }
                                        
                                        }
                                        /*XMLAMeasureGroup xMG = xModel.lstMeasureGroups.Find(item => item.sID == rFrom.childTable);
                                        xMG.lstAdditionalReferences.Add(xRel);

                                        //Push changes back into original cube
                                        targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups[
                                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstMeasureGroups.FindIndex(item => item.sID == rFrom.childTable)]
                                           = xMG;
                                         * 
                                         * /
                                        /*targetCubeReader.cbOriginalCube.lstDSV[
                                            targetCubeReader.cbOriginalCube.lstDSV.FindIndex(item => item.sID == xDim.sDSVID)]
                                           = dsvDim;*/
                                    }
                                    else
                                    {
                                        ///TODO:  //Currently only handling 2 levels of relationship away. Need to implement recursion.
                                        //throw new Exception("Still need to implement multi-level snowflakes");
                                    }

                                }
                            }
                        }
                        #endregion

                        //Push dimension changes back to cube model
                        if (!targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Exists(item => item.sID == dimNew.sID))
                        {
                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Add(dimNew);
                        }
                        else
                        {

                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == dimNew.sID)]
                            = dimNew;
                        }

                        //Remove column from Dim
                        if (!xColumn.boolRelated)
                        {
                            //MGS
                            xDim.lstDimensionAttributes.Remove(xColumn);
                        }
                        else
                        {

                            if (xDim.sName.Contains("DimProject"))
                            {
                                int ipz = 1;
                            }
                        }

                        #endregion
                    }

                    if (xColumn.sDimensionID != xDim.sID || xColumn.boolRelated)
                    {
                        if ((xColumn.sID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (sDimensionID.Contains("Billable") && xDim.sID.Contains("DimClient"))
                            || (xColumn.sID.Contains("Billable") && sDimensionID.Contains("DimClient"))
                            )
                        {
                            int ipb = 1;
                        }
                
                        XMLADimension dimNew;
                        dimNew = xDim;
                        if (xColumn.sDimensionID.Contains("Client"))
                        {
                            DSVTable dsvTCheck = targetCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find(item => item.sSchemaName == xColumn.sDBSchemaName && item.sTableName == xColumn.sDBTableName);
                            if (dsvTCheck != null)
                            {
                                if (dsvTCheck.lstColumns.Exists(item => item.sDBColumnName == xColumn.sDBColumnName))
                                {
                                }
                                else
                                {
                                }
                            }
                        }
                        XMLADimensionAttribute xdaKey = xColumn.DeepClone() ;
                        xdaKey.sDimensionID = sDimensionID;
                        if (xdaKey.sDBTableName == xDim.sKeyTableName)
                        {
                            xdaKey.boolRelated = false;
                        }
                        else
                        {
                            xdaKey.boolRelated = true;
                        }
                        dimNew.lstDimensionAttributes.Remove(xColumn);
                        dimNew.lstDimensionAttributes.Add(xdaKey);

                        //Push dimension changes back to cube model
                        if (!targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Exists(item => item.sID == dimNew.sID))
                        {
                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.Add(dimNew);
                        }
                        else
                        {

                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
                            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == dimNew.sID)]
                            = dimNew;
                        }

                    }


            }//End For Each column

            foreach (XMLADimension xdSub in xDim.lstSubsidiaryDimensions)
            {
                if (!xModel.lstDimensions.Exists(item => item.sID == xdSub.sID))
                {
                    CreateDimensions(ref targetCubeReader, xModel, xDim);
                }
            }

            //Push dimension changes back to cube model
            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions[
            targetCubeReader.cbOriginalCube.lstCubeModels[0].lstDimensions.FindIndex(item => item.sID == xDim.sID)]
            = xDim;
        }



    }
}

