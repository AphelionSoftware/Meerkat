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

        public List<XMLADimension> lstDimensions = new List<XMLADimension>();
        public List<XMLAMeasureGroup> lstMeasureGrous = new List<XMLAMeasureGroup>();
    }
}
