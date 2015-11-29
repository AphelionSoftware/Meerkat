using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Text;
using System.IO;
using GeoJSON;
using System.IO.Compression;
using System.Globalization;

namespace SampleWebApplication
{
    /// <summary>
    /// Summary description for $codebehindclassname$
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class GeoJSONHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            // execute sql against database to get result set
            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT * FROM LandParcel");

            // create JSON object and populate with data
            FeatureCollection container = new FeatureCollection();
            container.PopulateBySQL(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Projects\GeoJSON\SampleWebApplication\App_Data\SampleDatabase.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True", "System.Data.SqlClient", sql.ToString());

            // serialise
            System.Runtime.Serialization.Json.DataContractJsonSerializer dcjs = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(FeatureCollection));
            MemoryStream ms1 = new MemoryStream();
            dcjs.WriteObject(ms1, container);
            string json1 = Encoding.Default.GetString(ms1.ToArray());            
            ms1.Close();

            // create response

            //Ajax Web Service request always starts with application/json to help prevent XSS attacks see Scott Gutheries blog on this
            if (context.Request.ContentType.ToLower(CultureInfo.InvariantCulture).StartsWith("application/json"))
            {
                //User may be using an older version of IE which does not support compression, so skip those
                if (!((context.Request.Browser.IsBrowser("IE")) && (context.Request.Browser.MajorVersion <= 6)))
                {
                    string acceptEncoding = context.Request.Headers["Accept-Encoding"];

                    if (!string.IsNullOrEmpty(acceptEncoding))
                    {
                        acceptEncoding = acceptEncoding.ToLower(CultureInfo.InvariantCulture);

                        if (acceptEncoding.Contains("gzip"))
                        {
                            context.Response.Filter = new GZipStream(context.Response.Filter, CompressionMode.Compress);
                            context.Response.AddHeader("Content-encoding", "gzip");
                        }
                        else if (acceptEncoding.Contains("deflate"))
                        {
                            context.Response.Filter = new DeflateStream(context.Response.Filter, CompressionMode.Compress);
                            context.Response.AddHeader("Content-encoding", "deflate");
                        }
                    }
                }
                context.Response.Write(json1);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
