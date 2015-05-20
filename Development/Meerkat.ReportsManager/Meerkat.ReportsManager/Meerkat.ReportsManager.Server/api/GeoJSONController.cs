using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Meerkat.GeoJSON;
using System.Text;
using System.IO;
using System.Configuration;

namespace LightSwitchApplication.api
{
    public class GeoJSONController : ApiController
    {
        // GET api/<controller>
        public string Get(string id)
        {
            using (ServerApplicationContext context = ServerApplicationContext.CreateContext())
            {

                string sSQL = id;
                string sConnectionName = context.DataWorkspace.MeerkatData.Details.Name;
                string sConn = ConfigurationManager.ConnectionStrings[sConnectionName].ConnectionString;
                FeatureCollection container = new FeatureCollection();
                container.PopulateBySQL(sConn, "System.Data.SqlClient", sSQL);

                // serialise
                System.Runtime.Serialization.Json.DataContractJsonSerializer dcjs = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(FeatureCollection));
                MemoryStream ms1 = new MemoryStream();
                dcjs.WriteObject(ms1, container);
                string json = Encoding.Default.GetString(ms1.ToArray());
                ms1.Close();
                return json;

            }
        }
         
    }
}