using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PW.XMLA.Reader.XMLAPropertyClasses
{
    public class XMLADataSource
    {

        public string sName;
        public string sID;
        public string sConnectionString;
        public string sConnectionStringSecurity;
        public string sImpersonationMode;
        public string sImpersonationAccount;
        public string sPassword;
        public string sImpersonationInfoSecurity;

        public XMLADataSource()
        { }


        public XMLADataSource(string pName, string pID, string pConnectionString, string pConnectionStringSecurity, string pImpersonationMode, string pImpersonationAccount, string pPassword, string pImpersonationInfoSecurity)
        {
            sName = pName;
            sID = pID;
            sConnectionString = pConnectionString;
            sConnectionStringSecurity = pConnectionStringSecurity;
            sImpersonationMode = pImpersonationMode;
            sImpersonationAccount = pImpersonationAccount;
            sPassword = pPassword;
            sImpersonationInfoSecurity = pImpersonationInfoSecurity;

        }

    }
}
