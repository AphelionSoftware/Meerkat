using System;
using System.Collections.Generic;
using System.ComponentModel;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI;

namespace YetAnotherConsumerWebPart.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    [ToolboxData("<{0}:ParameterizableControl runat=server></{0}:ParameterizableControl>")]
    public partial class VisualWebPart1 : Microsoft.SharePoint.WebPartPages.WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling using
        // the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
        // [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
private List<IFilterValues> _filterProviders;

        private List<IFilterValues> FilterProviders
        {
            get { return _filterProviders; }
            set { _filterProviders = value; }
        }

        public VisualWebPart1()
        {
            _filterProviders = new List<IFilterValues>();
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            foreach (IFilterValues filter in FilterProviders)
            {
                writer.WriteLine(string.Format("Parameter: {0} <br>", filter.ParameterName));
                if (filter.ParameterValues != null)
                {
                    foreach (string value in filter.ParameterValues)
                        if (!string.IsNullOrEmpty(value))
                            writer.WriteLine(string.Format("  value: {0} <br>", value));
                }
            }
            base.Render(writer);
        }

    [ConnectionConsumer(
        "FilterConsumer", 
        "IFilterValues", 
        AllowsMultipleConnections = true)]
    public void SetFilter(IFilterValues filterValues)
    {
        //this.FilterProviders.Add(filterValues);
        if (filterValues != null)
        {
            
            EnsureChildControls();
            List<ConsumerParameter> parameters = new List<ConsumerParameter>();
            parameters.Add(new ConsumerParameter(
                "Region", 
                ConsumerParameterCapabilities.SupportsMultipleValues | 
                ConsumerParameterCapabilities.SupportsAllValue));
          
            filterValues.SetConsumerParameters(
                new System.Collections.ObjectModel.ReadOnlyCollection<ConsumerParameter>(parameters));
            this.FilterProviders.Add(filterValues);
        }
    }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeControl();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}
