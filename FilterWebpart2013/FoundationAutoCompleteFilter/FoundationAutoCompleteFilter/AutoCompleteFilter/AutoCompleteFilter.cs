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

namespace FoundationAutoCompleteFilter.AutoCompleteFilter
{
    [ToolboxItemAttribute(false)]
    public partial class JSAutoCompleteFilterX : wp.WebPart, wp.ITransformableFilterValues
    {
        private string _DefaultID;
        private string _queryStringItem;
        private string _queryString;
        private string _Conn;

        
       

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("Edit this WebPart Settings to Configure Filter Values");
        }



        public JSAutoCompleteFilterX()
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
        }

         protected override void OnPreRender(EventArgs e)
        {
            this.Hidden = !base.DesignMode;
            base.OnPreRender(e);
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
              
               return _queryStringItem;
              
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

        
        [WebBrowsable(true), Personalizable(PersonalizationScope.Shared), WebDisplayName("ID Parameter")]
        public string QueryStringDefaultValue
        {
            get
            {
                return this._DefaultID;
            }
            set
            {
                this._DefaultID = value;
            }
        }

        [WebDisplayName("Parameter Display Name"), WebBrowsable(true), Personalizable(PersonalizationScope.Shared)]
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
        [WebDisplayName("Query"), WebBrowsable(true), Personalizable(PersonalizationScope.Shared)]
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
       WebDisplayName("Filter query Connection string"),
       WebDescription("Connection string for the Filter"),
       Personalizable(PersonalizationScope.Shared)]

        public string Conn
        {
            get { 
                return this._Conn; 
            }
            set
            {

                this._Conn = value;
            }
        }
    }
   
   }



