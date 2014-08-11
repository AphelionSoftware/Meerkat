using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Aphelion.DW.StagingCreate.Schema
{
    public static class SC
    {
        public static string AddColumn(List<TableColumn> lstTC, int iLoop)
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



        public static void AddTC(string pTableName, ref List<TableColumn> lstTC, SqlDataReader drRefs)
        {
            string sIsNullable;
            if (drRefs.GetString(12) == "YES" || drRefs.GetString(1) == "YES")
            {
                sIsNullable = "YES";
            }
            else
            {
                sIsNullable = "NO";
            }
            switch (drRefs.GetString(2))
            {
                case "datetime":
                case "datetime2":
                case "date":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
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
                            , sIsNullable
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
                            , sIsNullable
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , drRefs.GetString(6)
                            ));
                    break;
                case "float":
                    lstTC.Add(new TableColumn(pTableName
                            , drRefs.GetString(0)
                            , sIsNullable
                            , drRefs.GetString(2)
                            , drRefs.GetString(4)
                            , drRefs.GetString(5)
                            , "0"
                            ));
                    break;
            }
        }
    }
}
