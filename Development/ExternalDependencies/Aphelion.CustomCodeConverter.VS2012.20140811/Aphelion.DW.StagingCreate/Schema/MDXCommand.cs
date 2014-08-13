using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aphelion.DW.StagingCreate.Schema
{
    public class MDXCommand
    {
        public string sTable;
        public string sName;
        public string sCommand;

        public MDXCommand(string pTable, string pName, string pCommand)
        {
            sTable = pTable;
            sName = pName;
            sCommand = pCommand;
        }
    }
}
