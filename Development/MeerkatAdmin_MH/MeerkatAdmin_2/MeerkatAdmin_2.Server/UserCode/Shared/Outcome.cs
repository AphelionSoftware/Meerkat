using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class Outcome
    {
        partial void Outcome_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
            this.ShortName = System.Web.HttpUtility.UrlEncode(this.ShortName);
            this.LongName = System.Web.HttpUtility.UrlEncode(this.LongName);
            this.BusinessKey = System.Web.HttpUtility.UrlEncode(this.BusinessKey);
            this.Code = System.Web.HttpUtility.UrlEncode(this.Code);
            this.TextDescription = System.Web.HttpUtility.UrlEncode(this.TextDescription);
            
          

        }
    }
}
