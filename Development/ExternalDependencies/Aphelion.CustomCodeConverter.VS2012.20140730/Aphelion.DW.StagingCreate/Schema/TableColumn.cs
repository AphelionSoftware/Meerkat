using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate.Schema
{
    public class TableColumn
    {
        public string TableName;
        public string TableAlias;
        public string ColumnName;
        public string DataType;
        public string CharacterLength;
        public string NumericPrecision;
        public string NumericPrecisionRadix;
        public string NumericScale;
        public int HierarchyLevel = 0;

        public string Nullable;

        public string Alias;

        public List<TableColumn> lstDuplicatedTableColumns = new List<TableColumn>();

        public override string ToString()
        {
            return this.TableName + "." + this.ColumnName + " as " + this.Alias;
        }
        

        public TableColumn(string pTable, string pColumn)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            this.Alias = pColumn;
        }

        public TableColumn(string pTable, string pColumn, string pAlias)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            this.Alias = pAlias;
        }
        public TableColumn(string pTable, string pColumn, string pAlias, int pHierarchyLevel)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            this.Alias = pAlias;
            this.HierarchyLevel = pHierarchyLevel;
        }
        /// <summary>
        /// For varchar
        /// </summary>
        /// <param name="pTable"></param>
        /// <param name="pColumn"></param>
        /// <param name="pDataType"></param>
        /// <param name="pCharacterLength"></param>
        public TableColumn(string pTable, string pColumn, string pNullable, string pDataType, string pCharacterLength)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            if (pNullable == "YES")
            {
                this.Nullable = "NULL";
            }
            else
            {
                this.Nullable = "NOT NULL";
            }
            this.DataType = pDataType;
            if (pCharacterLength == "-1")
            {
                this.CharacterLength = "max";
            }
            else
            {
                this.CharacterLength = pCharacterLength;
            }
        }
        /// <summary>
        /// For date/datetime
        /// </summary>
        /// <param name="pTable"></param>
        /// <param name="pColumn"></param>
        /// <param name="pDataType"></param>
        public TableColumn(string pTable, string pColumn, string pNullable, string pDataType)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            if (pNullable == "YES")
            {
                this.Nullable = "NULL";
            }
            else
            {
                this.Nullable = "NOT NULL";
            }
            this.DataType = pDataType;
            
        }
        /// <summary>
        /// For decimals and floats. 
        /// </summary>
        /// <param name="pTable"></param>
        /// <param name="pColumn"></param>
        /// <param name="pDataType"></param>
        /// <param name="pPrecision"></param>
        /// <param name="pRadixScale">Sets both scale and radix</param>
        public TableColumn(string pTable, string pColumn, string pNullable, string pDataType, string pPrecision, string pRadix, string pScale)
        {
            this.TableName = pTable;
            this.TableAlias = pTable;
            this.ColumnName = pColumn;
            if (pNullable == "YES")
            {
                this.Nullable = "NULL";
            }
            else
            {
                this.Nullable = "NOT NULL";
            }
            this.DataType = pDataType;
            this.NumericPrecision = pPrecision;
            this.NumericPrecisionRadix = pRadix;
            this.NumericScale = pScale;
        }

    }

}
