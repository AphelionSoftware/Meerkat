using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class MDXScript
    {
        public List<string> Commands = new List<string>();
        public List<MDXScriptCalcProp> CalcProps = new List<MDXScriptCalcProp>();
    }
}
