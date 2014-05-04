using System;
using System.ComponentModel;
using System.Web.UI;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;
using wp = Microsoft.SharePoint.WebPartPages;
using System.Collections.ObjectModel;
using System.Runtime.InteropServices;


namespace JSFilterPart.VisualWebPart1 
{
    [ToolboxItemAttribute(false)]
    public partial class VisualWebPart1 :  wp.WebPart, wp.ITransformableFilterValues {
        private string _queryDefaultValue;
        private string _queryItem ="Filter Value";
        private string _queryString;
        private string _Conn;



        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling on a farm solution
        // using the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        
        public VisualWebPart1()
        {
            this.ExportMode = WebPartExportMode.All;
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this._Conn == null)
            {

                return;
            }
            else {
                populateJSON();
            
            }

        }






        public void populateJSON()
        {
            
            ClientScriptManager ClientScript = Page.ClientScript;

            StringBuilder FilterString = new StringBuilder();

            FilterString.Append("[");

            DataTable FilterTable = getJSONValues();


            foreach (DataRow row in FilterTable.Rows)
            {



                FilterString.Append("{ID: \"" + row[0] + "\",value: \"" + row[1] +"\"},");




            }
            FilterString.Remove(FilterString.Length - 1, 1);
            FilterString.Append("]");

            if (!ClientScript.IsClientScriptBlockRegistered("FilterScript"))
            {
                string prod = string.Format("var FilterValues = {0};", FilterString);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "FilterScript", prod, true);
            }


        }

        private DataTable getJSONValues()
        {
            string con= this.Conn;
            string query = this.QueryString;
            var fTable = new DataTable();
            var connection = new SqlConnection() { ConnectionString = con };
            var command = new SqlCommand(query, connection) { CommandType = CommandType.Text };
            connection.Open();
            var dataAdapter = new SqlDataAdapter(command);
            dataAdapter.Fill(fTable);
            connection.Close();
            return fTable;
        }



        [ConnectionProvider("FilterProvider", "ITransformableFilterValues", AllowsMultipleConnections = true)]
        public wp.ITransformableFilterValues SetConnectionInterface()
        {
            return this;
        }

       
        public bool AllowAllValue
        {
            get
            {
                return false;
            }
        }

        public bool AllowEmptyValue
        {
            get
            {
                return true;
            }
        }

        public bool AllowMultipleValues
        {
            get
            {
                return false;
            }
        }

        public string ParameterName
        {
            get
            {
               
               return _queryItem;
                
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public ReadOnlyCollection<string> ParameterValues
        {
            get
            {
                //here we need to get the actual value - only return default if the actual value is not populated
                string queryDefaultValue = HiddenFilterValue.Value;
                if (string.IsNullOrEmpty(queryDefaultValue))
                {
                    queryDefaultValue = this.QueryDefaultValue;
                }

                return new ReadOnlyCollection<string>(new string[] { queryDefaultValue });
            }
        }

        [WebBrowsable(true), Personalizable(PersonalizationScope.Shared), WebDisplayName("Default Value for Parameter")]
        public string QueryDefaultValue
        {
            get
            {
                return this._queryDefaultValue;
            }
            set
            {
                this._queryDefaultValue = value;
            }
        }

        [WebDisplayName("Parameter Name"),
         WebDescription("Parameter passed to the filter."),
        WebBrowsable(true) 
        ]
        public string QueryStringItem
        {
            get
            {
                return this._queryItem;
            }
           /* set
            {
                this._queryItem = value;
            }*/
        }


        [WebDisplayName("Query"),
        WebDescription("Query to retrieve filter values. Example - SELECT ID,DISPLAYVALUE FROM TABLE "),
        WebBrowsable(true), Personalizable(PersonalizationScope.Shared)]
        public string QueryString
        {
            get
            {
                return this._queryString;
            }
            set
            {
                this._queryString = value;
            }
        }

        [WebBrowsable(true),
       WebDisplayName("Filter Query Connection string"),
       WebDescription("Connection string for the Filter"),
       Personalizable(PersonalizationScope.Shared)]

        public string Conn
        {
            get
            {
                return this._Conn;
            }
            set
            {

                this._Conn = value;
            }
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            ReadOnlyCollection<String> Mycollection ;
          Mycollection = ParameterValues;
        }
    }

}