using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using Microsoft.SqlServer.Types;

namespace Meerkat.GeoJSON
{
    [Serializable]
    [KnownType(typeof(double[][]))]
    [KnownType(typeof(double[][][]))]
    public class FeatureGeometry : ISerializable
    {
        public System.Data.DataRow fdr;
        private string geometryColumn;
        private string geographyColumn;

        #region ISerializable Members

        void ISerializable.GetObjectData(SerializationInfo info, StreamingContext context)
        {
            // TODO: behaviour is to find the first spatial column either geometry, 
            // geography, wkb or wkt.  Initial cut is for sqlgeometry or wkb potentailly from other rdbms
            foreach (System.Data.DataColumn columnSpec in fdr.Table.Columns)
            {
                switch (fdr[columnSpec.ColumnName].GetType().FullName)
                {
                    case "Microsoft.SqlServer.Types.SqlGeometry":
                        this.geometryColumn = columnSpec.ColumnName;
                        break;
                    case "Microsoft.SqlServer.Types.SqlGeography":
                        this.geographyColumn = columnSpec.ColumnName;
                        break;
                    case "System.Byte[]":
                        this.geometryColumn = columnSpec.ColumnName;
                        break;
                }
            }

            // if we don't know the geometry column then we can't go on
            // MGS adding geography
            if (geometryColumn != null)
            // throw new InvalidOperationException("Cannot detect the geometry column in the dataset");
            {
                Microsoft.SqlServer.Types.SqlGeometry geometry = new Microsoft.SqlServer.Types.SqlGeometry();

                // parse supported spatial datatypes, if it's System.Byte[] then it'll throw an exception on STGeomFromWKB
                switch (fdr[geometryColumn].GetType().FullName)
                {
                    case "Microsoft.SqlServer.Types.SqlGeometry":
                        geometry = (Microsoft.SqlServer.Types.SqlGeometry)fdr[geometryColumn];
                        break;
                    
                    case "TEXT":
                        // Well known text
                        //throw new NotImplementedException();
                        break;
                    case "System.Byte[]":
                        // Well known binary
                        //TODO: what to do about SRID
                        System.Data.SqlTypes.SqlBytes wkbGeometry = new System.Data.SqlTypes.SqlBytes((byte[])fdr[geometryColumn]);
                        geometry = Microsoft.SqlServer.Types.SqlGeometry.STGeomFromWKB(wkbGeometry, 0);
                        break;
                    default:
                        break;
                }

                info.AddValue("type", this.JsonGeometryType(geometry));
                info.AddValue("coordinates", this.ToJson(geometry));
            }
            else if (geographyColumn != null)
            {
                Microsoft.SqlServer.Types.SqlGeography geography = new Microsoft.SqlServer.Types.SqlGeography();
                geography = (Microsoft.SqlServer.Types.SqlGeography)fdr[geographyColumn];
                info.AddValue("type", this.JsonGeographyType(geography));
                info.AddValue("coordinates", this.ToJson(geography));
            }
        }

        #endregion

        #region geography helpers
        // helper method to return json geometry type
        private string JsonGeographyType(SqlGeography _target)
        {
            return (string)_target.STGeometryType();
        }

        // helper method to return various object arrays for each
        // geometry type
        private object ToJson(SqlGeography _target)
        {
            object coordinates = null;

            switch ((string)_target.STGeometryType())
            {
                case "Point":
                    coordinates = new double[] { (double)_target.Lat, (double)_target.Long };
                    break;
                case "LineString":
                    double[][] lineCoordinates = new double[(int)_target.STNumPoints() - 1][];
                    for (int i = 1; i < _target.STNumPoints(); i++)
                    {
                        lineCoordinates[i - 1] = new double[] { (double)_target.STPointN(i).Lat, (double)_target.STPointN(i).Long };
                    }
                    coordinates = lineCoordinates;
                    break;
                case "Polygon":
                    int depth = (int)_target.STNumPoints();
                    double[][][] polygonCoordinates = new double[1][][];
                    polygonCoordinates[0] = new double[(int)_target.STNumPoints() - 1][];
                    for (int i = 1; i < _target.STNumPoints(); i++)
                    {
                        polygonCoordinates[0][i - 1] = new double[] { (double)_target.STPointN(i).Lat, (double)_target.STPointN(i).Long };
                    }
                    coordinates = polygonCoordinates;
                    break;
                default:
                    break;
            }
            return coordinates;
        }
        #endregion      

        // helper method to return json geometry type
        private string JsonGeometryType(SqlGeometry _target)
        {
            return (string)_target.STGeometryType();
        }

        // helper method to return various object arrays for each
        // geometry type
        private object ToJson(SqlGeometry _target)
        {
            object coordinates = null;

            switch ((string)_target.STGeometryType())
            {
                case "Point":
                    coordinates = new double[] { (double)_target.STY, (double)_target.STX };
                    break;
                case "LineString":
                    double[][] lineCoordinates = new double[(int)_target.STNumPoints() - 1][];
                    for (int i = 1; i < _target.STNumPoints(); i++)
                    {
                        lineCoordinates[i - 1] = new double[] { (double)_target.STPointN(i).STY, (double)_target.STPointN(i).STX };
                    }
                    coordinates = lineCoordinates;
                    break;
                case "Polygon":
                    int depth = (int)_target.STNumPoints();
                    double[][][] polygonCoordinates = new double[1][][];
                    polygonCoordinates[0] = new double[(int)_target.STNumPoints() - 1][];
                    for (int i = 1; i < _target.STExteriorRing().STNumPoints(); i++)
                    {
                        polygonCoordinates[0][i - 1] = new double[] { (double)_target.STPointN(i).STY, (double)_target.STPointN(i).STX };
                    }
                    coordinates = polygonCoordinates;
                    break;
                default:
                    break;
            }
            return coordinates;
        }
    }
}
