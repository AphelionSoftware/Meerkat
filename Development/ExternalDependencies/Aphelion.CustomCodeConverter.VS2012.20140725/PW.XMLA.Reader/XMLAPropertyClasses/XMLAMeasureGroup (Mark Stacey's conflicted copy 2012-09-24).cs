using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLAMeasureGroup
    {
        public string sName;
        public string sID;
        public string sDescription;

        public string sProcessingMode;
        public string sStorageLocation;


        public List<XMLAMeasure> lstMeasures = new List<XMLAMeasure>();
        public List<XMLADimension> lstDimensions = new List<XMLADimension>();
        public List<XMLAPartitions> lstPartitions = new List<XMLAPartitions>();
    }
}
