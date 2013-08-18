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

        partial void Activities_Filter(ref Expression<Func<Activity, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void DataSources_Filter(ref Expression<Func<DataSource, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void DataVersions_Filter(ref Expression<Func<DataVersion, bool>> filter)
        {

            filter = e => e.ActiveType.ID == 1;

        }

        partial void IndicatorLocations_Filter(ref Expression<Func<IndicatorLocation, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Indicators_Filter(ref Expression<Func<Indicator, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void IndicatorTypes_Filter(ref Expression<Func<IndicatorType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void IndicatorValues_Filter(ref Expression<Func<IndicatorValue, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Locations_Filter(ref Expression<Func<Location, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void LocationTypes_Filter(ref Expression<Func<LocationType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void MilestoneLocations_Filter(ref Expression<Func<MilestoneLocation, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Milestones_Filter(ref Expression<Func<Milestone, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void MilestoneTypes_Filter(ref Expression<Func<MilestoneType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void MilestoneValues_Filter(ref Expression<Func<MilestoneValue, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OrganizationPersonRoles_Filter(ref Expression<Func<OrganizationPersonRole, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Organizations_Filter(ref Expression<Func<Organization, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OrganizationTypes_Filter(ref Expression<Func<OrganizationType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OutcomeOrganizations_Filter(ref Expression<Func<OutcomeOrganization, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OutcomePersonRoles_Filter(ref Expression<Func<OutcomePersonRole, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Outcomes_Filter(ref Expression<Func<Outcome, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OutputOutputLinks_Filter(ref Expression<Func<OutputOutputLink, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void OutputPersonRoles_Filter(ref Expression<Func<OutputPersonRole, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Outputs_Filter(ref Expression<Func<Output, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void People_Filter(ref Expression<Func<Person, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Projects_Filter(ref Expression<Func<Project, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void ReportingPeriods_Filter(ref Expression<Func<ReportingPeriod, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Roles_Filter(ref Expression<Func<Role, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        
        partial void SubOutputPersonRoles_Filter(ref Expression<Func<SubOutputPersonRole, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void SubOutputs_Filter(ref Expression<Func<SubOutput, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void SubOutputSubOutputLinks_Filter(ref Expression<Func<SubOutputSubOutputLink, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }
    }
}
