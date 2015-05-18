using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
using Microsoft.LightSwitch.Security.Server;
using System.Linq.Expressions;

namespace LightSwitchApplication
{
    public partial class MeerkatDataService
    {

        #region Security
        private bool? _BypassSecurity = null;
        private bool BypassSecurity
        {
            get
            {
                if (_BypassSecurity == null)
                {
                    try
                    {
                        _BypassSecurity = (from GlobalSetting gs in DataWorkspace.MeerkatData.GlobalSettings
                                           where gs.Code == "BYPASSAD"
                                           select System.Convert.ToBoolean(gs.Value)).First();
                    }
                    catch
                    {
                        _BypassSecurity = false;
                    }
                    if (_BypassSecurity == null)
                    {
                        _BypassSecurity = false;
                    }

                }
                return (bool)_BypassSecurity;
            }

        }
        private string strUser = "";
        public string UserName
        {
            get
            {
                if (strUser == "")
                {
                    switch (Application.User.Name)
                    {
                        case "TestUser":
                            strUser = Environment.UserName;
                            break;
                        case "":
                            strUser = Environment.UserName;
                            break;
                        case null:
                            strUser = Environment.UserName;
                            break;


                        default:
                            strUser = Application.User.Name;
                            break;
                    }

                    if (strUser == "" || strUser == null)
                    {
                        strUser = Application.User.PersonId;
                    }

                }

                if (strUser.Contains("|"))
                {
                    //For funny Sharepoint users.
                    strUser = strUser.Split('|')[2];
                }
                return strUser;
            }
        }

        private string str_tsPerson = "";
        public string tsPerson
        {
            get
            {
                if (str_tsPerson == null || str_tsPerson == "")
                {
                    string strUserName = UserName;
                    str_tsPerson = (from User p in DataWorkspace.MeerkatData.Users
                                    where p.ADUsername == strUserName || p.SharepointUserName == strUserName
                                    select p.UserName).FirstOrDefault();


                }
                return str_tsPerson;
            }
        }

        private Int32 int_tsPersonID = 0;
        public Int32 tsPersonID
        {
            get
            {
                if (int_tsPersonID == null || int_tsPersonID == 0)
                {
                    string strUserName = UserName;
                    int_tsPersonID = (from User p in DataWorkspace.MeerkatData.Users
                                      where p.ADUsername.ToLower() == strUserName.ToLower() || p.SharepointUserName.ToLower() == strUserName.ToLower()
                                          //|| p.ADUsername.StartsWith(strUserName) || p.SharepointUserName.StartsWith(strUserName)
                                      || p.ADUsername.ToLower().StartsWith(strUserName.ToLower()) || p.SharepointUserName.ToLower().StartsWith(strUserName.ToLower())
                                      || p.ADUsername.ToLower().Contains(strUserName.ToLower()) || p.SharepointUserName.ToLower().Contains(strUserName.ToLower())
                                      select p.UserID).FirstOrDefault();


                }
                return int_tsPersonID;
            }
        }


        #endregion

        partial void Events_Filter(ref Expression<Func<c_Event, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            if (!this.BypassSecurity)
            {
                //filter = e => e.vwEventUserMaps.Where(x => this.BypassSecurity == true || x.UserID == tsPersonID).Any();
            }
        }

    }
}
