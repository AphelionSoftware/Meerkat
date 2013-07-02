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
        partial void Activities_Inserting(Activity entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Outcomes_Inserting(Outcome entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == null ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == null ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void DataSources_Inserting(DataSource entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void DataVersionLevels_Inserting(DataVersionLevel entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void DataVersions_Inserting(DataVersion entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void IndicatorLocations_Inserting(IndicatorLocation entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Indicators_Inserting(Indicator entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void IndicatorTypes_Inserting(IndicatorType entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void IndicatorValues_Inserting(IndicatorValue entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Locations_Inserting(Location entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void LocationTypes_Inserting(LocationType entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void MilestoneLocations_Inserting(MilestoneLocation entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Milestones_Inserting(Milestone entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void MilestoneTypes_Inserting(MilestoneType entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void MilestoneValues_Inserting(MilestoneValue entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Organizations_Inserting(Organization entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void OrganizationTypes_Inserting(OrganizationType entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void OutcomeOrganizations_Inserting(OutcomeOrganization entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void OutcomePersonRoles_Inserting(OutcomePersonRole entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
           
        }

        partial void OutputPersonRoles_Inserting(OutputPersonRole entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;


        }

        partial void Outputs_Inserting(Output entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void People_Inserting(Person entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Projects_Inserting(Project entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void ReportingPeriods_Inserting(ReportingPeriod entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Roles_Inserting(Role entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void SubOutputs_Inserting(SubOutput entity)
        {
            entity.sys_CreatedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Activities_Updating(Activity entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void DataSources_Updating(DataSource entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void DataVersionLevels_Updating(DataVersionLevel entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void DataVersions_Updating(DataVersion entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void DimDates_Updating(DimDate entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void IndicatorLocations_Updating(IndicatorLocation entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void Indicators_Updating(Indicator entity)
        {
            entity.sys_ModifiedBy =  (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void IndicatorTypes_Updating(IndicatorType entity)
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

        partial void Locations_Updating(Location entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void LocationTypes_Updating(LocationType entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void MilestoneLocations_Updating(MilestoneLocation entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Milestones_Updating(Milestone entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void MilestoneTypes_Updating(MilestoneType entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void MilestoneValues_Updating(MilestoneValue entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void OrganizationTypes_Updating(OrganizationType entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void Organizations_Updating(Organization entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }


        partial void OutcomeOrganizations_Updating(OutcomeOrganization entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void OutcomePersonRoles_Updating(OutcomePersonRole entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Outcomes_Updating(Outcome entity)
        {
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void OutputPersonRoles_Updating(OutputPersonRole entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void Outputs_Updating(Output entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void People_Updating(Person entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Projects_Updating(Project entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void ReportingPeriods_Updating(ReportingPeriod entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;

        }

        partial void Roles_Updating(Role entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void SubOutputs_Updating(SubOutput entity)
        {
            entity.sys_CreatedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_CreatedOn = System.DateTime.Now;
            entity.sys_ModifiedBy = (Environment.UserName == "" ? "Authentication problem" : Environment.UserName);
            entity.sys_ModifiedOn = System.DateTime.Now;
        }

        partial void Query_Executed(QueryExecutedDescriptor queryDescriptor)
        {
            
        }

        partial void SaveChanges_CanExecute(ref bool result)
        {
            result =  true;
        }

    }
}
