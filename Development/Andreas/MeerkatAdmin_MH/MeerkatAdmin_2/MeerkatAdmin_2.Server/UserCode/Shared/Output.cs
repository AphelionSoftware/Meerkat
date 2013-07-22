using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class Output
    {
        partial void Output_Created()
        {
            this.ShortName = System.Web.HttpUtility.UrlEncode(this.ShortName);
            this.LongName = System.Web.HttpUtility.UrlEncode(this.LongName);
            this.BusinessKey = System.Web.HttpUtility.UrlEncode(this.BusinessKey);
            this.Code = System.Web.HttpUtility.UrlEncode(this.Code);
            this.TextDescription = System.Web.HttpUtility.UrlEncode(this.TextDescription);
        }
    }
}
