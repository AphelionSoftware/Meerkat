using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Meerkat.GeoJSON
{
    [DataContract]
    public class Feature
    {
        [DataMemberAttribute(Order = 0)]
        public string type = "Feature";
        [DataMemberAttribute(Order = 1)]
        public FeatureGeometry geometry;
        [DataMemberAttribute(Order = 2)]
        public FeatureProperties properties;
    }
}