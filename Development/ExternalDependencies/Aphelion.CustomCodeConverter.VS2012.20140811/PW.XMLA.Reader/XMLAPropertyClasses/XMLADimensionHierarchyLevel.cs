using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADimensionHierarchyLevel
    {
        public string sName;
        public string sID;
        public string sSourceAttributeID;

        public override string ToString()
        {
            return this.sID;
        }

        public XMLADimensionHierarchyLevel ( string pID, string pName, string pSourceAttributeID ) 
        {
            sID = pID.Replace(" ","");
            sName = pName;
            sSourceAttributeID = pSourceAttributeID.Replace(" ","");
        }
    
    }
}
