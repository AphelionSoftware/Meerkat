﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class Milestone
    {
        partial void Milestone_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
        }
    }
}
