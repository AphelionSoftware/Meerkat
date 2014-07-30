using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate.Schema
{

    public class SchemaTable
    {
        public string TableName;
        public string SchemaName;
        public string CreateStatement;
        public List<TableColumn> lstTC;
        public SchemaTable(string pSchema, string pTable)
        {
            this.TableName = pTable;
            this.SchemaName = pSchema;
        }

        public SchemaTable(string pSchema, string pTable, string pCreate)
        {
            this.TableName = pTable;
            this.SchemaName = pSchema;
            this.CreateStatement = pCreate;
        }
        public SchemaTable(string pSchema, string pTable, string pCreate, List<TableColumn> plstTC)
        {
            this.TableName = pTable;
            this.SchemaName = pSchema;
            this.CreateStatement = pCreate;
            this.lstTC = plstTC;
        }
        public SchemaTable(string pSchema, string pTable, List<TableColumn> plstTC)
        {
            this.TableName = pTable;
            this.SchemaName = pSchema;
            this.lstTC = plstTC;
        }
    }
}
