﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class SubOutput
    {
        partial void SubOutput_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
            //HttpContext.Current.Server.UrlEncode("Some String");
            this.ShortName = System.Web.HttpUtility.UrlEncode(this.ShortName);
        }
    }

}