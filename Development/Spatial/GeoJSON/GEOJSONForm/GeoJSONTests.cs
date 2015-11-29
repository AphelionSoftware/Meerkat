using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using GeoJSON;
using System.Text;
using System.IO;
using System.Configuration;

namespace GEOJSONForm
{
    public partial class GeoJSONTests : Form
    {
        public GeoJSONTests()
        {
            InitializeComponent();
        }

        private void btnRun_Click(object sender, EventArgs e)
        {
            StringBuilder sql = new StringBuilder();
            sql.Append(this.txtSQL.Text);

            // create JSON object and populate with data
            FeatureCollection container = new FeatureCollection();
            container.PopulateBySQL(this.txtConn.Text, "System.Data.SqlClient", sql.ToString());

            // serialise
            System.Runtime.Serialization.Json.DataContractJsonSerializer dcjs = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(FeatureCollection));
            MemoryStream ms1 = new MemoryStream();
            dcjs.WriteObject(ms1, container);
            string json = Encoding.Default.GetString(ms1.ToArray());
            ms1.Close();

            var x = json;

            this.txtJSON.Text = json;
        }
    }
}
