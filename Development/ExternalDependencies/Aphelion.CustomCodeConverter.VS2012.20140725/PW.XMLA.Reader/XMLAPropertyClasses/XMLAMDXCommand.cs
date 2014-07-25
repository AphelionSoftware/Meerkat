using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAMDXCommand
    {
        public override string ToString()
        {
            return this.sTable + "." + this.sName;
        }
        

        public string sTable;
        public string sName;
        public string sCommand;
        public bool boolVisible;
        public string sMeasureGroup;

        public XMLAMDXCommand(string pTable, string pName, string pCommand, string pMeasureGroup)
        {
            sTable = pTable;
            sName = pName;
            sCommand = pCommand;
            sMeasureGroup = pMeasureGroup;
        }
    }
}
