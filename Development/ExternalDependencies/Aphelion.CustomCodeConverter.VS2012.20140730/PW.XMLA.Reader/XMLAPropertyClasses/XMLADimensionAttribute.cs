using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    [Serializable]
    public class XMLADimensionAttribute
    {
        public override string ToString() 
        {
            return this.sID; 
        }


        public string sName;
        public string sID;
        public string sDBColumnName;
        public string sDBTableName;
        public string sDBSchemaName;
        public string sAttributeName;
        public string sDataType;
        public string sDataSize;
        public string sDimensionName;
        public string sDimensionID;
        public string sCardinality = "Many";
        public string sNullProcessing = "Preserve";
        public bool bMicrosoft = false;
        public bool boolVisible = true;
        public bool boolRelated = false;
        public string sExpression;
        /// <summary>
        /// Exclude this attribute from tabular model - generally used when creating snowflakes and new subsidiary tables
        /// </summary>
        public bool boolAddToTabular = true;

        public XMLADimensionAttribute()
        {
        }

        public XMLADimensionAttribute(string	 pName,string	 pID,string	 pDBColumnName,string	 pDBTableName,string	 pDBSchemaName,string	 pAttributeName,string	 pDataType,string	 pDataSize,string	 pDimensionName,string	 pDimensionID)
        {
            sName = pName;
            sID = pID;
            sDBColumnName = pDBColumnName;
            sDBTableName = pDBTableName;
            sDBSchemaName = pDBSchemaName;
            sAttributeName = pAttributeName;
            sDataType = pDataType;
            sDataSize = pDataSize;
            sDimensionName = pDimensionName;
            sDimensionID = pDimensionID;

        }

    }


}
