using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Meerkat.GeoJSON
{
    [Serializable]
    public class FeatureProperties : ISerializable
    {
        public System.Data.DataRow fdr;

        #region ISerializable Members

        void ISerializable.GetObjectData(SerializationInfo info, StreamingContext context)
        {
            foreach (System.Data.DataColumn columnSpec in fdr.Table.Columns)
            {
                switch (fdr[columnSpec.ColumnName].GetType().FullName)
                {
                    case "Microsoft.SqlServer.Types.SqlGeometry":
                        // filter out geometry 
                        break;
                    case "Microsoft.SqlServer.Types.SqlGeography":
                        // filter out geography
                        break;
                    case "System.Byte[]":
                        // filter out byte arrays (WKB or images)
                        break;
                    case "System.String":
                        // trim off white space
                        info.AddValue(columnSpec.ColumnName, fdr[columnSpec.ColumnName].ToString().Trim());
                        break;
                    case "System.DateTime":
                        // might want to convert to UTC
                        // info.AddValue(columnSpec.ColumnName, System.TimeZone.CurrentTimeZone.ToUniversalTime(fdr[columnSpec.ColumnName]));
                        DateTime dt = (DateTime)fdr[columnSpec.ColumnName];
                        info.AddValue(columnSpec.ColumnName, dt.ToString("s"));
                        break;
                    default:
                        info.AddValue(columnSpec.ColumnName, fdr[columnSpec.ColumnName]);
                        break;
                }
            }
        }

        #endregion
    }
}

