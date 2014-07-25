using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLARelationship
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sID;
        public string fromTable;
        public string fromColumn;      
        public string toTable;
        public string toColumn;
        public bool bMaterialised = false;
        public bool bReference = false;
        public string sIntermediateDimensionID = "";
        public string sIntermediateGranularityID = "";



        public XMLARelationship()
        {}

        public XMLARelationship(string pID, string pfromTable, string pfromColumn, string ptoTable, string ptoColumn)
        {
            sID = pID  ;
            fromTable = pfromTable;
            fromColumn = pfromColumn;      
            toTable = ptoTable;
            toColumn = ptoColumn;
        }

        public XMLARelationship(string pID, string pfromTable, string pfromColumn, string ptoTable, string ptoColumn, bool pReference, bool pMaterialised, string pIntermediateDimensionID, string pIntermediateGranularityID)
        {
            sID = pID;
            fromTable = pfromTable;
            fromColumn = pfromColumn;
            toTable = ptoTable;
            toColumn = ptoColumn;
            bReference = pReference;
            bMaterialised = pMaterialised;
            sIntermediateDimensionID = pIntermediateDimensionID;
            sIntermediateGranularityID = pIntermediateGranularityID;

        }

        public bool Active = true;
    }
}
