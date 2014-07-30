using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADimensionAttribute
    {
        public string sName;
        public string sID;
        public string sDBColumnName;
        public string sDBTableName;
        public string sDBSchemaName;
        public string sAttributeName;
        public string sDataType;
        public string sDataSize;
        /// <summary>
        /// Exclude this attribute from tabular model - generally used when creating snowflakes and new subsidiary tables
        /// </summary>
        public bool boolAddToTabular = true;
    }


}
