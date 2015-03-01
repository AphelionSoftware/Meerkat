﻿
namespace LightSwitchApplication.api
{
    using System.IO;
    using System.Reflection;
    using System.Web.Http;
    using Microsoft.LightSwitch;
    using System.Linq;

    public class LightSwitchHelpersController : ApiController
    {
        public LightSwitchPlatformInfo Get()
        {
            var result = new LightSwitchPlatformInfo();
            var executingAssembly = Assembly.GetExecutingAssembly();

            result.Version = executingAssembly.GetName().Version.ToString();
            result.Deployed = File.GetLastWriteTime(Assembly.GetExecutingAssembly().Location).ToString("dd MMM yyyy hh:mm");
            result.UserName = "Unknown - to be implemented";

            result.ClientCode = "Unknown - to be implemented";  
            return result;
        }
    }
}