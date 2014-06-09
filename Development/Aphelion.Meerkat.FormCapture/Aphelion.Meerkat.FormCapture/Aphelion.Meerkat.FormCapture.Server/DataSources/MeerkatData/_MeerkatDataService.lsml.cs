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

                    connection.Open();
                    FormResponse_ID = Convert.ToInt32( command.ExecuteScalar().ToString());
                }
            } 
        

            using (SqlConnection connection = new SqlConnection())
            {
                string connectionStringName = this.DataWorkspace.MeerkatData.Details.Name;
                connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringName].ConnectionString;

                string procedure = "forms.InsertResponse";
                using (SqlCommand command = new SqlCommand(procedure, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(
                        new SqlParameter("@FormResponse_ID", FormResponse_ID));
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
                    connection.Open();
                    command.ExecuteNonQuery();
                }                 
            }

            this.Details.DiscardChanges();
        }

        partial void Categories_Updating(Category entity)
        {
        }
    }
}
