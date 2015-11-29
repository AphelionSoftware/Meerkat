using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Data;
using wp = Microsoft.SharePoint.WebPartPages;
using System;
using System.Collections.ObjectModel;
using System.Runtime.InteropServices;

namespace WPQueryStringFilter.QueryStringFilter
{
    /*
 [ToolboxItemAttribute(false)]
    public class QueryStringFilter : WebPart, IWebPartRow
    {
        private DataTable mydata;

        /// <summary>
        /// Initialize my data creating an empty datatable with one
        /// column named "Filter"
        /// </summary>
        public QueryStringFilter()
        {
            //
            mydata = new DataTable();

            DataColumn col = new DataColumn();
            col.DataType = typeof(string);
            col.ColumnName = "Filter";
            mydata.Columns.Add(col);
        }

        /// <summary>
        /// Initialize my data creating a datatable with one
        /// column named "Filter" and the filter value assigned
        /// </summary>
        /// <param name="filter">
        /// Value of the filter to be assigned
        /// </param>
        public QueryStringFilter(string filter)
        {
            mydata = new DataTable();

            DataColumn col = new DataColumn();
            col.DataType = typeof(string);
            col.ColumnName = "Filter";
            mydata.Columns.Add(col);

            DataRow mifila = mydata.NewRow();
            mifila["Filter"] = filter;

            mydata.Rows.Add(mifila);
        }

        private string myQueryStringParameter = "type";
        [Personalizable(PersonalizationScope.Shared),
        WebBrowsable(true),
        Category("QueryString Filter"),
        WebDisplayName("Querystring parameter name to be used."),
        WebDescription("Example: iduser")]

        public string QueryStringParameter
        {
            get { return myQueryStringParameter; }
            set { myQueryStringParameter = value; }
        }

        protected override void CreateChildControls()
        {
        }

      

        [ConnectionProvider("Row")]
        public IWebPartRow GetConnectionInterface()
        {
            if ( System.Web.HttpContext.Current.Request.QueryString[myQueryStringParameter] == null)
            {
                return null;
            }


           
          return  new QueryStringFilter( System.Web.HttpContext.Current.Request.QueryString[myQueryStringParameter]);
        }

        public void GetRowData(RowCallback callback)
        {
            callback(mydata.DefaultView[0]);
        }

        public PropertyDescriptorCollection Schema
        {
            get { return TypeDescriptor.GetProperties(mydata.DefaultView[0]); }
        }
    }
    */
     [ToolboxItemAttribute(false)]
    public class CustomQueryStringFilterWebPart : WebPart, wp.ITransformableFilterValues
    {
        private string _queryStringDefaultValue;
        private string _queryStringItem;

        public CustomQueryStringFilterWebPart()
        {
            this.ExportMode = WebPartExportMode.All;
        }

        protected override void OnPreRender(EventArgs e)
        {
            this.Hidden = !base.DesignMode;
            base.OnPreRender(e);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("Edit this WebPart Settings to Configure Filter Values");
        }

        [ConnectionProvider("Query String Filter", "ITransformableFilterValues", AllowsMultipleConnections = true)]
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
                return "Query String Item";
            }
        }

        public ReadOnlyCollection<string> ParameterValues
        {
            get
            {
                string queryStringDefaultValue = this.Context.Request.QueryString[this.QueryStringItem];
                if (string.IsNullOrEmpty(queryStringDefaultValue))
                {
                    queryStringDefaultValue = this.QueryStringDefaultValue;
                }
                return new ReadOnlyCollection<string>(new string[] { queryStringDefaultValue });
            }
        }

        [WebBrowsable(true), Personalizable(PersonalizationScope.Shared), WebDisplayName("Default Value for Parameter")]
        public string QueryStringDefaultValue
        {
            get
            {
                return this._queryStringDefaultValue;
            }
            set
            {
                this._queryStringDefaultValue = value;
            }
        }

        [WebDisplayName("Query String Parameter Name"), WebBrowsable(true), Personalizable(PersonalizationScope.Shared)]
        public string QueryStringItem
        {
            get
            {
                return this._queryStringItem;
            }
            set
            {
                this._queryStringItem = value;
            }
        }
    }
}
