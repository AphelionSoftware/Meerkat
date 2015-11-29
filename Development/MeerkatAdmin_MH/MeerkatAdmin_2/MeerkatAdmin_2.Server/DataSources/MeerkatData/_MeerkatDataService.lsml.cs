using System.Linq.Expressions;

namespace LightSwitchApplication
{
    using Microsoft.LightSwitch;
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    public partial class MeerkatDataService
    {
        private static DateTime MinDate = new DateTime(2000, 1, 1);

        private void SetTrackingInfo<T>(T entity)
        {
            var type = entity.GetType();
            var properties = type.GetProperties();
            var createdBy = properties.SingleOrDefault(_ => _.Name == "sys_CreatedBy");
            var createdOn = properties.SingleOrDefault(_ => _.Name == "sys_CreatedOn");
            var modifiedBy = properties.SingleOrDefault(_ => _.Name == "sys_ModifiedBy");
            var modifiedOn = properties.SingleOrDefault(_ => _.Name == "sys_ModifiedOn");

            if ((string)createdBy.GetValue(entity, null) == "NA")
            {
                createdBy.SetValue(entity, Environment.UserName == "" ? "Authentication problem" : Environment.UserName, null);
            }

            if ((DateTime)createdOn.GetValue(entity, null) < MinDate)
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
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Outputs_Filter(ref Expression<Func<Output, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Activities_Filter(ref Expression<Func<Activity, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void DataVersions_Filter(ref Expression<Func<DataVersion, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void IndicatorLocations_Filter(ref Expression<Func<IndicatorLocation, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Indicators_Filter(ref Expression<Func<Indicator, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void IndicatorTypes_Filter(ref Expression<Func<IndicatorType, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void IndicatorValues_Filter(ref Expression<Func<IndicatorValue, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Locations_Filter(ref Expression<Func<Location, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void LocationTypes_Filter(ref Expression<Func<LocationType, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void MilestoneLocations_Filter(ref Expression<Func<MilestoneLocation, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Milestones_Filter(ref Expression<Func<Milestone, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void MilestoneTypes_Filter(ref Expression<Func<MilestoneType, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void MilestoneValues_Filter(ref Expression<Func<MilestoneValue, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Organizations_Filter(ref Expression<Func<Organization, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void OrganizationTypes_Filter(ref Expression<Func<OrganizationType, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void OutcomeOrganizations_Filter(ref Expression<Func<OutcomeOrganization, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void OutcomePersonRoles_Filter(ref Expression<Func<OutcomePersonRole, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void OutputPersonRoles_Filter(ref Expression<Func<OutputPersonRole, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void People_Filter(ref Expression<Func<Person, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Projects_Filter(ref Expression<Func<Project, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void ReportingPeriods_Filter(ref Expression<Func<ReportingPeriod, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Roles_Filter(ref Expression<Func<Role, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void SubOutputs_Filter(ref Expression<Func<SubOutput, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);

        }

        partial void Indicators_Validate(Indicator entity, EntitySetValidationResultsBuilder results)
        {
            if (entity.BaselineDate > entity.TargetDate)
            {
                results.AddPropertyError("The baseline date/time must be set to period BEFORE the target date/time.", entity.Details.Properties.BaselineDate);
            }
        }

        partial void SubOutputs_Validate(SubOutput entity, EntitySetValidationResultsBuilder results)
        {
            if (entity.ActiveType == null)
            {
                results.AddPropertyError("Active Type is required", entity.Details.Properties.ActiveType);
            }
        }

        partial void StatusTypes_Inserting(StatusType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusTypes_Updating(StatusType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusValues_Inserting(StatusValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusValues_Updating(StatusValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusValues_Filter(ref Expression<Func<StatusValue, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void StatusTypes_Filter(ref Expression<Func<StatusType, bool>> filter)
        {
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void FrameworkDetails_Filter(ref Expression<Func<FrameworkDetail, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Ages_Filter(ref Expression<Func<Age, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void CommunityTypes_Filter(ref Expression<Func<CommunityType, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void CustomReportTypes_Filter(ref Expression<Func<CustomReportType, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void CustomReport_Indicators_Filter(ref Expression<Func<CustomReport_Indicator, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void CustomReport_Projects_Filter(ref Expression<Func<CustomReport_Project, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void CustomReports_Filter(ref Expression<Func<CustomReport, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void DataSources_Filter(ref Expression<Func<DataSource, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void DimDates_Filter(ref Expression<Func<DimDate, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void DonorReport_Indicators_Filter(ref Expression<Func<DonorReport_Indicator, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void DonorReport_Projects_Filter(ref Expression<Func<DonorReport_Project, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void DonorReports_Filter(ref Expression<Func<DonorReport, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Donors_Filter(ref Expression<Func<Donor, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void FrameworkDetail_Indicators_Filter(ref Expression<Func<FrameworkDetail_Indicator, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void FrameworkDetail_Projects_Filter(ref Expression<Func<FrameworkDetail_Project, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Frameworks_Filter(ref Expression<Func<Framework, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Genders_Filter(ref Expression<Func<Gender, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Groups_Filter(ref Expression<Func<Group, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Impacts_Filter(ref Expression<Func<Impact, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Institutions_Filter(ref Expression<Func<Institution, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void OrganizationPersonRoles_Filter(ref Expression<Func<OrganizationPersonRole, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void OutputOutputLinks_Filter(ref Expression<Func<OutputOutputLink, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Programmes_Filter(ref Expression<Func<Programme, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Project_ResultAreas_Filter(ref Expression<Func<Project_ResultArea, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void ProjectParticipantAgeBands_Filter(ref Expression<Func<ProjectParticipantAgeBand, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void ResultAreas_Filter(ref Expression<Func<ResultArea, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void Sectors_Filter(ref Expression<Func<Sector, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void StrategicElements_Filter(ref Expression<Func<StrategicElement, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void SubOutputPersonRoles_Filter(ref Expression<Func<SubOutputPersonRole, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void SubOutputSubOutputLinks_Filter(ref Expression<Func<SubOutputSubOutputLink, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }

        partial void SubSectors_Filter(ref Expression<Func<SubSector, bool>> filter)
        {
            // filter = e => e.IntegerProperty == 0;
            filter = e => (e.ActiveType.ID >= 0);
        }
    }
}
