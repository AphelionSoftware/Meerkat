using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class OutcomePersonRole
    {
        partial void OutcomePersonRole_Created()
        {
            this.ActiveType = DataWorkspace.MeerkatData.ActiveTypes_SingleOrDefault(1);
        }
    }
}
