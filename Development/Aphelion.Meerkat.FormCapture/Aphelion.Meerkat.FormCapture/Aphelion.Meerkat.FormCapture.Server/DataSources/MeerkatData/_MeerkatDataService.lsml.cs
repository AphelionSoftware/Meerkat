using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.LightSwitch;
using Microsoft.LightSwitch.Security.Server;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace LightSwitchApplication
{
    public partial class MeerkatDataService
    {


        partial void Questions_Updating(Question entity)
        {
            /*//Insert a new form response if one doesn't exist
            int FormResponse_ID ;
            using (SqlConnection connection = new SqlConnection())
            {
                string connectionStringName = this.DataWorkspace.MeerkatData.Details.Name;
                connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;

                string procedure = "forms.insertFormResponse";
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

                    command.Parameters.Add(
                                            new SqlParameter("@isConfidential", entity.isConfidential));

                    command.Parameters.Add(
                                                                new SqlParameter("@Location_ID", entity.Location.Location_ID));

                    connection.Open();
                    command.ExecuteNonQuery();
                }                 
            }
            entity.DecimalResponse = null;
            entity.IntegerResponse = null;
            entity.TrueOrFalse = null;
            entity.PotentialResponse = null;
            entity.Response = null;
            //this.Details.DiscardChanges();
        }

        partial void Categories_Updating(Category entity)
        {
        }

        partial void Categories_Inserting(Category entity)
        {

        }

        partial void Forms_Updating(Form entity)
        {
           //entity.isConfidential = false;
           this.Details.DiscardChanges();
        }
    }
}
