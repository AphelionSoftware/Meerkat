using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;

namespace Aphelion.DW.StagingCreate
{
    public class StagingCreate
    {

#region Properties
        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();

        public string srcDBConn;
        public string sStageDB;
        public string sSchema;
        public string sFactTablePrefix;
        public string sDimTablePrefix;
        public string sFieldExcl;
        public string sTableExcl;
        public string sFactFilter;
        public string sDimFilter;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        SqlConnection srcDimConn;
        SqlConnection destConn;
        public string strFullCreate;
        public bool bDropStage;
        public bool bInclKeys;
        public bool bInclRefKeys;
        public string strTableExcl;
        public string strSchemaExcl;
        public string strSrcKeyName = "SourceKey";
            



#endregion
       

        public StagingCreate(
            string pSrcDBConn,
            string pStageDB,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl
            ,string pSrcKey
            , bool pDropStage
                )
        {
             srcDBConn = pSrcDBConn;
             sStageDB = pStageDB;
             sSchema = pSchema;
             sFactTablePrefix = pFactTablePrefix;
             sDimTablePrefix = pDimTablePrefix;
             sFieldExcl = pFieldExcl;
             bDropStage = pDropStage;
            bInclKeys = true;
            bInclRefKeys = false;
            strTableExcl = "";
            strSchemaExcl = "";
            strSrcKeyName = pSrcKey;
        
             }


        public StagingCreate(
            string pSrcDBConn,
            string pStageDB,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl
            , bool pDropStage
            , bool pInclKeys
            , bool pInclRefKeys
            , string pTableExcl
            , string pSchemaExcl
             , string pSrcKey
           
                )
        {
            srcDBConn = pSrcDBConn;
            sStageDB = pStageDB;
            sSchema = pSchema;
            sFactTablePrefix = pFactTablePrefix;
            sDimTablePrefix = pDimTablePrefix;
            sFieldExcl = pFieldExcl;
            bDropStage = pDropStage;
            bInclKeys = pInclKeys;
            bInclRefKeys = pInclRefKeys;
            strTableExcl = pTableExcl;
            strSchemaExcl = pSchemaExcl;
            strSrcKeyName = pSrcKey;
        
        
        }


        public void CreateScript()
        {
            srcConn = new SqlConnection(this.srcDBConn);
            srcConn.Open();
            srcFactConn = new SqlConnection(this.srcDBConn);
            srcFactConn.Open();
            srcDimConn = new SqlConnection(this.srcDBConn);
            srcDimConn.Open();
            
            
            SqlCommand command = srcConn.CreateCommand();

            if (this.strTableExcl == "") this.strTableExcl = "''";
            if (this.strSchemaExcl == "") this.strSchemaExcl = "''";

            if (this.sFactTablePrefix == "" )
            {
                command.CommandText = string.Format(QC.qryTableQueryExcl, this.strTableExcl,this.strSchemaExcl);
            
            }
            else 
            {
                command.CommandText = string.Format(QC.qryTableQuery, this.sFactTablePrefix);
            }

            SqlDataReader drFacts = command.ExecuteReader();
            string sSchemaTable;
            string sTableName;
            string sCreate;
            //drFacts.Read();
            while (drFacts.Read())
            {
                sSchemaTable = drFacts.GetString(0);
                sTableName = drFacts.GetString(1);
                List<TableColumn> lstTC = new List<TableColumn>();
                sCreate = BuildTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter, ref lstTC);
                lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate, lstTC));
            
                //drFacts.Read();

            }
            drFacts.Close();

            //If we ignore prefixes, we just need the fact build
            if (this.sFactTablePrefix != "" || this.sDimTablePrefix != "")
            {
                command.CommandText = string.Format(QC.qryTableQuery, this.sDimTablePrefix);

                SqlDataReader drDims = command.ExecuteReader();
                //drFacts.Read();
                while (drDims.Read())
                {
                    sSchemaTable = drDims.GetString(0);
                    sTableName = drDims.GetString(1);
                    List<TableColumn> lstTC = new List<TableColumn>();
                    if (!lstTS.Any(item => item.Key == sSchemaTable + "." + sTableName))
                    {
                        sCreate = BuildTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter, ref lstTC);
                        lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate, lstTC));
                    }
                }
                drDims.Close();
            }
            this.strFullCreate = "";
            if (this.bDropStage)
            {
                this.strFullCreate += string.Format(QC.qryDropDB, this.sStageDB);    
            }
            this.strFullCreate += string.Format(QC.qryCreateDB, this.sStageDB);

            this.strFullCreate += string.Format(QC.qryUse, this.sStageDB);

            this.strFullCreate += string.Format(QC.qryCreateSchema, this.sSchema);

            foreach( KeyValuePair<string, SchemaTable> st in lstTS)
            {
                if (st.Value.lstTC != null &&  st.Value.lstTC.Count > 0)
                {
                    this.strFullCreate += st.Value.CreateStatement;
                }
            }

        }

        public string OutputScript()
        {
            return this.strFullCreate;
        }

        public string BuildTableCreate(string pSchemaTable, string pTableName, string pFieldExcl, string pFactFilter, string pDimFilter, ref List<TableColumn> lstTC)
        {
            string strCreate;
            SqlCommand comm;
            SqlDataReader drRefs;
            //Build field list
            string strColumnList = "";
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl), srcFactConn);
            drRefs = comm.ExecuteReader();
            while (drRefs.Read())
            {
                if (drRefs.GetBoolean(11) != true)
                {
                    AddTC(pTableName, ref lstTC, drRefs);
                }
            }
            drRefs.Close();

            //Build related tables 

            if (this.sFactTablePrefix == "")
            {
                comm = new SqlCommand(string.Format(QC.qryReferenceQueryExcl, pSchemaTable, pTableName, this.strTableExcl, this.strSchemaExcl), srcFactConn);
            
            }
            else
            {
                comm = new SqlCommand(string.Format(QC.qryReferenceQuery, pSchemaTable, pTableName), srcFactConn);
            }
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sDimTable = "";
            string sDimSchema = "";
            string sColumnName = "";
            string sDimColumnName = "";
            string sIsNullable = "";
            while (drRefs.Read())
            {

                //Remove referential columns from list of columns
                if (!bInclRefKeys)
                {
                    lstTC.RemoveAll(item =>
                        item.TableName == drRefs.GetString(3)
                                    && item.ColumnName == drRefs.GetString(4));
                }

                //Remove primary keys from generated tables
                if (!bInclKeys)
                {
                    SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, drRefs.GetString(2), drRefs.GetString(3)), srcDimConn);
                    SqlDataReader drKeys = comm2.ExecuteReader();
                    while (drKeys.Read())
                    {
                        lstTC.RemoveAll(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2)); //column name
                
                    }
                    drKeys.Close();
            
                }
                    //Otherwise make them nullable to allow for inserts
                else
                {
                    SqlCommand comm2 = new SqlCommand(string.Format(QC.qryPrimaryColumns, drRefs.GetString(2), drRefs.GetString(3)), srcDimConn);
                    SqlDataReader drKeys = comm2.ExecuteReader();
                    while (drKeys.Read())
                    {
                        if (!lstTC.Exists(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2))
                                    )
                        {
                            //We removed the primary key due to a self-referencing relationship perhaps
                            lstTC.Add(new TableColumn(drKeys.GetString(1), drKeys.GetString(2)));
                        }

                        lstTC.Find(item =>
                        item.TableName == drKeys.GetString(1) //Table name
                                    && item.ColumnName == drKeys.GetString(2))
                                    .Nullable = "NULL"
                                    ; //column name

                    }
                    drKeys.Close();
                }


                if (sDimTable != drRefs.GetString(6) ||
                    sDimSchema != drRefs.GetString(5))
                {

                    sDimTable = drRefs.GetString(6);
                    sDimSchema = drRefs.GetString(5);
                    sDimColumnName = drRefs.GetString(7);
                    sColumnName = drRefs.GetString(4);
                    sIsNullable = drRefs.GetString(8);

                    if (lstTC.Exists(item => item.ColumnName == sColumnName))
                    {
                        lstTC.Remove(lstTC.Find(item => item.ColumnName == sColumnName));

                    }
                    //lstTC.Add(new TableColumn(pTableName, sDimTable.Replace(this.sDimTablePrefix, "", StringComparison.CurrentCultureIgnoreCase) + "SourceKey", "NO", "varchar", "255"));
                    lstTC.Add(new TableColumn(pTableName, sDimTable.Replace(this.sDimTablePrefix, "", StringComparison.CurrentCultureIgnoreCase) + this.strSrcKeyName, sIsNullable, "varchar", "255"));
                    /*if (!lstTS.ContainsKey(sDimSchema + "." + sDimTable))
                    {
                        lstTS.Add(sDimSchema + "." + sDimTable
                            , new SchemaTable(
                                sDimSchema
                                , sDimTable

                                , BuildDimensionTableCreate(sDimSchema, sDimTable, pFieldExcl, pDimFilter)));
                    }*/

                }

                //drRefs.Read();
            }

            drRefs.Close();
            strColumnList = AddColumn(lstTC, 0);
            for (int iLoop = 1; iLoop < lstTC.Count; iLoop++)
            {
                strColumnList += "," + AddColumn(lstTC, iLoop);
                }

            strCreate = string.Format(QC.qryCreateStageTable,
                this.sSchema
                , pTableName
                , strColumnList
                );
            

            return strCreate;

        }

        private static string AddColumn(List<TableColumn> lstTC, int iLoop)
        {
            if (iLoop >= lstTC.Count)
            {
                return "";
            }
            string strColumnList = "";
            switch (lstTC[iLoop].DataType)
            {
                case "datetime":
                case "datetime2":
                case "date":
                    strColumnList = string.Format("\n\t[{0}] {1} {2}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].Nullable);
                    
                    break;
                case "char":
                case "nchar":
                case "varchar":
                case "nvarchar":
                    strColumnList = string.Format("\n\t[{0}] {1}({2}) {3}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].CharacterLength, lstTC[iLoop].Nullable);
                    break;
                case "decimal":
                case "numeric":
                    strColumnList = string.Format("\n\t[{0}] {1}({2},{3}) {4}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].NumericPrecision, lstTC[iLoop].NumericScale, lstTC[iLoop].Nullable);

                    break;


                case "tinyint":
                case "int":
                case "smallint":
                case "bigint":
                case "money":
                case "float":
                
                    strColumnList = string.Format("\n\t[{0}] {1} {2}", lstTC[iLoop].ColumnName, lstTC[iLoop].DataType, lstTC[iLoop].Nullable);

                    break;

            }
            return strColumnList;
        }

        private static void AddTC(string pTableName, ref List<TableColumn> lstTC, SqlDataReader drRefs)
        {
            switch (drRefs.GetString(2))
            {
                case "datetime":
                case "datetime2":
                case "date":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , drRefs.GetString(1)
                            , drRefs.GetString(2)
                            ));
                    break;
                    ///TODO:Test dates
                case "char":
                case "nchar":
                case "varchar":
                case "nvarchar":

                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , drRefs.GetString(1)
                            , drRefs.GetString(2)
                            , drRefs.GetString(3)
                            ));
                    break;
                case "int":
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
        public string BuildDimensionTableCreate(string pDimSchema, string pDimName, string pFieldExcl, string pDimFilter)
        {
            return "";
        }

    }
}
