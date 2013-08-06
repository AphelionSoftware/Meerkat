
namespace LightSwitchApplication.api
{
    using System.IO;
    using System.Reflection;
    using System.Web.Http;

    public class LightSwitchHelpersController : ApiController
    {
        public LightSwitchPlatformInfo Get()
        {
            var result = new LightSwitchPlatformInfo();
            var executingAssembly = Assembly.GetExecutingAssembly();

            result.Version = executingAssembly.GetName().Version.ToString();
            result.Deployed = File.GetCreationTime(Assembly.GetExecutingAssembly().Location).ToString("dd MMM yyyy hh:mm");

            return result;
        }
    }
}