using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PW.XMLA.Reader.XMLAPropertyClasses;
namespace PW.XMLA.Writer
{
    public static class DSVRename
    {

        public static void FixDSVTableNames(ref  PW.XMLA.Reader.MultiDimensionalReader srcCubeReader)
        {
            foreach (XMLAModel xModel in srcCubeReader.cbOriginalCube.lstCubeModels)
            {
                foreach (XMLADimension xDim in xModel.lstDimensions)
                {
                    //Shortcut!!!!
                    ///TODO: FIx this to cater for all DSVs
                    ///
                    


                    if (srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find
                        (item => item.sSchemaName == xDim.sKeySchemaName
                                && ( item.sTableName == xDim.sKeyTableName 
                                || item.sFriendlyName == xDim.sKeyTableName)
                                ).sName != xDim.sName)
                    {
                        srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables[
                            srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.FindIndex
                        (item => item.sSchemaName == xDim.sKeySchemaName
                                && (item.sTableName == xDim.sKeyTableName
                                || item.sFriendlyName == xDim.sKeyTableName)
                                )
                            ].sName = xDim.sName;
                    }
                    DSVTable dsvT = srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.Find
                        (item => item.sSchemaName == xDim.sKeySchemaName
                                && (item.sTableName == xDim.sKeyTableName
                                || item.sFriendlyName == xDim.sKeyTableName)
                                );
                    
                    foreach (XMLADimensionAttribute xAtt in xDim.lstDimensionAttributes)
                    {
                        if (xAtt.sName == "Partition")
                        {
                            continue;
                        }


                        if (dsvT.lstColumns.Exists(item => item.sDBColumnName == xAtt.sDBColumnName))
                        {
                            if (dsvT.lstColumns.Find(item => item.sDBColumnName == xAtt.sDBColumnName).sName != xAtt.sName)
                            {
                                srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables[
                                srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.FindIndex
                            (item => item.sSchemaName == xDim.sKeySchemaName
                                    && item.sTableName == xDim.sKeyTableName
                                    )
                                ].lstColumns[
                                srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables[
                                srcCubeReader.cbOriginalCube.lstDSV[0].lstDSVTables.FindIndex
                            (item => item.sSchemaName == xDim.sKeySchemaName
                                     && (item.sTableName == xDim.sKeyTableName
                                    || item.sFriendlyName == xDim.sKeyTableName)
                                    )
                                ].lstColumns.FindIndex(item => item.sDBColumnName == xAtt.sDBColumnName)
                                ].sName = xAtt.sName;
                            }
                        }
                        else
                        {
                            //
                        }
                    }

                }

            }
        }
    }
}
