using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADimension
    {
        public string sName;
        public string sID;
        public string sDataSourceID;
        public string sQueryDefinition;
        public string sKeySchemaName;
        public string sKeyTableName;
        public string sKeyColumnName;
        public List<string> lstKeyColumnNames;
        public string sDSVID;
        public bool boolIsParentChild;
        public List<XMLADimensionAttribute> lstDimensionAttributes = new List<XMLADimensionAttribute>();
        public List<XMLADimension> lstSubsidiaryDimensions = new List<XMLADimension>();
    }
}
