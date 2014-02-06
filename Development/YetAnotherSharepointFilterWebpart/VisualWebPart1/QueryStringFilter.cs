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

namespace YetAnotherSharepointFilterWebpart.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    public partial class VisualWebPart1 : wp.WebPart, wp.ITransformableFilterValues {
        private string _queryStringDefaultValue;
        private string _queryStringItem;

        protected void Page_Load(object sender, EventArgs e)
        {
        }


        public VisualWebPart1()
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
               // return "Query String Item";//
               return _queryStringItem;
                //Here is where you must get the name of the parameter
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

