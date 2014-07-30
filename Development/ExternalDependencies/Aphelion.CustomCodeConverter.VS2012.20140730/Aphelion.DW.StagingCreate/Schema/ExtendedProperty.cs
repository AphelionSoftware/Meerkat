using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate.Schema
{
    public class ExtendedProperty
    {
        public string sName;
        public string sValue;
        public string sSchema;
        public string sTable;
        public string sColumn;

        public ExtendedProperty(string pName,
         string pValue,
         string pSchema,
         string pTable,
         string pColumn)
        {
            sName = pName;
            sValue = pValue;
            sSchema = pSchema;
            sTable = pTable;
            sColumn = pColumn;
        }

    }
}
