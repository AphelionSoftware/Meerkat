
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
                try
                {
                    int nowID = (now.Year * 10000) + (now.Month * 100) + now.Day;

                    /*result = (from _ in context.DataWorkspace.MeerkatData.ReportingPeriods.GetQuery().Execute()
                              where (now >= _.FirstCycleDate) && (now <= _.LastCycleDate)
                              select _).Single();*/
                    result = (from _ in context.DataWorkspace.MeerkatData.ReportingPeriods.GetQuery().Execute()
                              where (nowID >= _.StartDateID) && (nowID <= _.EndDateID)
                              select _).Single();
                }
                catch (System.Exception ex)
                {

                    return 0;
                }
            }

            return result.ID;
        }
    }
}