﻿function cmpDate(from, to) {
    var dtFrom = new Date(from);
    var dtTo = new Date(to);
    if (dtFrom.getDate() == dtTo.getDate() && dtFrom.getMonth() == dtTo.getMonth() && dtFrom.getFullYear() == dtTo.getFullYear())
        return true;

}

function getDOY(date) {
    var onejan = new Date(date.getFullYear(), 0, 1);
    return Math.ceil((date - onejan) / 86400000);
}

var day = d3.time.format("%w"),
        week = d3.time.format("%U"),
        percent = d3.format(".1%"),
        format = d3.time.format("%Y-%m-%d");


function ShortYear(c_Date) {
    var dt = new Date(c_Date);

    var mon = dt.getMonth() + 1;
    if (mon.toString().length < 2) {
        mon = "0" + mon;
    }
    var dy = dt.getDate();
    if (dy.toString().length < 2) {
        dy = "0" + dy;
    }

    return dt.getFullYear() + "-" + mon + "-" + dy;


}

function monthPath(t0) {
    var t1 = new Date(t0.getFullYear(), t0.getMonth() + 1, 0),
        d0 = +day(t0), w0 = +week(t0),
        d1 = +day(t1), w1 = +week(t1);
    return "M" + (w0 + 1) * cellWidth + "," + d0 * cellHeight
        + "H" + w0 * cellWidth + "V" + (7 * cellHeight)
        + "H" + w1 * cellWidth + "V" + (d1 + 1) * cellHeight
        + "H" + (w1 + 1) * cellWidth + "V" + 0
        + "H" + (w0 + 1) * cellWidth + "Z";
}


function calendarbyUrl(contentItem, url) {
    var width = 960,
        height = 96,
        keyOffset = 100;
    cellSize = 15, // cell size
    cellWidth = cellSize,
    cellHeight = cellSize / 4 * 3;


    
    d3.json(url, //function(error, jsonData) {
    function (error, jsonData) {

        var data = d3.nest()
          .key(function (d) {

              return ShortYear(d.c_Date);
              //return d.c_Date;
              //var dt = new Date(d.Date);
              //return  dt.getFullYear() + " - " + d.Name ;
          })
          .map(jsonData.value);

        var dataKey = d3.nest()
                    .key(function (d) {
                        var dt = new Date(d.c_Date);
                        return ShortYear(d.c_Date) + " - " + dt.getFullYear() + " - " + d.Name;

                    })
                    .map(jsonData.value)
        ;

        var domain = d3.nest()
            .key(function (d) { return d.Client; })
            .map(jsonData.value);
        var people =
                        d3.nest()
                        .key(function (d) {
                            var dt = new Date(d.c_Date);
                            return dt.getFullYear() + " - " + d.Name;

                        })
                        /*.key(function(d) {
                            var dt = new Date(d.Date);
                            return dt.getFullYear();
                            } )*/
                        .map(jsonData.value)
        ;

        /*Setting up colors*/
        var color2 = d3.scale.ordinal()
            .domain(domain)
            .range(colorbrewer.Paired[20]);



        /*Creating the base blocks*/
        var svg = d3.select(contentItem).selectAll("svg")
            .data(d3.keys(people))
          .enter().append("svg")
            .attr("width", width)
            .attr("height", height)
            .attr("class", "RdYlGn")
          .append("g")
            .attr("transform", "translate(" + ((width - cellWidth * 53) / 2) + "," + (height - cellHeight * 7 - 1) + ")");

        svg.append("text")
            .attr("transform", "translate(-6," + cellHeight * 3.5 + ")rotate(-90)")
            .style("text-anchor", "middle")
            .text(function (d) { return d; });

        //Setting up a rectangle per year/person combo
        //using substring as we have a year/person in the key


        var rect = svg.selectAll(".day")
            .data(
            function (d) {
                var days = d3.time.days(new Date(parseInt(d.substring(0, 4)), 0, 1), new Date(parseInt(d.substring(0, 4)) + 1, 0, 1));
                //days.selectAll().enter().append("Name", d);
                var newDays = days.map(function (item) {
                    return ShortYear(item) + " - " + d;
                }
                        )
                return newDays; 
            }
            )
          .enter().append("rect")
            .attr("class", "day")
            .attr("width", cellWidth)
            .attr("height", cellHeight)
            .attr("x", function (d) { return week(new Date(d.substring(0, 10))) * cellWidth;})
            .attr("y", function (d) { return day(new Date(d.substring(0, 10))) * cellHeight; })


        // .datum(format);
        ;

        rect.append("title")
            .text(function (d) {
                //return "Some title";
                var val;
                var ret;
                    val = people[d.substring(13, d.length).trim()].find(
                            function (element, index, array) {
                                return cmpDate(element.c_Date, d.substring(0, 10).trim());
                            }
                            );
                    if (val && val.Client && val.c_Date)
                        ret = val.Client + " on " + val.c_Date;
                    else ret = d;
                    if (val && val.Comments )
                        ret = ret + " for " + val.Comments;
                    return ret;


                //return d;

            })
        ;

        svg.selectAll(".month")
            .data(function (d) { return d3.time.months(new Date(parseInt(d.substring(0, 4)), 0, 1), new Date(parseInt(d.substring(0, 4)) + 1, 0, 1)); })
          .enter().append("path")
            .attr("class", "month")
            .attr("d", monthPath)
            .attr("onclick", "alert('here')");




        rect.filter(function (d) {
            if (d3.keys(people).indexOf(d.substring(63, d.length).trim()) > -1 || d3.keys(people).indexOf(d.substring(13, d.length).trim()) > -1) {
                var vals;
                
                vals = d3.values(people)[d3.keys(people).indexOf(d.substring(13, d.length).trim())];
                if (vals.find(
                    function (element, index, array) {
                            return cmpDate(element.c_Date, d.substring(0, 10).trim());
                }
                    )
                ) {
                    return true;
                }
            
                //return true;

            }
        })
        .attr('style', function (d) {
            
                return "fill:" +
                   color2(people[d.substring(13, d.length).trim()].find(
                                           function (element, index, array) {
                                               return cmpDate(element.c_Date, d.substring(0, 10).trim());
                                           }
                                           ).Client
                           ) + ";";

        })
        .select("title")
            .text(function (d) {
                var val;
                var ret;
                val = people[d.substring(13, d.length).trim()].find(
                        function (element, index, array) {
                            return cmpDate(element.c_Date, d.substring(0, 10).trim());
                        }
                        );
                if (val && val.Client && val.c_Date)
                    ret = val.Client + " on " + val.c_Date;
                else ret = d;
                if (val && val.Comments)
                    ret = ret + " for " + val.Comments;
                return ret;

            });

        //Key

        //Creating the key


        var bottom = d3.keys(people).length * height;

        //d3.select("body").append("p")

        var svgKey = d3.select(contentItem).append("svg")
            .attr("width", 960/*cellWidth * 20*/)
            .attr("height", (d3.keys(domain).length + 1) * cellHeight * 2/*((cellHeight * d3.keys(domain).length)) + bottom*/)
            .attr("class", "RdYlGn")
            /*.attr("x",0)
            .attr("y", 0 bottom * 2)*/
            .append("g")

        ;



        var rectKey = svgKey.selectAll(".client")
            .data(d3.keys(domain))
          .enter().append("rect")
          .attr("class", "Client")
            .attr("width", cellWidth * 20)
            .attr("height", cellHeight * 2)
            .attr("x", 80)
            .attr("y",
                function (d) {
                    return ((d3.keys(domain).indexOf(d) + 1) * cellHeight * 2);
                }
            )
            .attr('style', function (d) {
                return "fill:" +
                                color2(d)
            }
                            )
        ;

        var text = svgKey.selectAll(".txt")
            .data(d3.keys(domain))
          .enter().append("text")
            .attr("width", cellWidth * 20)
            .attr("height", cellHeight)
            .attr("x", 0)
            .attr("y",
                function (d) {
                    return (((d3.keys(domain).indexOf(d) + 1) * cellHeight * 2) + (cellHeight / 4 * 3));
                }
            )
            .text(
                function (d) {
                    return d;
                }
            )
        ;

        rect.append("title")
        .text(function (d) { return d; });






    });
    //.attr('style', function(d){return "fill:"+ color2(data[d][0].Client) + ";" ;})




}









function calendarbyData(contentItem, lsData) {
    var width = 960,
        height = 96,
        keyOffset = 100;
    cellSize = 15, // cell size
    cellWidth = cellSize,
    cellHeight = cellSize / 4 * 3;



    //d3.json(url, //function(error, jsonData) {
    //function (error, jsonData) {

    var data = d3.nest()
      .key(function (d) {
          return d.c_Date;
          //var dt = new Date(d.Date);
          //return  dt.getFullYear() + " - " + d.Name ;
      })
      .map(jsonData.value);

    var dataKey = d3.nest()
                .key(function (d) {

                    var dt = new Date(d.c_Date);
                    return ShortYear(d.c_Date) + " - " + dt.getFullYear() + " - " + d.Name;

                })
                .map(jsonData.value)
    ;

    var domain = d3.nest()
        .key(function (d) { return d.Client; })
        .map(jsonData.value);
    var people =
                    d3.nest()
                    .key(function (d) {
                        var dt = new Date(d.c_Date);
                        return dt.getFullYear() + " - " + d.Name;

                    })
                    /*.key(function(d) {
                        var dt = new Date(d.Date);
                        return dt.getFullYear();
                        } )*/
                    .map(jsonData.value)
    ;

    /*Setting up colors*/
    var color2 = d3.scale.ordinal()
        .domain(domain)
        .range(colorbrewer.Paired[20]);



    /*Creating the base blocks*/
    var svg = d3.select(contentItem).selectAll("svg")
        .data(d3.keys(people))
      .enter().append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("class", "RdYlGn")
      .append("g")
        .attr("transform", "translate(" + ((width - cellWidth * 53) / 2) + "," + (height - cellHeight * 7 - 1) + ")");

    svg.append("text")
        .attr("transform", "translate(-6," + cellHeight * 3.5 + ")rotate(-90)")
        .style("text-anchor", "middle")
        .text(function (d) { return d; });

    //Setting up a rectangle per year/person combo
    //using substring as we have a year/person in the key


    var rect = svg.selectAll(".day")
        .data(
        function (d) {
            var days = d3.time.days(new Date(parseInt(d.substring(0, 4)), 0, 1), new Date(parseInt(d.substring(0, 4)) + 1, 0, 1));
            //days.selectAll().enter().append("Name", d);
            var newDays = days.map(function (item) {
                return ShortYear(item) + " - " + d;
            }
                    )
            return newDays;
        }
        )
      .enter().append("rect")
        .attr("class", "day")
        .attr("width", cellWidth)
        .attr("height", cellHeight)
        .attr("x", function (d) { return week(new Date(d.substring(0, 10))) * cellWidth; })
        .attr("y", function (d) { return day(new Date(d.substring(0, 10))) * cellHeight; })


    // .datum(format);
    ;

    rect.append("title")
        .text(function (d) {
            //return "Some title";
            var val
                val = people[d.substring(13, d.length).trim()].find(
                        function (element, index, array) {
                            return cmpDate(element.c_Date, d.substring(0, 10).trim());
                        }
                        );
            if (val && val.Client && val.c_Date)
                return val.Client + " on " + val.c_Date;
            else return d;

            //return d;

        })
    ;

    svg.selectAll(".month")
        .data(function (d) { return d3.time.months(new Date(parseInt(d.substring(0, 4)), 0, 1), new Date(parseInt(d.substring(0, 4)) + 1, 0, 1)); })
      .enter().append("path")
        .attr("class", "month")
        .attr("d", monthPath);



    rect.filter(function (d) {
        if (d3.keys(people).indexOf(d.substring(63, d.length).trim()) > -1 || d3.keys(people).indexOf(d.substring(13, d.length).trim()) > -1) {
            var vals;
            
            vals = d3.values(people)[d3.keys(people).indexOf(d.substring(13, d.length).trim())];
            if (vals.find(
                function (element, index, array) {
                        return cmpDate(element.c_Date, d.substring(0, 10).trim());
            }
                )
            ) {
                return true;
            }
        
            //return true;

        }
    })
    .attr('style', function (d) {
            return "fill:" +
               color2(people[d.substring(13, d.length).trim()].find(
                                       function (element, index, array) {
                                           return cmpDate(element.c_Date, d.substring(0, 10).trim());
                                       }
                                       ).Client
                       ) + ";";

    })
    .select("title")
        .text(function (d) {
            var val;
            
            val = people[d.substring(13, d.length).trim()].find(
                        function (element, index, array) {
                            return cmpDate(element.c_Date, d.substring(0, 10).trim());
                        }
                        );
        

            if (val && val.Client && val.c_Date)
                return val.Client + " on " + val.c_Date.substring(0, 10);
            else return d;

        });

    //Key

    //Creating the key


    var bottom = d3.keys(people).length * height;

    //d3.select("body").append("p")

    var svgKey = d3.select(contentItem).append("svg")
        .attr("width", 960/*cellWidth * 20*/)
        .attr("height", (d3.keys(domain).length + 1) * cellHeight * 2/*((cellHeight * d3.keys(domain).length)) + bottom*/)
        .attr("class", "RdYlGn")
        /*.attr("x",0)
        .attr("y", 0 bottom * 2)*/
        .append("g")

    ;



    var rectKey = svgKey.selectAll(".client")
        .data(d3.keys(domain))
      .enter().append("rect")
      .attr("class", "Client")
        .attr("width", cellWidth * 20)
        .attr("height", cellHeight * 2)
        .attr("x", 80)
        .attr("y",
            function (d) {
                return ((d3.keys(domain).indexOf(d) + 1) * cellHeight * 2);
            }
        )
        .attr('style', function (d) {
            return "fill:" +
                            color2(d)
        }
                        )
    ;

    var text = svgKey.selectAll(".txt")
        .data(d3.keys(domain))
      .enter().append("text")
        .attr("width", cellWidth * 20)
        .attr("height", cellHeight)
        .attr("x", 0)
        .attr("y",
            function (d) {
                return (((d3.keys(domain).indexOf(d) + 1) * cellHeight * 2) + (cellHeight / 4 * 3));
            }
        )
        .text(
            function (d) {
                return d;
            }
        )
    ;

    rect.append("title")
    .text(function (d) { return d; });






    //});
    //.attr('style', function(d){return "fill:"+ color2(data[d][0].Client) + ";" ;})



}
