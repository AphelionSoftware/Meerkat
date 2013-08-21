
namespace LightSwitchApplication.api
{
    using System;
    using System.Collections.Generic;
    using System.Web.Http;
    using System.Linq;

    public class TodaysReportingPeriodController : ApiController
    {
        public int Get()
        {
            var result = default(ReportingPeriod);
            var now = DateTime.Now;
            using (var context = ServerApplicationContext.CreateContext())
            {
                result = (from _ in context.DataWorkspace.MeerkatData.ReportingPeriods.GetQuery().Execute()
                          where (now >= _.FirstCycleDate) && (now <= _.LastCycleDate)
                          select _).Single();
            }

            return result.ID;
        }
    }
}