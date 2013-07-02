using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
using Microsoft.LightSwitch.Security.Server;
namespace LightSwitchApplication
{
    public partial class MeerkatDataService
    {
        partial void MilestoneValues_Inserting(MilestoneValue entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void MilestoneValues_Updating(MilestoneValue entity)
        {
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void IndicatorValues_Inserting(IndicatorValue entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void IndicatorValues_Updating(IndicatorValue entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        
        }

        partial void Activities_Inserting(Activity entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void ActiveTypes_Inserting(ActiveType entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }
    }
}
