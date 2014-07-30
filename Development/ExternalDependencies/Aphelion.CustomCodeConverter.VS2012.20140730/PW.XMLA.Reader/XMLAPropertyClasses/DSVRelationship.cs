using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class DSVRelationship
    {
        public override string ToString()
        {
            return this.childTable + "." + this.childColumn + " to " + this.sID;
        }
        public string sID;
        public string childSchema;
        public string childTable;
        public string childColumn;
        public List<string> lstChildColumns = new List<string>();
        public string parentSchema;
        public string parentTable;
        public string parentColumn;
        public List<string> lstParentColumns = new List<string>();
    }
}
