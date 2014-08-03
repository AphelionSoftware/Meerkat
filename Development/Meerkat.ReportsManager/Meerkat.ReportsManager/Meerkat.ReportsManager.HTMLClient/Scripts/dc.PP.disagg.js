/// <reference path="dc.js" />
/// <reference path="d3.js" />

function mapCharts(mapElement, url, mapURL) {

    var numberFormat = d3.format(".2f");

    var mapChart = dc.geoChoroplethChart(mapElement);

    
    
    d3.json(url,
    function (error, jsonData) {

        if (error) {
            alert(error);
            return;
        }
        var data = crossfilter(jsonData.value);
        var locations = data.dimension(function (d) {
            return d["Location_Name"];
        });

        var numberReached = locations.group().reduceSum(function (d) {
            if (d["NumberReached"]) {
                return d["NumberReached"];
            } else {
                return 0;
            }
        });

        d3.json(mapURL, function (locJSON) {
            var x = locJSON;
            var width = 960,
                height = 400;

            

            
            /*var bounds = d3.geo.bounds(locJSON),
                topLeft = bounds[0],
                bottomRight = bounds[1];

            var newWidth = bottomRight[0] - topLeft[0];
            var newHeight = bottomRight[1] - topLeft[1];
            var left = topLeft[0];
            var top = topLeft[1];

            var projection = d3.geo.mercator()
             .scale(200)
           .translate([width / 2, height]);*/

            // Create a unit projection.
            var projection = d3.geo.mercator()
                .scale(1)
                .translate([0, 0]);

            // Create a path generator.
            var path = d3.geo.path()
                .projection(projection);

            // Compute the bounds of a feature of interest, then derive scale & translate.
            var b = path.bounds(locJSON),
                s = .95 / Math.max((b[1][0] - b[0][0]) / width, (b[1][1] - b[0][1]) / height),
                t = [(width - s * (b[1][0] + b[0][0])) / 2, (height - s * (b[1][1] + b[0][1])) / 2];

            // Update the projection to use computed scale & translate.
            projection
                .scale(s)
                .translate(t);


            function zoomed() {
                projection
               .translate(d3.event.translate)
               .scale(d3.event.scale);
                mapChart.render();
            }

            /*var zoom = d3.behavior.zoom()
                .translate(projection.translate())
                .scale(projection.scale())
                .scaleExtent([height / 2, 8 * height])
                .on("zoom", zoomed);

            var svg = d3.select(mapElement)
                .attr("width", width)
                .attr("height", height)
                .call(zoom);*/
            /*.attr("top", top)
                .attr("left", left)
                */
            mapChart.width(width)
                    .height(height)
                     .projection(projection)
                    .dimension(locations)
                    .group(numberReached)
                    .colors(d3.scale.quantize().range(["#E2F2FF", "#C4E4FF", "#9ED2FF", "#81C5FF", "#6BBAFF", "#51AEFF", "#36A2FF", "#1E96FF", "#0089FF", "#0061B5"]))
                    .colorDomain([0, 200])
                    .colorCalculator(function (d) { return d ? mapChart.colors()(d) : '#aaa'; })
                    .overlayGeoJson(locJSON.features, "location", function (d) {
                        if (d.properties.Location_Name) {
                            return d.properties.Location_Name;
                        } if (d.properties.Location) {
                            return d.properties.Location;
                        } if (d.properties.DIST_NAME) {
                            return d.properties.DIST_NAME;
                        } if (d.properties.REG_NAME) {
                            return d.properties.REG_NAME;
                        } if (d.properties.COUNTRY) {
                            return d.properties.COUNTRY;
                        }
                        if (d.properties.sovereignt) {
                            return d.properties.sovereignt;
                        }
                    })
                    .title(function (d) {
                        return "Location: " /*+ d.key + "\nTotal Amount Raised: " + numberFormat(d.value ? d.value : 0) + "M"*/;
                    });
            dc.renderAll();
        });


    });
}