using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAReferenceDimension
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sName;
        public string sID;
        public string sIntermediateDimensionID;
        public string sIntermediateGranularityID;
        public string sMaterialisation;
        public string sTable;
        public string sColumn;

        public XMLAReferenceDimension() { }

        public XMLAReferenceDimension(string pName, string pID, string pIntermediateDimensionID, string pIntermediateGranularityID, string pMaterialisation, string pTable, string pColumn)
        {
            sName = pName;
            sID = pID;
            sIntermediateDimensionID = pIntermediateDimensionID;
            sIntermediateGranularityID = pIntermediateGranularityID;
            sMaterialisation = pMaterialisation;
            sTable = pTable;
            sColumn = pColumn;
        }
    }
}
