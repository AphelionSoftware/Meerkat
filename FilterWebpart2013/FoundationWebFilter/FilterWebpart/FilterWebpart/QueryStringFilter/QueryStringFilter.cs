using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using System.Data;

namespace FilterWebPart.QueryStringFilter
{
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
            return new QueryStringFilter(System.Web.HttpContext.Current.Request.QueryString[myQueryStringParameter] == null ? "" : System.Web.HttpContext.Current.Request.QueryString[myQueryStringParameter]);
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
}
