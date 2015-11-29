using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using System.Data;
using System.Data.Common;

namespace Meerkat.GeoJSON
{
    [DataContract]
    public class FeatureCollection
    {
        [DataMemberAttribute(Order = 0)]
        string type = "FeatureCollection";

        [DataMemberAttribute(Order = 1)]
        public List<Feature> features = new List<Feature>();


        // populate the feature collection from sql
        public void PopulateBySQL(string connectionString, string providerInvariantName, string sql)
        {
            System.Data.DataSet ds = ExecuteSql(connectionString, providerInvariantName, sql.ToString());
            foreach (System.Data.DataRow fdr in ds.Tables[0].Rows)
            {
                Feature feature = new Feature();
                FeatureProperties props = new FeatureProperties();
                props.fdr = fdr;
                FeatureGeometry geom = new FeatureGeometry();
                geom.fdr = fdr;                

                feature.properties = props;
                feature.geometry = geom;
                this.features.Add(feature);
            }
        }

        private DataSet ExecuteSql(string connectionString, string providerInvariantName, string sql)
        {
            System.Data.DataSet ds = new DataSet();
            try
            {
                DbProviderFactory f = DbProviderFactories.GetFactory(providerInvariantName);
                DbConnection connection = f.CreateConnection();
                connection.ConnectionString = connectionString;
                DbCommand command = f.CreateCommand();
                command.CommandText = sql;
                command.Connection = connection;
                DbDataAdapter da = f.CreateDataAdapter();
                da.SelectCommand = command;
                da.Fill(ds);
                connection.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
            return ds;
        }
    }
}
