using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using  PW.XMLA.Reader.XMLAPropertyClasses;


namespace PW.XMLA.Reader
{
    public class CubeDatabase
    {

        public string sName;
        public string sID;
        public string sLanguage;
        public string sCollation;
        public List<XMLAModel> lstCubeModels = new List<XMLAModel>();
        public List<XMLADataSource> lstDataSources = new List<XMLADataSource>();
        /*
         * public List<Dimension> lstDimensions;
         * Even though DBs have dimensions, we're not going to populate them.
         * Creating 1 Model per cube means creating 1 DB per model
         * */

        public List<DSV> lstDSV = new List<DSV>();
    }
}
