﻿using System.Linq.Expressions;

namespace LightSwitchApplication
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;

    public partial class MeerkatDataService
    {

        #region Security

        private string strUser = "";
        public string UserName
        {
            get
            {
                if (strUser == "")
                {
                    switch (Application.User.Name)
                    {
                        case "TestUser":
                            strUser = Environment.UserName;
                            break;
                        case "":
                            strUser = Environment.UserName;
                            break;
                        case null:
                            strUser = Environment.UserName;
                            break;


                        default:
                            strUser = Application.User.Name;
                            break;
                    }

                    if (strUser == "" || strUser == null)
                    {
                        strUser = Application.User.PersonId;
                    }

                }

                if (strUser.Contains("|"))
                {
                    //For funny Sharepoint users.
                    strUser = strUser.Split('|')[2];
                }
                return strUser;
            }
        }

        private string str_tsPerson = "";
        public string tsPerson
        {
            get
            {
                if (str_tsPerson == "")
                {
                    string strUserName = UserName;
                    str_tsPerson = (from p in DataWorkspace.TimesheetsData.People
                                    where p.ADUsername == strUserName || p.SharepointUserName == strUserName
                                    select p.PersonName).FirstOrDefault();


                }
                return str_tsPerson;
            }
        }

        private Int32 int_tsPersonID = 0;
        public Int32 tsPersonID
        {
            get
            {
                if (int_tsPersonID == 0)
                {
                    string strUserName = UserName;
                    int_tsPersonID = (from p in DataWorkspace.TimesheetsData.People
                                      where p.ADUsername.ToLower() == strUserName.ToLower() || p.SharepointUserName.ToLower() == strUserName.ToLower()
                                          //|| p.ADUsername.StartsWith(strUserName) || p.SharepointUserName.StartsWith(strUserName)
                                      || p.ADUsername.ToLower().StartsWith(strUserName.ToLower()) || p.SharepointUserName.ToLower().StartsWith(strUserName.ToLower())
                                      || p.ADUsername.ToLower().Contains(strUserName.ToLower()) || p.SharepointUserName.ToLower().Contains(strUserName.ToLower())
                                      select p.PersonID).FirstOrDefault();


                }
                return int_tsPersonID;
            }
        }


        #endregion


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

        partial void MilestoneValues_Inserting(MilestoneValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void MilestoneValues_Updating(MilestoneValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorValues_Inserting(IndicatorValue entity)
        {
            SetTrackingInfo(entity);
        }

        partial void IndicatorValues_Updating(IndicatorValue entity)
        {
            SetTrackingInfo(entity);
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
            filter = e => e.ActiveType.ID == 1;
        }

        partial void StatusTypes_Inserting(StatusType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusTypes_Updating(StatusType entity)
        {
            SetTrackingInfo(entity);
        }

        partial void StatusTypes_Filter(ref Expression<Func<StatusType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;
        }
    }
}
