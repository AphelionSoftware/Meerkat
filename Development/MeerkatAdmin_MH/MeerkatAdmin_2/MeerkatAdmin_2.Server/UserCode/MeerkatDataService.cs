
namespace LightSwitchApplication
{
    using Microsoft.LightSwitch;
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    public partial class MeerkatDataService
    {
        private void SetTrackingInfo<T>(T entity)
        {
            var type = entity.GetType();
            var properties = type.GetProperties();
            var createdBy = properties.SingleOrDefault(_ => _.Name == "sys_CreatedBy");
            var createdOn = properties.SingleOrDefault(_ => _.Name == "sys_CreatedOn");
            var modifiedBy = properties.SingleOrDefault(_ => _.Name == "sys_ModifiedBy");
            var modifiedOn = properties.SingleOrDefault(_ => _.Name == "sys_ModifiedOn");

            if ((string)createdBy.GetValue(entity, null) == default(string))
            {
                createdBy.SetValue(entity, Environment.UserName == "" ? "Authentication problem" : Environment.UserName, null);
            }

            if ((DateTime)createdOn.GetValue(entity, null) == default(DateTime))
            {
                createdOn.SetValue(entity, System.DateTime.Now, null);
            }

            modifiedBy.SetValue(entity, Environment.UserName == "" ? "Authentication problem" : Environment.UserName, null);
            modifiedOn.SetValue(entity, System.DateTime.Now, null);
        }

        partial void Activities_Inserting(Activity entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Outcomes_Inserting(Outcome entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataSources_Inserting(DataSource entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataVersionLevels_Inserting(DataVersionLevel entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataVersions_Inserting(DataVersion entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorLocations_Inserting(IndicatorLocation entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Indicators_Inserting(Indicator entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorTypes_Inserting(IndicatorType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorValues_Inserting(IndicatorValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Locations_Inserting(Location entity)
        {
            SetTrackingInfo(entity);
        }

        partial void LocationTypes_Inserting(LocationType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneLocations_Inserting(MilestoneLocation entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Milestones_Inserting(Milestone entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneTypes_Inserting(MilestoneType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneValues_Inserting(MilestoneValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Organizations_Inserting(Organization entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OrganizationTypes_Inserting(OrganizationType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutcomeOrganizations_Inserting(OutcomeOrganization entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutcomePersonRoles_Inserting(OutcomePersonRole entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutputPersonRoles_Inserting(OutputPersonRole entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Outputs_Inserting(Output entity)
        {
            SetTrackingInfo(entity);
        }

        partial void People_Inserting(Person entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Projects_Inserting(Project entity)
        {
            SetTrackingInfo(entity);
        }

        partial void ReportingPeriods_Inserting(ReportingPeriod entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Roles_Inserting(Role entity)
        {
            SetTrackingInfo(entity);
        }

        partial void SubOutputs_Inserting(SubOutput entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Activities_Updating(Activity entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataSources_Updating(DataSource entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataVersionLevels_Updating(DataVersionLevel entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DataVersions_Updating(DataVersion entity)
        {
            SetTrackingInfo(entity);
        }

        partial void DimDates_Updating(DimDate entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorLocations_Updating(IndicatorLocation entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Indicators_Updating(Indicator entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorTypes_Updating(IndicatorType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorValues_Updating(IndicatorValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Locations_Updating(Location entity)
        {
            SetTrackingInfo(entity);
        }

        partial void LocationTypes_Updating(LocationType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneLocations_Updating(MilestoneLocation entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Milestones_Updating(Milestone entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneTypes_Updating(MilestoneType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneValues_Updating(MilestoneValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OrganizationTypes_Updating(OrganizationType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Organizations_Updating(Organization entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutcomeOrganizations_Updating(OutcomeOrganization entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutcomePersonRoles_Updating(OutcomePersonRole entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Outcomes_Updating(Outcome entity)
        {
            SetTrackingInfo(entity);
        }

        partial void OutputPersonRoles_Updating(OutputPersonRole entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Outputs_Updating(Output entity)
        {
            SetTrackingInfo(entity);
        }

        partial void People_Updating(Person entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Projects_Updating(Project entity)
        {
            SetTrackingInfo(entity);
        }

        partial void ReportingPeriods_Updating(ReportingPeriod entity)
        {
            SetTrackingInfo(entity);
        }

        partial void Roles_Updating(Role entity)
        {
            SetTrackingInfo(entity);
        }

        partial void SubOutputs_Updating(SubOutput entity)
        {
            SetTrackingInfo(entity);
        }


        partial void SaveChanges_CanExecute(ref bool result)
        {
            result = true;
        }

        partial void Outcomes_Filter(ref Expression<Func<Outcome, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID == 1);
        }

        partial void Outputs_Filter(ref Expression<Func<Output, bool>> filter)
        {
            filter = e => (e.ActiveType.ID == 1);

        }

        partial void Activities_Filter(ref Expression<Func<Activity, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => e.ActiveType.ID == 1;

        }

        partial void DataVersionLevels_Filter(ref Expression<Func<DataVersionLevel, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => e.ActiveType.ID == 1;

        }

        partial void DataVersions_Filter(ref Expression<Func<DataVersion, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => e.ActiveType.ID == 1;

        }

        partial void IndicatorLocations_Filter(ref Expression<Func<IndicatorLocation, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
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

        partial void OutputPersonRoles_Filter(ref Expression<Func<OutputPersonRole, bool>> filter)
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

        partial void SubOutputs_Filter(ref Expression<Func<SubOutput, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Indicators_Validate(Indicator entity, EntitySetValidationResultsBuilder results)
        {
            if (entity.BaselineDate > entity.TargetDate)
            {
                results.AddPropertyError("The baseline date/time must be set to period BEFORE the target date/time.", entity.Details.Properties.BaselineDate);
            }
        }

    }
}
