using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
namespace LightSwitchApplication
{
    public partial class IndicatorValue
    {
        partial void DataVersionIncrement_Compute(ref int result)
        {
            // Set result to the desired field value
            result = this.DataVersion.DataVersion_ID + 1;
        }
    }
}
