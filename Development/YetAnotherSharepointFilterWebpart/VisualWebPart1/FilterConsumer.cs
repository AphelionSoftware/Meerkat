using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel;
using System.Web.UI;


namespace YetAnotherSharepointFilterWebpart.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    [ToolboxData("<{0}:ParameterizableControl runat=server></{0}:ParameterizableControl>")]
    public class FilterConsumer : System.Web.UI.WebControls.WebParts.WebPart
    {
        private List<IFilterValues> _filterProviders;

        private List<IFilterValues> FilterProviders
        {
            get { return _filterProviders; }
            set { _filterProviders = value; }
        }
       
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public FilterConsumer()
        {
            _filterProviders = new List<IFilterValues>();
        }

        protected override void OnPreRender(EventArgs e)
        {
            this.Hidden = false;
            base.OnPreRender(e);
            
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            writer.Write("Hi");
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
        this.FilterProviders.Add(filterValues);
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
    
   }

}