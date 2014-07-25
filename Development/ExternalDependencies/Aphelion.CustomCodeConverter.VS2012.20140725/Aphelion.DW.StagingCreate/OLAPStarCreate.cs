using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using Aphelion.DW.StagingCreate.Schema;
using Aphelion.DW.Shared;

namespace Aphelion.DW.StagingCreate
{
    public class OLAPStarCreate
    {
        
        #region Properties

        public Dictionary<string, SchemaTable> lstTS = new Dictionary<string, SchemaTable>();

        public string srcDBConn;
        public string destDBConn;
        public string sSchema;
        public string sFactTablePrefix;
        public string sDimTablePrefix;
        public string sFieldExcl;
        public string sTableExcl;
        public string sFactFilter;
        public string sDimFilter;
        public bool bUseSchemaFilter;
        SqlConnection srcConn;
        SqlConnection srcFactConn;
        //SqlConnection srcDimConn;
        SqlConnection destConn;
        public string strFullCreate;

        #endregion

        public OLAPStarCreate(
            string pSrcDBConn,
            string pdestDBConn,
         string pSchema,
         string pFactTablePrefix,
        string pDimTablePrefix,
         string pFieldExcl,
         string pTableExcl,
            string pFactFilter,
            string pDimFilter,
            bool pUseSchemaFilter
                )
        {
             srcDBConn = pSrcDBConn;
             destDBConn = pdestDBConn;
             sSchema = pSchema;
             sFactTablePrefix = pFactTablePrefix;
             sDimTablePrefix = pDimTablePrefix;
             sFieldExcl = pFieldExcl;
             sTableExcl = pTableExcl;
             sFactFilter = pFactFilter;
             sDimFilter = pDimFilter;
             bUseSchemaFilter = pUseSchemaFilter;
        }

        public void RunScript()
        {
            string[] strCommands = this.strFullCreate.Split( new string[] {"GO"}, StringSplitOptions.None);
            SqlCommand comm = new SqlCommand(this.strFullCreate, this.destConn);
            foreach (string strComm in strCommands)
            {

                comm.CommandText = strComm;
                comm.ExecuteNonQuery();
            }
        }

        public string OutputScript()
        {
            this.strFullCreate = string.Format(QC.qryCreateSchema, this.sSchema);

            foreach (KeyValuePair<string, SchemaTable> kv in lstTS)
            {
                this.strFullCreate +=
                    kv.Value.CreateStatement;
            }
            return strFullCreate;
        }


        public void CreateScript()
        {
            srcConn = new SqlConnection(this.srcDBConn);
            srcConn.Open();
            srcFactConn = new SqlConnection(this.srcDBConn);
            srcFactConn.Open();
            destConn = new SqlConnection(this.destDBConn);
            destConn.Open();

            SqlCommand command = srcConn.CreateCommand();
            if (!bUseSchemaFilter)
            {
                command.CommandText = string.Format(QC.qryTableQuery, this.sFactTablePrefix);
            }
            else
            {
                command.CommandText = string.Format(QC.qryTableQueryBySchema, this.sFactTablePrefix);
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

                if (!lstTS.ContainsKey(sSchemaTable + "." + sTableName))
                {
                    sCreate = BuildFactTableCreate(sSchemaTable, sTableName, sFieldExcl, sFactFilter, sDimFilter);
                    lstTS.Add(sSchemaTable + "." + sTableName, new SchemaTable(sSchemaTable, sTableName, sCreate));
                }

                //drFacts.Read();

            }
        }

        public string BuildFactTableCreate(string pSchemaTable, string pTableName, string pFieldExcl, string pFactFilter, string pDimFilter)
        {
            string strCreate;
            string strExProps = "";
            //List<TableColumn> tcLst = new List<TableColumn>();
            SqlCommand comm ;
            SqlDataReader drRefs ;
            string strColumnProps = "";
            //Build field list
            string strColumnList = "";
            bool bCoalesce = false;
            comm = new SqlCommand(string.Format(QC.qryListColumns, pTableName, pSchemaTable, pFieldExcl), srcFactConn);
            drRefs = comm.ExecuteReader();
            drRefs.Read();
            strColumnList = string.Format("\n\t[{0}]", drRefs.GetString(0));
            //////drRefs.Read();
            while (drRefs.Read())
            {
                strColumnList += string.Format("\n\t,[{0}]", drRefs.GetString(0));
                #region Column Properties
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcSchema"
                    , pSchemaTable
                    , this.sSchema
                    , pTableName
                    , drRefs.GetString(0)
                    );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcTable"
                        , pTableName
                        , this.sSchema
                        , pTableName
                        , drRefs.GetString(0)
                        );


                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcColumn"
                        , drRefs.GetString(0)
                        , this.sSchema
                        , pTableName
                        , drRefs.GetString(0)
                        );
                #endregion
                //drRefs.Read();
            }
            strCreate = string.Format(QC.qryCreateFactView,
                this.sSchema
                , pTableName
                , strColumnList
                , pSchemaTable
                , pFactFilter
                );
            drRefs.Close();

            //Build related tables 
            if (sTableExcl != "") 
            {
                comm = new SqlCommand(string.Format(QC.qryReferenceQueryExcl, pSchemaTable, pTableName, sTableExcl, "''"), srcFactConn);
            
            } else {
                comm = new SqlCommand(string.Format(QC.qryReferenceQuery, pSchemaTable, pTableName), srcFactConn);
            }
            drRefs = comm.ExecuteReader();
            
            //drRefs.Read();
            string sDimTable = "";
            string sDimSchema = "";
            while (drRefs.Read())
            {
                if (drRefs.GetString(6).Contains("Active"))
                {
                }
                #region References
                if (sDimTable != drRefs.GetString(6) || 
                    sDimSchema != drRefs.GetString(5)) {
                    
                    sDimTable = drRefs.GetString(6);
                    sDimSchema = drRefs.GetString(5);


                    if (!lstTS.ContainsKey(sDimSchema + "." + sDimTable))
                    {

                        System.Boolean.TryParse(drRefs.GetString(9), out bCoalesce);
                        lstTS.Add(sDimSchema + "." + sDimTable
                            , new SchemaTable(
                                sDimSchema
                                , sDimTable

                                , BuildDimensionTableCreate(sDimSchema, sDimTable, pFieldExcl, pDimFilter, bCoalesce)));
                    }

                    }
                #endregion

                //drRefs.Read();
            }

            drRefs.Close();
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pTableName, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
                //string sAlias = 
                strExProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pTableName
                    , drProps.GetString(2)
                    );
                #endregion
            }
            drProps.Close();

            strExProps += @"
    GO    
" + string.Format(QC.qryAddExtendedPropertyView
                    , "XMLATableType"
                    , "MeasureGroup"
                    , this.sSchema
                    , pTableName
                    );

            strCreate += strExProps;
            strCreate += strColumnProps;    

            return strCreate;

        }

        public string BuildDimensionTableCreate(string pDimSchema, string pDimName, string pFieldExcl, string pDimFilter, bool pCoalesceFields)
        {
            string strColumnProps = "";
            string strCreate = "";
            List<TableColumn> tcList = new List<TableColumn>();
            string strJoins = "";
            SqlCommand comm;
            SqlDataReader drRefs;
            
            //Build field list
            string strColumnList = "";
            SqlConnection srcDimConn = new SqlConnection(this.srcDBConn);
            srcDimConn.Open();
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryDimColumns, pDimName, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix);
            drRefs = comm.ExecuteReader();
             
            while (drRefs.Read())
            {
                ///TODO: This looks up a single table. Problem is that one table may be linked twice?
                ///Column should take care of that...
                if (!tcList.Exists(item => item.TableName == pDimName && item.ColumnName == drRefs.GetString(0)))
                {
                    tcList.Add(new TableColumn(pDimName, drRefs.GetString(0), drRefs.GetString(1)));
                }
 
            }

            drRefs.Close();
            //Build related tables 
            #region Related Tables
            comm = srcDimConn.CreateCommand();
            if (sTableExcl != "")
            {
                comm.CommandText =string.Format(QC.qryReferenceQueryExcl, pDimSchema, pDimName, sTableExcl, "''") ;

            }
            else
            {
                comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimName);
            }
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sColumnName = "";
            string sConstraintSchema = "";
            string sConstraintName = "";
            string sDimTable = "";
            string sDimSchema = "";
            string sJoinTable = "";
            string sJoinSchema = "";
            string strChildJoins = "";
            string strExProps = "";
            string strAddJoins = "";
            string sJoinAlias = "";
            string sJoinAliasHash = "";
            string sSourceAlias = "";
            string sAltColumn = "";
            bool bCoalesce = false;
            //List<TableColumn> lstTC;
            while (drRefs.Read())
            {

                if (sDimSchema != drRefs.GetString(2) ||
                    sDimTable != drRefs.GetString(3) ||
                    sJoinSchema != drRefs.GetString(5) ||
                    sJoinTable != drRefs.GetString(6) ||
                    sConstraintSchema != drRefs.GetString(0) ||
                    sConstraintName != drRefs.GetString(1)

                    )
                {
                    //strJoins += strChildJoins; //Interleaving
                    strChildJoins = "";
                    strJoins += strAddJoins;
                    strAddJoins = "";
                    sDimSchema = drRefs.GetString(2);
                    sDimTable = drRefs.GetString(3);
                    sColumnName = drRefs.GetString(4);
                    
                    sJoinSchema = drRefs.GetString(5);
                    sJoinTable = drRefs.GetString(6);
                    sAltColumn = drRefs.GetString(7);
                    sConstraintSchema = drRefs.GetString(0);
                    sConstraintName = drRefs.GetString(1);
                    System.Boolean.TryParse(drRefs.GetString(9), out bCoalesce);
                    foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                            && item.ColumnName == sColumnName
                            ))
                    {
                        tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                            && item.TableName == sJoinTable
                            )].TableAlias = sJoinAlias;
                    }

                    sSourceAlias = tcList.First(item => item.TableName == drRefs.GetString(3)).TableAlias;

                    List<TableColumn> test = tcList.FindAll(item => item.TableName == drRefs.GetString(3));

                    //Prefixing with the source alias we're joining from, for queries that may go to the same table multiple times, e.g. Active
                    sJoinAlias = sSourceAlias + "_" + sJoinTable + "_" + sColumnName;
 
                    sJoinAliasHash = sJoinTable + "_" + Extensions.HashFNV1a_64_ABS(sJoinAlias).ToString();


                    AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pDimName);

                    if (drRefs.GetString(8) == "YES")
                    {
                        strJoins += string.Format(QC.qryInterLeftJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ sSourceAlias + "_" + Extensions.HashFNV1a_64_ABS(sSourceAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    else
                    {
                        strJoins += string.Format(QC.qryInterJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ sSourceAlias + "_" + Extensions.HashFNV1a_64_ABS(sSourceAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    
                }
                else
                {
                    /*strAddJoins += string.Format(QC.qryJoinsAnd
                        , drRefs.GetString(3) //Ref table
                        , drRefs.GetString(4) //Ref Column
                        , drRefs.GetString(6) //Unique Table
                        , drRefs.GetString(7) //Unique Column
                        );
                     */
                    strAddJoins += string.Format(QC.qryJoinsAnd
                        /*, drRefs.GetString(3) //Ref table*/
                        , sJoinAliasHash /*Reusing from prev calc*/
                        , drRefs.GetString(4) //Ref Column
                        , drRefs.GetString(6) //Unique Table
                        , drRefs.GetString(7) //Unique Column
                        );

                    
                }

                //drRefs.Read();
            }


            strJoins += strAddJoins;
            #endregion

            string sTableAlias;
            sTableAlias = tcList[0].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[0].TableAlias).ToString();

            #region AddColumns
            //strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", tcList[0].TableName, tcList[0].ColumnName, tcList[0].Alias);
            strColumnList = string.Format("\n\t[{0}].[{1}] AS [{2}]", sTableAlias, tcList[0].ColumnName, tcList[0].Alias);
            #region Column Properties
            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                , "SrcSchema"
                , pDimSchema
                , this.sSchema
                , pDimName
                , tcList[0].Alias
                );

            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcTable"
                    , tcList[0].TableName
                    , this.sSchema
                    , pDimName
                    , tcList[0].Alias
                    );

            strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcColumn"
                    , tcList[0].ColumnName
                    , this.sSchema
                    , pDimName
                    , tcList[0].Alias
                    );
            #endregion

            for(int iLoop =1; iLoop < tcList.Count; iLoop++) 
            {
                //strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", tcList[iLoop].TableName, tcList[iLoop].ColumnName, tcList[iLoop].Alias);
                //Substringing to left 128
                string sAlias;
                if (tcList[iLoop].Alias.Length > 128)
                {
 
                    sAlias = tcList[iLoop].Alias.Substring(0,127);
                } else {
                    sAlias = tcList[iLoop].Alias;
                }

                sTableAlias = tcList[iLoop].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[iLoop].TableAlias).ToString();

                if (pCoalesceFields)
                {
                    if (tcList[iLoop].lstDuplicatedTableColumns.Count == 0)
                    {
                        strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", sTableAlias, tcList[iLoop].ColumnName, sAlias);
                    }
                    else
                    {
                        string sAddColumns = "";
                        foreach (TableColumn TCInner in tcList[iLoop].lstDuplicatedTableColumns)
                        {

                            sAddColumns += string.Format(", [{0}].[{1}]",
                                TCInner.TableName + "_" + Extensions.HashFNV1a_64_ABS(TCInner.TableAlias).ToString()
                                , TCInner.ColumnName
                                );
                        }
                        strColumnList += string.Format("\n\t,COALESCE([{0}].[{1}] {2} ) AS [{3}]", sTableAlias, tcList[iLoop].ColumnName, sAddColumns, sAlias);
                    
                    }
                }
                else
                {
                    strColumnList += string.Format("\n\t,[{0}].[{1}] AS [{2}]", sTableAlias, tcList[iLoop].ColumnName, sAlias);
                }

                #region Column Properties
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , "SrcSchema"
                    , pDimSchema
                    , this.sSchema
                    , pDimName
                    , tcList[iLoop].Alias
                    );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcTable"
                        , tcList[iLoop].TableName
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );

                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "SrcColumn"
                        , tcList[iLoop].ColumnName
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );
                strColumnProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                        , "HierarchyLevel"
                        , tcList[iLoop].HierarchyLevel
                        , this.sSchema
                        , pDimName
                        , tcList[iLoop].Alias
                        );
                #endregion

            }
            #endregion
            //For use in table aliasing
            sTableAlias = tcList[0].TableName + "_" + Extensions.HashFNV1a_64_ABS(tcList[0].TableAlias).ToString();

            //Close up
            //strJoins += strChildJoins;
            strJoins += strAddJoins;
            drRefs.Close();
            srcDimConn.Close();
            ///TODO: Check that assuming the first column is always part of the main table is correct
            /*strCreate = string.Format(QC.qryCreateDimView,
                this.sSchema
                , pDimName
                , strColumnList
                , pDimSchema
                , strJoins
                , pDimFilter
                );
*/
            strCreate = string.Format(QC.qryCreateDimViewAliased,
                this.sSchema
                , pDimName
                , strColumnList
                , pDimSchema
                , sTableAlias
                , strJoins
                , pDimFilter
                );
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();

            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimName, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties
                string sAlias = tcList.Find(item => item.TableName == pDimName
                    && item.ColumnName == drProps.GetString(2)).Alias;

                strExProps += @"
    GO    
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pDimName
                    , sAlias
                    );
                #endregion
            }
            drProps.Close();


            strCreate += strExProps;

            strCreate += strColumnProps;
            return strCreate ;
        }


        public void AddDimensionFields(string pDimSchema, string pDimTable,string pDimAlias,  string pDimFilter, string pFieldExcl, ref List<TableColumn> tcList, ref string strJoins, ref string strExProps, string pRootDimName, int pHierarchyLevel = 1)
        {

            #region Cols
            SqlCommand comm;
            SqlDataReader drRefs;

            //Build field list
            SqlConnection srcDimConn = new SqlConnection(this.srcDBConn);
            
            srcDimConn.Open();
            comm = srcDimConn.CreateCommand();
            comm.CommandText = string.Format(QC.qryDimColumns, pDimTable, this.sDimTablePrefix, pFieldExcl, pDimSchema, this.sDimTablePrefix);
            if (pDimTable.Contains("Region"))
            {
            }
            drRefs = comm.ExecuteReader();
            if (drRefs.HasRows)
            {
                while (drRefs.Read())
                {
                    var Zero = drRefs.GetString(0);
                    var One = drRefs.GetString(1);
                    var Two = drRefs.GetString(2);
                    if (!(tcList.Exists(item => item.ColumnName == drRefs.GetString(0)
                            && item.TableName == drRefs.GetString(2)
                        )))
                    {
                        if (!tcList.Exists(item => item.ColumnName == drRefs.GetString(1)))
                        {
                            TableColumn TC = new TableColumn(pDimTable, drRefs.GetString(0), drRefs.GetString(1), pHierarchyLevel);
                            TC.TableAlias = pDimAlias;
                            tcList.Add(TC);
                        }
                        else
                        {
                            //Adding to the list of columns we may want to coalesce in the view
                            if (!(tcList.Exists(item => item.ColumnName == drRefs.GetString(0)
                            && item.TableName == drRefs.GetString(2)
                            && item.TableAlias == pDimAlias
                            )))
                            {
                                TableColumn TC = new TableColumn(pDimTable, drRefs.GetString(0), drRefs.GetString(1), pHierarchyLevel);
                                TC.TableAlias = pDimAlias;

                                tcList.Find(item => item.ColumnName == drRefs.GetString(0) )
                                .lstDuplicatedTableColumns.Add(TC);
                            }
                        }
                    }
                    else
                    {
                        //Adding to the list of columns we may want to coalesce in the view
                        if (!(tcList.Exists(item => item.ColumnName == drRefs.GetString(0)
                            && item.TableName == drRefs.GetString(2)
                            && item.TableAlias == pDimAlias
                        )))
                        {
                            TableColumn TC = new TableColumn(pDimTable, drRefs.GetString(0), drRefs.GetString(1), pHierarchyLevel);
                            TC.TableAlias = pDimAlias;

                            tcList.Find(item => item.ColumnName == drRefs.GetString(0)
                            && item.TableName == drRefs.GetString(2))
                            .lstDuplicatedTableColumns.Add(TC);
                        }
                    }
                    //strColumnList += string.Format("\n\t,{0}", drRefs.GetString(0));
                    //drRefs.Read();
                }

            }

            drRefs.Close();
            
            #endregion

            #region refs
            //Build related tables 
            comm = srcDimConn.CreateCommand();
            if (sTableExcl != "")
            {
                comm.CommandText = string.Format(QC.qryReferenceQueryExcl, pDimSchema, pDimTable, sTableExcl, "''") ;
            }
            else
            {
                comm.CommandText = string.Format(QC.qryReferenceQuery, pDimSchema, pDimTable);
            }
            drRefs = comm.ExecuteReader();
            //drRefs.Read();
            string sColumnName = "";
            string sDimTable = "";
            string sDimSchema = "";
            string sJoinTable = "";
            string sJoinSchema = "";
            string strChildJoins = "";
            string strAddJoins = "";
            string sJoinAlias = "";
            string sJoinAliasHash = "";
            string sConstraintSchema = "";
            string sConstraintName = "";
            string sSourceAlias = "";
            string sAltColumn = "";

            while (drRefs.Read())
            {

                if (sDimSchema != drRefs.GetString(2) || 
                    sDimTable != drRefs.GetString(3) ||
                    sJoinSchema != drRefs.GetString(5) ||
                    sJoinTable != drRefs.GetString(6) ||
                    sConstraintSchema != drRefs.GetString(0) ||
                    sConstraintName != drRefs.GetString(1) 
                    )

                {
                    //strJoins += strChildJoins;
                    strChildJoins = "";
                    strJoins += strAddJoins;
                    strAddJoins = "";
                    sDimSchema = drRefs.GetString(2);
                    sDimTable = drRefs.GetString(3);
                    sColumnName = drRefs.GetString(4);
                    sJoinSchema = drRefs.GetString(5);
                    sJoinTable = drRefs.GetString(6);
                    sConstraintSchema = drRefs.GetString(0);
                    sConstraintName = drRefs.GetString(1);
                    sAltColumn = drRefs.GetString(7);
                    
                    foreach (TableColumn TC in tcList.FindAll(item => item.TableName == sJoinTable
                        && item.ColumnName == sColumnName
                            ))
                    {
                        tcList[tcList.FindIndex(item => item.ColumnName == TC.ColumnName
                            && item.TableName == sJoinTable
                            )].TableAlias = sJoinAlias;
                    }

                    sSourceAlias = tcList.First(item => item.TableName == drRefs.GetString(3)).TableAlias;

                    List<TableColumn> test = tcList.FindAll(item => item.TableName == drRefs.GetString(3));

                    //Prefixing with the source alias we're joining from, for queries that may go to the same table multiple times, e.g. Active
                    //sJoinAlias = sSourceAlias + "_" + sJoinTable + "_" + sColumnName;
                    ///TODO: Check that we're using the correct alias
                    sJoinAlias = pDimAlias + "_" + sJoinTable + "_" + sColumnName;
 
                    sJoinAliasHash = sJoinTable + "_" + Extensions.HashFNV1a_64_ABS(sJoinAlias).ToString();

                    AddDimensionFields(sJoinSchema, sJoinTable, sJoinAlias, sDimFilter, pFieldExcl, ref tcList, ref strChildJoins, ref strExProps, pRootDimName, pHierarchyLevel + 1);


                    if (drRefs.GetString(8) == "YES")
                    {
                        strJoins += string.Format(QC.qryInterLeftJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ /*sSourceAlias*/pDimTable + "_" + Extensions.HashFNV1a_64_ABS(pDimAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn 
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    else
                    {
                        strJoins += string.Format(QC.qryInterJoins
                            , sJoinSchema
                            , /*drRefs.GetString(3)*/ /*sSourceAlias*/pDimTable + "_" + Extensions.HashFNV1a_64_ABS(pDimAlias).ToString()
                            , sColumnName
                            , sJoinTable
                            , sAltColumn 
                            , sJoinAliasHash //Table Alias
                            , strChildJoins
                            );
                    }
                    
                }
                else
                {
                    strAddJoins += string.Format(QC.qryJoinsAnd
                        , drRefs.GetString(3)
                        , drRefs.GetString(4)
                        , drRefs.GetString(6)
                        , drRefs.GetString(7)
                        );
                    
                }

                //drRefs.Read();
            }
            //Close up
            //strJoins += strChildJoins;
            strJoins += strAddJoins;
            drRefs.Close();
            srcDimConn.Close();

            #endregion
            SqlConnection srcPropConn = new SqlConnection(this.srcDBConn);
            srcPropConn.Open();
            SqlCommand commProp = new SqlCommand(string.Format(QC.qryGetExtendedProperties, pDimTable, pFieldExcl), srcPropConn);
            SqlDataReader drProps;

            
            drProps = commProp.ExecuteReader();
            while (drProps.Read())
            {
                #region Extended Properties

                var tcItem = tcList.Find(item => item.TableName == pDimTable
                    && item.ColumnName == drProps.GetString(2));
                if (!(tcItem == null))
                {
                    string sAlias = tcItem.Alias;
                    strExProps += @"
    GO  
" + string.Format(QC.qryAddExtendedProperty
                    , drProps.GetString(0)
                    , drProps.GetString(1)
                    , this.sSchema
                    , pRootDimName
                    , sAlias
                    );
                
                }
                else
                {
                }

                #endregion
            }
            drProps.Close();
            srcPropConn.Close();
            
        }

    }
}
