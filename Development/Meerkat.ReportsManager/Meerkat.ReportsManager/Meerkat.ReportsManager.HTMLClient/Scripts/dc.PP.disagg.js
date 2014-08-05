﻿/// <reference path="dc.js" />
/// <reference path="d3.js" />


dcLSWrapper = function () {
    
    function renderCommunityTypeChart(jsonData, data) {

    }


    
}

//Region properties
dcLSWrapper.prototype.arrRowCharts = new Array();
dcLSWrapper.prototype.arrBarCharts = new Array();
dcLSWrapper.prototype.data = new Object;
dcLSWrapper.prototype.rootData = new Object;
dcLSWrapper.prototype.mapElementID = "";
dcLSWrapper.prototype.url = "";
dcLSWrapper.prototype.mapUrl = ""
dcLSWrapper.prototype.mapID = "";
dcLSWrapper.prototype.numberField = "";
//Region methods


dcLSWrapper.prototype.mapCharts = function (mapElement, mapUrl) {

    
    var numberFormat = d3.format(".2f");

    var mapChart = dc.geoChoroplethChart('#' + mapElement);


    var domain = d3.nest()
        .key(function (d) { return d.Location_Name; })
        .rollup(function (d) {
            return d3.sum(d, function (g) { return g.NumberReached; });
        })
        .map(this.rootData.value);

    var min = 0, max = 0;

    max = d3.max(d3.values(domain));
    min = d3.min(d3.values(domain));
    /*Setting up colors*/
    var color2 = d3.scale.ordinal()
        .domain(domain)
        .range(colorbrewer.Paired[20]);


    var locations = this.data.dimension(function (d) {
        return d["Location_Name"];
    });


    var numberReached = locations.group().reduceSum(function (d) {
        if (d["NumberReached"]) {
            /*if (d["NumberReached"] < min) min = d["NumberReached"];
            if (d["NumberReached"] > max) max = d["NumberReached"];
            */
            return d["NumberReached"];
        } else {
            return 0;
        }
    });

    d3.json(mapUrl, function (locJSON) {
        var x = locJSON;
        var width = 600,
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
                .colors(d3.scale.quantize().range(["#F2F9FF","#D8EDFF", "#C4E4FF", "#B2DCFF", "#9ED2FF", "#81C5FF", "#6BBAFF", "#51AEFF", "#36A2FF", "#1E96FF", "#0089FF", "#0070CC", "#0061B5", "#005499", "#00467F"]))
                .colorDomain([0, max])
                .colorCalculator(function (d) { return d ? mapChart.colors()(d) : '#ccc'; })
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
                    return "Location: " + d.key + numberFormat(d.value ? d.value : 0);
                });
        dc.renderAll();
    });
}

dcLSWrapper.prototype.rowCharts = function (arrRowCharts) {
    for (i = 0; i < arrRowCharts.length; i++) {
        var x = arrRowCharts[i];


        var disaggDim = this.data.dimension(function (d) {
            return d[x.colID];
        });

        //Need to define by number reached....
        var disaggGroup = disaggDim.group().reduceSum(function (d) {
            return d.NumberReached;
        });
        var domain = d3.nest()
        .key(function (d) { return d[x.colID]; })
        .rollup(function (d) {
            return d3.sum(d, function (g) { return g.NumberReached; });
        })
        .map(this.rootData.value);

        var min = 0, max = 0;

        max = d3.max(d3.values(domain));
        //min = d3.min(d3.values(domain));


        var rowChart = dc.rowChart("#" + x.divID);
        var scale = d3.scale.linear()
            .domain([0, max])
            .ticks(5);
        rowChart
                 .width(x.width)
                .height(x.height)
                .dimension(disaggDim)
                .group(disaggGroup)
                .transitionDuration(500)
                .colors("#1f77b4")
        /*.x(scale)*/
        ;


    }

}

dcLSWrapper.prototype.barCharts = function (arrbarCharts) {
    for (i = 0; i < arrbarCharts.length; i++) {
        var x = arrbarCharts[i];


        var disaggDim = this.data.dimension(function (d) {
            return d[x.colID];
        });

        //Need to define by number reached....
        var disaggGroup = disaggDim.group().reduceSum(function (d) {
            return d.NumberReached;
        });
        var domain = d3.nest()
        .key(function (d) { return d[x.colID]; })
        .rollup(function (d) {
            return d3.sum(d, function (g) { return g.NumberReached; });
        })
        .map(this.rootData.value);

        var min = 0, max = 0;

        max = d3.max(d3.keys(domain));
        min = d3.min(d3.keys(domain));


        var barChart = dc.barChart("#" + x.divID);
        var scale = d3.scale.linear()
            .domain([0, max])
            .ticks(5);
        barChart
                 .width(x.width)
                .height(x.height)
                .dimension(disaggDim)
                .group(disaggGroup)
                .transitionDuration(500)
                .colors("#1f77b4")
                .renderHorizontalGridLines(true)
                .valueAccessor(function (d) {
                     return d.value;
                    })
	            .x(d3.scale.ordinal().domain(d3.keys(domain)))
                .xUnits(dc.units.ordinal)
                .centerBar(true)
                .gap(10)
                .title(function (d) {
                    return d.key;
                })
                .renderTitle(true)
                .xAxisLabel("Date")
                .yAxisLabel("Number Reached ");

        barChart.xAxis().ticks(d3.keys(domain).length);
        barChart.elasticY(true);



        /*.x(scale)*/
        ;


    }

}

dcLSWrapper.prototype.setupPage = function () {
    
    var mapUrl = this.mapUrl;
    var mapID = this.mapID;
    var arrRowCharts = this.arrRowCharts;
    var arrBarCharts = this.arrBarCharts;
    var obj = this;
    d3.json(this.url,
    function (error, jsonData) {
        obj.rootData = jsonData;
        obj.data = crossfilter(obj.rootData.value);
        obj.mapCharts(mapID, mapUrl);
        obj.rowCharts(arrRowCharts);
        obj.barCharts(arrBarCharts);
    });

}

dcLSWrapper.prototype.addRowChart = function (divID, columnName, height, width) {
    this.arrRowCharts.push({ colID: columnName, divID: divID, height: height, width: width });
}
dcLSWrapper.prototype.addBarChart = function (divID, columnName, height, width) {
    this.arrBarCharts.push({ colID: columnName, divID: divID, height: height, width: width });
}