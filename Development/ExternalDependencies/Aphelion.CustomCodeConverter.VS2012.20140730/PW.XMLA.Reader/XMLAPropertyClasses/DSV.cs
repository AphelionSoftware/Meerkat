using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{

    public class DSV
    {
        public string sName;
        public string sID;
        /// <summary>
        /// We only store the data source ID, not a reference
        /// </summary>
        public string sDataSourceID;

        public DSV() { }
        public DSV(string pName, string pID, string pDataSourceID)
        {
            sName = pName;
            sID = pID;
            sDataSourceID = pDataSourceID;
        }


        public List<DSVTable> lstDSVTables = new List<DSVTable>();
        public List<DSVRelationship> lstRelationships = new List<DSVRelationship>();

        public List<XMLARelationship> lstXMLARelationships = new List<XMLARelationship>();
    }
}
