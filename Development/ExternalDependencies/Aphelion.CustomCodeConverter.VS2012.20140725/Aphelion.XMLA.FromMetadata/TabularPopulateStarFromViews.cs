using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.Shared;
using PW.XMLA.Writer;
using PW.XMLA.Reader;
using PW.XMLA.Reader.XMLAPropertyClasses;

namespace Aphelion.XMLA.FromMetadata
{
    public class TabularPopulateStarFromViews
    {
        #region Properties

        public PW.XMLA.Writer.TabularXMLAWriter xmlaWriter;
        public PW.XMLA.Reader.CubeDatabase cbNewCube;
        public string srcDBConn;
        public string destTabularConn;
        public string sSchema;
        public string sFieldExcl;
        public string sTableExcl;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        SqlConnection srcKeysConn;
        public string sCubeName;
        public string sConnStringSecurity;
        public string sImpersonationMode;
        public string sImpersonationInfoSecurity;
        public string sUsername;
        public string sPwd;
        public string sCubeDSConn;

        public string sDataSourceID;
        public string sDSVID;
        //SqlConnection srcDimConn;

        #endregion

        public TabularPopulateStarFromViews(
            string pCubeName,
            string pCubeDSConn,
            string pConnStringSecurity,
            string pImpersonationMode,
            string pUsername,
            string pPwd,
            string pImpersonationInfoSecurity,
            string pSrcDBConn,
            string pdestTabularConn,
            string pSchema,
            string pFieldExcl,
            string pTableExcl
            )
        {
            sCubeName = pCubeName;
            sCubeDSConn = pCubeDSConn;
            sConnStringSecurity = pConnStringSecurity;
            sImpersonationMode = pImpersonationMode;
            sUsername = pUsername;
            sPwd = pPwd;
            sImpersonationInfoSecurity = pImpersonationInfoSecurity;


            srcDBConn = pSrcDBConn;
            //srcConn = new SqlConnection(srcDBConn);
            //srcFactConn = new SqlConnection(srcDBConn);

            destTabularConn = pdestTabularConn;
            sSchema = pSchema;
            if (pFieldExcl == "")
            {
                sFieldExcl = "''";
            }
            else
            {
                sFieldExcl = pFieldExcl;
            }
            if (pTableExcl == "")
            {
                sTableExcl = "''";
            }
            else
            {
                sTableExcl = pTableExcl;
            }
        }


        public void CreateCube()
        {
            xmlaWriter = new TabularXMLAWriter();
            xmlaWriter.srcCubeReader = new MultiDimensionalReader();
            xmlaWriter.srcCubeReader.isTabular = true;
            xmlaWriter.srcCubeReader.isTabularSource = true;
            xmlaWriter.srcCubeReader.cbOriginalCube.sID = sCubeName;
            xmlaWriter.srcCubeReader.cbOriginalCube.sName = sCubeName;
            xmlaWriter.sDBName = this.sCubeName;
            xmlaWriter.connDestConnection = this.destTabularConn;
            xmlaWriter.srcCubeReader.cbOriginalCube = this.cbNewCube;
            xmlaWriter.BuildTabularXMLA();
        }


        public CubeDatabase ScanDB()
        {
            #region Setup basic cube
            cbNewCube = new CubeDatabase();
            cbNewCube.sID = this.sCubeName;
            cbNewCube.sName = this.sCubeName;

            this.cbNewCube.lstCubeModels.Add( new XMLAModel(this.sCubeName, this.sCubeName) );
            this.cbNewCube.lstCubeModels[0].mdxScript.Commands.Add( @"CALCULATE; 
CREATE MEMBER CURRENTCUBE.Measures.[__No measures defined] AS 1; 
ALTER CUBE CURRENTCUBE UPDATE DIMENSION Measures, Default_Member = [__No measures defined];");

            #endregion 
            
            
            srcConn = new SqlConnection(this.srcDBConn);
            srcConn.Open();
            
            
            CreateDataSource();
            CreateDSV();
            CreateDimensions();

            return this.cbNewCube;
        }
        /// <summary>
        /// Uses the DSVs from the previous step to create the tables
        /// </summary>
        public void CreateDimensions()
        {
            string sSelect;
            foreach (DSVTable dsvT in this.cbNewCube.lstDSV[0].lstDSVTables)
            {
                sSelect = "SELECT ";
                List<XMLADimensionAttribute> lstXDA = new List<XMLADimensionAttribute>();
                List<XMLAMeasure> lstMeasures = new List<XMLAMeasure>();
                #region Columns
                foreach (DSVColumn dsvC in dsvT.lstColumns)
                {
                    sSelect += dsvC.sDBColumnName + "\n\t,";
                    lstXDA.Add(new XMLADimensionAttribute(
                        dsvC.sFriendlyName
                        , dsvC.sID
                        , dsvC.sDBColumnName
                        , dsvT.sTableName
                        , dsvT.sSchemaName
                        , dsvC.sFriendlyName
                        , dsvC.sType
                        , dsvC.sRestrictionMaxLength
                        , dsvT.sFriendlyName
                        , dsvT.sID
                        ))
                        ;

                    #region Measures

                    if (dsvC.sAggregationType != null && dsvC.sAggregationType != "")
                    {
                        XMLAMeasure xm = new XMLAMeasure(
                            dsvC.sAggregationType + "_" + dsvC.sName
                            , dsvC.sAggregationType + "_" + dsvC.sID
                            , dsvC.sAggregationType
                            , ""
                            , ""
                            , ""
                            , dsvC.sDataType
                            , dsvC.sRestrictionBase
                            , ""
                            , dsvC.sDBColumnName
                            , dsvT.sSchemaName
                            , dsvT.sTableName
                            , dsvT.sFriendlyName //Dimension name
                            , dsvT.sID
                            , dsvC.sName
                            , true
                            );
                        lstMeasures.Add(xm);
                    }




                    #endregion

                }

                #region Measure group
                if (lstMeasures.Count > 0)
                {
                    XMLAMeasureGroup xMG = new XMLAMeasureGroup(dsvT.sFriendlyName, dsvT.sID, this.sDSVID);
                    xMG.lstMeasures = lstMeasures;

                    this.cbNewCube.lstCubeModels[0].lstMeasureGroups.Add(xMG);
                }
                #endregion
                sSelect = sSelect.Substring(0, sSelect.Length - 1);//Remove trailing comma
                sSelect += " FROM [" + dsvT.sSchemaName + "].[" + dsvT.sTableName + "]";

                string sKeyColumn = "";
                if (dsvT.lstKeyColumns.Count > 0)
                {
                    sKeyColumn = dsvT.lstKeyColumns.First();
                }
                #endregion

                #region DimensionSetup
                XMLADimension xDim = new XMLADimension(
                        dsvT.sID
                        , dsvT.sFriendlyName
                        , this.sDataSourceID
                        , this.sDSVID
                        , sSelect
                        , dsvT.sSchemaName
                        , dsvT.sTableName
                        , sKeyColumn
                        , this.sDSVID
                        , false
                        );

                string sHierarchy = "";
                List<XMLADimensionHierarchy> lstXDH = new List<XMLADimensionHierarchy>();
                XMLADimensionHierarchy xDH = null;
                foreach (DSVColumn col in dsvT.lstColumns.FindAll(item => item.sHierarchyName != null).OrderBy(item => item.sHierarchyName).ThenBy(item => item.sHierarchyLevel))
                {

                    if (sHierarchy != col.sHierarchyName)
                    {
                        if (xDH != null)
                        {
                            lstXDH.Add(xDH);
                        }
                        xDH = new XMLADimensionHierarchy(col.sHierarchyName, col.sHierarchyName);
                    }
                    sHierarchy = col.sHierarchyName;
                    XMLADimensionHierarchyLevel xDL = new XMLADimensionHierarchyLevel(col.sID, col.sID, col.sID + "_hier");
                    //We would get duplicate names. Change the original column name. Use a generic suffix in case it's in multiple hierarchies
                    // .... Even though our extended properties model doesn't allow this yet.
                    //Calcs will hopefully be able to use the new level name...
                    lstXDA[lstXDA.FindIndex( item => item.sID == col.sID)]
                        .sAttributeName = col.sFriendlyName + "_" + "hier";
                    lstXDA[lstXDA.FindIndex(item => item.sID == col.sID)]
                        .sName = col.sName + "_" + "hier";
                    lstXDA[lstXDA.FindIndex(item => item.sID == col.sID)]
                        .sID = col.sID + "_" + "hier";
                    xDH.lstLevels.Add(xDL);
                }
                if (xDH != null)
                {
                    lstXDH.Add(xDH);
                }

                xDim.lstDimensionAttributes = lstXDA;
                xDim.lstHierarchies = lstXDH;
                #endregion

                #region ReferenceDimension
                //Set up reference dimensions for all measure groups
                if (dsvT.sXMLATableType == "MeasureGroup")
                {
                    foreach (DSVRelationship dsvR in
                        this.cbNewCube.lstDSV[0].lstRelationships.FindAll(
                        item => item.childTable == dsvT.sTableName
                            && item.childSchema == dsvT.sSchemaName
                        )
                        )
                    {

                        if (!(xDim.lstReferenceDimensions.Exists(item => item.sID == dsvR.sID)))
                        {

                            XMLAReferenceDimension xrDim = new XMLAReferenceDimension(dsvR.ToString()
                                , dsvR.sID
                                , dsvR.childTable
                               , dsvR.childColumn
                                , "Regular"
                                , dsvR.parentTable
                                , dsvR.parentColumn);
                            xDim.lstReferenceDimensions.Add(xrDim);

                            var x = 1;
                        }
                        else
                        {
                            var y = 2;
                        }
                    }
                   
                }

                #endregion
                this.cbNewCube.lstCubeModels[0].lstDimensions.Add(xDim);
                
            }    

        }

        /// <summary>
        /// Adds a single data source pointing to the defined schema
        /// </summary>
        public void CreateDataSource()
        {
            this.sDataSourceID = this.sCubeName + "src";
            XMLADataSource xDS = new XMLADataSource(
                this.sDataSourceID
                , this.sDataSourceID
                , this.sCubeDSConn
                , this.sConnStringSecurity
                , this.sImpersonationMode
                , this.sUsername
                , this.sPwd
                , this.sImpersonationInfoSecurity
                );
            this.cbNewCube.lstDataSources.Add( xDS);
        }
        /// <summary>
        /// Creates a single DSV pointing to the single data source
        /// </summary>
        public void CreateDSV()
        {

            //Create DSV
            DSV dsv = new DSV(this.sSchema, this.sSchema, this.sCubeName + "src");

            #region Fields
            SqlCommand comm;
            SqlCommand commCol;
            SqlDataReader drRefs;
            SqlDataReader drCols;
            //Build field list
            comm = new SqlCommand(string.Format(QC.qryOLAPTablesQuery, this.sTableExcl, this.sSchema), srcConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                this.sDSVID = drRefs.GetString(1);
                DSVTable dsvT = new DSVTable(
                    drRefs.GetString(1)
                    , drRefs.GetString(1)
                    , drRefs.GetString(1)
                    , drRefs.GetString(3)
                    , drRefs.GetString(1)
                    , this.sSchema
                    , drRefs.GetString(4)
                    );
                //System.Boolean.TryParse(drRefs.GetString(5), out dsvT.bCoalesceFields);
                srcFactConn = new SqlConnection(this.srcDBConn);
                srcFactConn.Open();
                commCol = new SqlCommand(string.Format(QC.qryListColumns, drRefs.GetString(1), this.sSchema, this.sFieldExcl), srcFactConn);
                drCols = commCol.ExecuteReader();
                while (drCols.Read())
                {

                    #region Column
                    if (dsvT.sID.Contains("Location"))
                    {
                    }

                    DSVColumn dsvC = new DSVColumn(
                        drCols.GetString(0) //Name
                        , drCols.GetString(0) //ID
                        , drCols.GetString(0) //DBColumnName
                        , drCols.GetString(7) //Friendly Name
                        , drCols.GetString(8) //pType
                        , "" //Computed Expression
                        , "" //RestrictionMaxBase
                        , "");//RestrictionMaxlength

                    //Not needed for the DSV and won't make it into the final code, but will reuse it when creating columns
                    #region Additional Properties
                    if (!drCols.IsDBNull(3))
                    {
                        dsvC.sCharMaxLength = drCols.GetString(3);
                    }
                    if (!drCols.IsDBNull(4))
                    {
                        dsvC.sNumericPrecision = drCols.GetString(4);
                    }
                    if (!drCols.IsDBNull(5))
                    {
                        dsvC.sNumericRadix = drCols.GetString(5);
                    }
                    if (!drCols.IsDBNull(6))
                    {
                        dsvC.sNumericScale = drCols.GetString(6);
                    }
                    if (!drCols.IsDBNull(9))
                    {
                        dsvC.sHierarchyName = drCols.GetString(9);
                    } 
                    if (!drCols.IsDBNull(10))
                    {
                        dsvC.sHierarchyLevel = drCols.GetString(10);
                    }
                    #endregion

                    #region Properties
                    //Setting up the correct types for the DSV
                    if (dsvC.sType.Contains("int"))
                    {
                        dsvC.sType = "Integer";
                        dsvC.sRestrictionBase = "xs:int";
                        dsvC.sRestrictionMaxLength = "-1";
                    }

                    else if (dsvC.sType == "decimal" || dsvC.sType == "numeric" || dsvC.sType == "money"  )
                    {
                        dsvC.sType = "Double";
                        dsvC.sRestrictionBase = "xs:double";
                        dsvC.sRestrictionMaxLength = "-1";
                    }
                    else if (dsvC.sType.Contains("varchar"))
                    {
                        dsvC.sType = "WChar";
                        dsvC.sRestrictionBase = "xs:string" ;
                        dsvC.sRestrictionMaxLength = dsvC.sCharMaxLength;
                        
                    }
                    else if (dsvC.sType == "float")
                    {
                        dsvC.sType = "Double";
                        dsvC.sRestrictionBase = "xs:float";
                        dsvC.sRestrictionMaxLength = "-1";
                    }
                    else if (dsvC.sType == "real" || dsvC.sType == "double")
                    {
                        dsvC.sType = "Double";
                        dsvC.sRestrictionBase = "xs:double";
                        dsvC.sRestrictionMaxLength = "-1";
                    }
                    else
                    {
                        dsvC.sType = "WChar";
                        dsvC.sRestrictionMaxLength = "32768";

                        dsvC.sRestrictionBase = "xs:string";
                    }
                    #endregion

                    //We don't use spatial types in semantic models..
                    if (drCols.GetString(8) != "geography" && drCols.GetString(8) != "geometry")
                    {

                        dsvT.lstColumns.Add(dsvC);
                    }

                    #endregion
                }

                drCols.Close();

                //Build primary keys
                #region Keys 

                commCol = new SqlCommand(string.Format(QC.qryViewPrimaryKeys, this.sSchema, drRefs.GetString(1)), srcFactConn);
                drCols = commCol.ExecuteReader();
                while (drCols.Read())
                {
                    dsvT.lstKeyColumns.Add(drCols.GetString(4));
                }
                drCols.Close();

                dsv.lstDSVTables.Add(dsvT);
                #endregion 
            }
            drRefs.Close();
            #endregion

            #region  Relationships
            //Build relationships list
            comm = new SqlCommand(string.Format(QC.qryViewReferences, this.sSchema), srcFactConn);
            
            drRefs = comm.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(drRefs);
            foreach (DSVTable dTable in dsv.lstDSVTables)
            {
                DataRow[] lstRows ;
                lstRows = dt.Select("VIEW_NAME = '" + dTable.sID + "'");
                foreach (DataRow dr in lstRows)
                {
                    DSVRelationship dsvR = new DSVRelationship();
                    
                    dsvR.parentSchema = this.sSchema;
                    dsvR.parentTable = dr["UNIQUE_TABLE_NAME"].ToString();
                    dsvR.parentColumn = dr["UNIQUE_COLUMN_NAME"].ToString();
                    dsvR.childSchema = this.sSchema;
                    dsvR.childTable =  dr["TABLE_NAME"].ToString();
                    dsvR.childColumn = dr["COLUMN_NAME"].ToString();
                    dsvR.sID = dsvR.parentTable + "-" + dsvR.childColumn;
                    dsv.lstRelationships.Add(dsvR);
                }
            }

            drRefs.Close();

            this.cbNewCube.lstDSV.Add(dsv);
            #endregion


        }
        #region Commented Out
        /*public 
            void PopulateFactTable(string pSchemaTable, string pTableName, string pFieldExcl, string pTableExcl, ref List<TableColumn> lstTC)
        {
            SqlCommand comm;
            SqlDataReader drRefs;
            //Build field list
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl), srcFactConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                //AddTC(pTableName, ref lstTC, drRefs);
            }
            drRefs.Close();

        }
         * */
        /*
        private void AddTC(string pTableName, ref List<TableColumn> lstTC, SqlDataReader drRefs)
        {
            switch (drRefs.GetString(2))
            {
                case "varchar":
                case "nvarchar":

                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , drRefs.GetString(1)
                            , drRefs.GetString(2)
                            , drRefs.GetString(3)
                            ));
                    break;
                case "decimal":
                case "tinyint":
                case "smallint":
                case "bigint":
                case "money":
                case "numeric":

                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , drRefs.GetString(1)
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , drRefs.GetString(6)
                            ));
                    break;
                case "float":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , drRefs.GetString(1)
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , "0"
                            ));
                    break;
            }
        }
    */
        #endregion

    }

}
