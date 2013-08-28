
namespace LightSwitchApplication.api
{
    using System.Collections.Generic;
    using System.Configuration;
    using System.Data.SqlClient;
    using System.Web.Http;


    public class RSPController : ApiController
    {
        public IEnumerable<IEnumerable<object>> Get([FromUri]string storedProc, [FromUri]IDictionary<string, object> parameters)
        {
            var result = new List<List<object>>();
            var connectionStringIdentifier = "";
            using (var context = ServerApplicationContext.CreateContext())
            {
                connectionStringIdentifier = context.DataWorkspace.MeerkatData.Details.Name;
            }

            using (var connection = new SqlConnection())
            {
                //connection.ConnectionString = ConfigurationManager.ConnectionStrings[connectionStringIdentifier].ConnectionString;
                connection.ConnectionString = "Data Source=46.4.60.108;Initial Catalog=Meerkat;Persist Security Info=True;User ID=remoteAdmin;Password=Denali@2011";

                using (var command = new SqlCommand(storedProc, connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    if (parameters != null)
                    {
                        foreach (var item in parameters)
                        {
                            command.Parameters.AddWithValue(item.Key, item.Value);
                        }
                    }

                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var row = new List<object>();
                            for (int colCounter = 0; colCounter < reader.FieldCount; colCounter++)
                            {
                                row.Add(reader[colCounter]);
                            }

                            result.Add(row);
                        }
                    }
                }
            }

            return result;
        }
    }
}