using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class DSVTable
    {
       
        
        public string sName;
        public string sID;
        public string sFriendlyName;
        public string sTableType;
        public string sTableName;
        public string sSchemaName;
        public string sKeyColumn;
        public string sXMLATableType = "Table";
        public bool bCoalesceFields = false;

        public override string ToString()
        {
            return this.sID;
        }
        public DSVTable()
        {
        }


        public DSVTable(string pName, string pID, string pFriendlyName, string pTableType, string pTableName, string pSchemaName, string pXMLATableType)
        {
            sName = pName;
            sID = pID;
            sFriendlyName = pFriendlyName;
            sTableType = pTableType;
            sTableName = pTableName;
            sSchemaName = pSchemaName;
            sXMLATableType = pXMLATableType;


        }
        public DSVTable( string pName, string pID, string pFriendlyName, string pTableType, string pTableName, string pSchemaName ="") 
        {
            sName = pName;
            sID = pID;
            sFriendlyName = pFriendlyName;
            sTableType = pTableType;
            sTableName = pTableName;
            sSchemaName = pSchemaName;


        }
        
        public List<string> lstKeyColumns = new List<string>();

        public string sQuery;

        public string sIsLogical;
        public string sQueryDefiniton;
        public string sQueryBuilder;
        public List<DSVColumn> lstColumns = new List<DSVColumn>();
        public List<DSVConstraint> lstConstraints = new List<DSVConstraint>();
    }
}
