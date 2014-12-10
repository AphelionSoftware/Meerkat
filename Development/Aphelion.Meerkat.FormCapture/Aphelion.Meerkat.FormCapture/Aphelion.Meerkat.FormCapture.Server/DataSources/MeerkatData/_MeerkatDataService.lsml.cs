
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
using Microsoft.LightSwitch.Security.Server;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq.Expressions;

namespace LightSwitchApplication
{
    public partial class MeerkatDataService
    {
        #region Security
        private bool? _BypassSecurity;
        private bool BypassSecurity
        {
            get
            {
                if (_BypassSecurity == null)
                {
                    try
                    {
                        _BypassSecurity = (from GlobalSetting gs in DataWorkspace.MeerkatData.GlobalSettings
                                           where gs.Code == "BYPASSAD"
                                           select System.Convert.ToBoolean(gs.Value)).First();
                    }
                    catch
                    {
                        _BypassSecurity = false;
                    }
                    if (_BypassSecurity == null)
                    {
                        _BypassSecurity = false;
                    }

                }
                return (bool) _BypassSecurity;
            }

        }
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
                if (str_tsPerson == null || str_tsPerson == "")
                {
                    string strUserName = UserName;
                    str_tsPerson = (from User p in DataWorkspace.MeerkatData.Users
                                    where p.ADUsername == strUserName || p.SharepointUserName == strUserName
                                    select p.UserName).FirstOrDefault();


                }
                return str_tsPerson;
            }
        }

        private Int32 int_tsPersonID = 0;
        public Int32 tsPersonID
        {
            get
            {
                if (int_tsPersonID == null || int_tsPersonID == 0)
                {
                    string strUserName = UserName;
                    int_tsPersonID = (from User p in DataWorkspace.MeerkatData.Users
                                      where p.ADUsername.ToLower() == strUserName.ToLower() || p.SharepointUserName.ToLower() == strUserName.ToLower()
                                          //|| p.ADUsername.StartsWith(strUserName) || p.SharepointUserName.StartsWith(strUserName)
                                      || p.ADUsername.ToLower().StartsWith(strUserName.ToLower()) || p.SharepointUserName.ToLower().StartsWith(strUserName.ToLower())
                                      || p.ADUsername.ToLower().Contains(strUserName.ToLower()) || p.SharepointUserName.ToLower().Contains(strUserName.ToLower())
                                      select p.UserID).FirstOrDefault();


                }
                return int_tsPersonID;
            }
        }


        #endregion


        partial void Questions_Updating(Question entity)
        {
            /*//Insert a new form response if one doesn't exist
            int FormResponse_ID ;
            using (SqlConnection connection = new SqlConnection())
            {
                string connectionStringName = this.DataWorkspace.MeerkatData.Details.Name;
                connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;

                string procedure = "entity.isComplforms.insertFormResponse";
                using (SqlCommand command = new SqlCommand(procedure, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(
                        new SqlParameter("@FormID", entity.Category.Form.Form_ID));

                    command.Parameters.Add(
                                            new SqlParameter("@isConfidential", entity.isConfidential));

                    connection.Open();
                    FormResponse_ID = Convert.ToInt32( command.ExecuteScalar().ToString());
                }
            } */
            //Doing in SQL proc to save round trips.
        

            using (SqlConnection connection = new SqlConnection())
            {
                string connectionStringName = this.DataWorkspace.MeerkatData.Details.Name;
                connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;

                string procedure = "forms.InsertResponse";
                using (SqlCommand command = new SqlCommand(procedure, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(
                        new SqlParameter("@FormID", entity.Category.Form.Form_ID));

                    command.Parameters.Add(
                        new SqlParameter("@FormResponse_FNVID", entity.FormResponse_FNVID));
                    command.Parameters.Add(
                        new SqlParameter("@Question_ID", entity.Question_ID));
                    if (entity.PotentialResponse == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@PotentialResponse_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@PotentialResponse_ID", entity.PotentialResponse.PotentialResponse_ID));
                    }
                    if (entity.Response == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Response", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Response", entity.Response));
                    }

                    if (entity.TrueOrFalse == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@TrueFalse", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@TrueFalse", entity.TrueOrFalse));
                    }

                    if (entity.IntegerResponse == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@IntegerResponse", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@IntegerResponse", entity.IntegerResponse));
                    }
                    if (entity.DecimalResponse == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@DecimalResponse", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@DecimalResponse", entity.DecimalResponse));
                    }

                    if (entity.isConfidential == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@isConfidential", 0));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@isConfidential", entity.isConfidential));
                    }

                    if (entity.Location == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Location_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Location_ID", entity.Location.Location_ID));
                    }

                    if (entity.Age == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Age_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Age_ID", entity.Age.Age_ID));
                    }

                    if (entity.AgeBand == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@AgeBand_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@AgeBand_ID", entity.AgeBand.AgeBand_ID));
                    }

                    if (entity.CommunityType == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@CommunityType_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@CommunityType_ID", entity.CommunityType.CommunityType_ID));
                    }

                    if (entity.Gender == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Gender_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Gender_ID", entity.Gender.Gender_ID));
                    }

                    if (entity.Group == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Group_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Group_ID", entity.Group.Group_ID));
                    }

                    if (entity.Institution == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@Institution_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@Institution_ID", entity.Institution.Institution_ID));
                    }

                    if (entity.Project == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@ProjectID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@ProjectID", entity.Project.ProjectID));
                    }

                    if (entity.ReportingPeriod == null)
                    {
                        command.Parameters.Add(
                       new SqlParameter("@ReportingPeriod_ID", null));
                    }
                    else
                    {
                        command.Parameters.Add(
                            new SqlParameter("@ReportingPeriod_ID", entity.ReportingPeriod.ID));
                    }
                   

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }                 
            }
            entity.DecimalResponse = null;
            entity.IntegerResponse = null;
            entity.TrueOrFalse = null;
            entity.PotentialResponse = null;
            entity.Response = null;
            this.Details.DiscardChanges();
        }

        partial void Categories_Updating(Category entity)
        {
        }

        partial void Categories_Inserting(Category entity)
        {

        }

        partial void Forms_Updating(Form entity)
        {
            if ((entity.isComplete))
            {
                using (SqlConnection connection = new SqlConnection())
                {
                    string connectionStringName = this.DataWorkspace.MeerkatData.Details.Name;
                    connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;

                    string procedure = "forms.MarkComplete";
                    using (SqlCommand command = new SqlCommand(procedure, connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;


                        command.Parameters.Add(
                            new SqlParameter("@FormResponse_FNVID", entity.FormResponse_FNVID));
                        connection.Open();
                        command.ExecuteNonQuery();
                    }


                

                }
            }
            this.Details.DiscardChanges();
           
        }


        partial void Forms_Filter(ref Expression<Func<Form, bool>> filter)
        {
            filter = e => (
                   ((e.vwFormUserMaps.Where(x => x.UserID == tsPersonID)
                   ).Count() >= 1 || this.BypassSecurity == true) &&
                   e.ActiveType.ID == 1)
                   ;
            
        }

        partial void Projects_Filter(ref Expression<Func<Project, bool>> filter)
        {
            filter = e => (
                   ((e.vwProjectUserMaps.Where(x => x.UserID == tsPersonID)
                   ).Count() >= 1 || this.BypassSecurity == true) &&
                   e.ActiveType.ID == 1)
                   ;
            
        }

        #region Active Filters
        partial void AgeBands_Filter(ref Expression<Func<AgeBand, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Ages_Filter(ref Expression<Func<Age, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Categories_Filter(ref Expression<Func<Category, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void CommunityTypes_Filter(ref Expression<Func<CommunityType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Form_Programmes_Filter(ref Expression<Func<Form_Programme, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Form_Projects_Filter(ref Expression<Func<Form_Project, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        
                partial void Groups_Filter(ref Expression<Func<Group, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Institutions_Filter(ref Expression<Func<Institution, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void Locations_Filter(ref Expression<Func<Location, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void PotentialResponses_Filter(ref Expression<Func<PotentialResponse, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        

        partial void Query_ExecuteFailed(QueryExecuteFailedDescriptor queryDescriptor)
        {

        }

        partial void Questions_Filter(ref Expression<Func<Question, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }

        partial void QuestionTypes_Filter(ref Expression<Func<QuestionType, bool>> filter)
        {
            filter = e => e.ActiveType.ID == 1;

        }
        #endregion

        partial void ProjectsSorted_PreprocessQuery(ref IQueryable<Project> query)
        {

        }

        partial void FormResponsesUnfinished_PreprocessQuery(int? Form, int? Project, ref IQueryable<FormResponse> query)
        {
            
            query = query.Where(e =>  (e.vwUnfinishedForms.Where( x => x.FormResponse_ID == e.FormResponse_ID).Count() >= 1)
                );
            
        }
    }
}
