using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADimensionHierarchy
    {
        public string sName;
        public string sID;
        
        public override string ToString()
        {
            return this.sID;
        }

        public List<XMLADimensionHierarchyLevel> lstLevels = new List<XMLADimensionHierarchyLevel>();

        public XMLADimensionHierarchy(string pID, string pName)
        {
            sID = pID;
            sName = pName;
        }

    }
}
