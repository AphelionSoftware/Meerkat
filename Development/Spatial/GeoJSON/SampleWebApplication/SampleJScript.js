var map;
$(document).ready(function() {
    map = new VEMap("myMap");
    map.LoadMap(null, null, VEMapStyle.Road);
});

function ShowGeoJSON() {
    //$.get('GeoJSONHandler.ashx', function(data) {

    $.ajax({ type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "GeoJSONHandler.ashx",
        data: "{}",
        datatype: "json",
        success: function(data) {
            var geojson = eval('(' + data + ')');

            var featureCount = geojson.features.length;
            for (var i = 0; i < featureCount; i++) {
                var feature = geojson.features[i];
                var polygon = feature.geometry.coordinates[0];
                var pointCount = polygon.length;
                var points = new Array(pointCount);
                for (var j = 0; j < pointCount; j++) {
                    points[j] = new VELatLong(polygon[j][0], polygon[j][1]);
                }
                var shape = new VEShape(VEShapeType.Polygon, points);
                // apply style
                shape.SetFillColor(new VEColor(200, 150, 100, 0.5));
                map.AddShape(shape);
                map.SetMapView(points);

            }
        }
    });
}