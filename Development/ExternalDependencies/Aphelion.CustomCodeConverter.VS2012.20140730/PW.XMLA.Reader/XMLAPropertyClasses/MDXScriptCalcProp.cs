using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class MDXScriptCalcProp
    {
        public override string ToString()
        {
            return this.sID;
        }
        public string sID;
        public string sName
        {
            get { return sID; }
            set { sID = value; }
        }

        public string sCalculationReference
        {
            get { return sID; }
            set { sID = value; }
        }


        public MDXScriptCalcProp(string pName)
        {
            this.sID = pName;
        }

        public MDXScriptCalcProp(string pCalculationReference, string pCalculationType, string pFormatString)
        {
            this.sID = pCalculationReference;
            this.sCalculationType = pCalculationType;
            this.sFormatString = pFormatString;
        }


        public string sFormat = "General";
        public string sFormatString = "''";
        public string sCalculationType = "Member";
    }
}
