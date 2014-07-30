using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAModel
    {

        public string sName;
        public string sID;

        public MDXScript mdxScript = new MDXScript();

        public XMLAModel()
        {
        }

        public XMLAModel(string pName, string pID)
        {
            sName = pName;
            sID = pID;
        }


        public string sPowerPivotMDXCommand;

        public List<XMLADimension> lstDimensions = new List<XMLADimension>();
        public List<XMLAMeasureGroup> lstMeasureGroups = new List<XMLAMeasureGroup>();
        public List<XMLAMDXCommand> lstMDXCommands = new List<XMLAMDXCommand>();
    }
}
