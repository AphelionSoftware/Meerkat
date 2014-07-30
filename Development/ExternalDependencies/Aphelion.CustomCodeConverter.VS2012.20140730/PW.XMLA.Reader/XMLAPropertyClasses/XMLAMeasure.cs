using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAMeasure
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sName;
        public string sID;
        public string sAggregationFunction;
        public string sMeasureExpression;
        public string sFormatString;
        public string sAnnotations;
        public string sDataType;
        public string sDataSize;
        public string sDisplayFolder;
        public string sDBColumnName;
        public string sDBSchemaName;
        public string sDBTableName;
        public string sDimensionName;
        public string sDimensionID;
        public string sAttributeName;
        public bool boolVisible = true;

        public XMLAMeasure()
        {
        }

        public XMLAMeasure(string pName,string pID,string pAggregationFunction,string pMeasureExpression,string pFormatString,string pAnnotations,string pDataType,string pDataSize,string pDisplayFolder,string pDBColumnName,string pDBSchemaName,string pDBTableName,string pDimensionName,string pDimensionID,string pAttributeName, bool pVisible)
        {
            sName = pName;
            sID = pID;
            sAggregationFunction = pAggregationFunction;
            sMeasureExpression = pMeasureExpression;
            sFormatString = pFormatString;
            sAnnotations = pAnnotations;
            sDataType = pDataType;
            sDataSize = pDataSize;
            sDisplayFolder = pDisplayFolder;
            sDBColumnName = pDBColumnName;
            sDBSchemaName = pDBSchemaName;
            sDBTableName = pDBTableName;
            sDimensionName = pDimensionName;
            sDimensionID = pDimensionID;
            sAttributeName = pAttributeName;
            boolVisible = pVisible;
        }
    }
}
