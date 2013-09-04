/// <reference path="../jquery-1.9.1.js" />
/// <reference path="../d3.v3.js" />

(function (makate, undefined) {
    makate.build = function () {
        var result = {};
        result.functions = [];

        result.run = function (func) {
            /// <param name="func" type="Function">The first method to call</param>
            func();
            return this;
        };

        result.done = function () {
            var func = this.functions.shift();
            if (func !== undefined) {
                func();
            }
        };

        result.then = function (func) {
            /// <param name="func" type="Function">The follow up methods to call</param>
            this.functions.push(func);
            return this;
        };

        return result;
    };


})(window.makate = window.makate || {});

(function (report, undefined) {

    report.uriBase = "";
    report.targetElement = {};

    function stripCharacters(text) {
        /// <param name="text" type="String">Some text</param>
        return text.replace(" ", "");
    }

    function createMenuItem(value, text) {
        var option = document.createElement("option");
        option.classList.add("meerkat-report-menuItem-option");
        option.value = value;
        option.text = text;
        return option;
    }

    function createMenu(label, values, valueKey, valueLabel) {
        /// <param name="label" type="String">The label to use</param>
        /// <param name="values" type="Array">The values from the drop down</param>
        /// <param name="valueKey" type="Function">The callback which gets the value key</param>
        /// <param name="valueLabel" type="Function">The callback which gets the value label</param>
        var id = "reportParameter" + stripCharacters(label);

        var menuOption = document.createElement("li");
        menuOption.classList.add("meerkat-report-menuItem");

        var labelElement = document.createElement("label");
        labelElement.classList.add("meerkat-report-menuItem-label");
        labelElement.textContent = label;
        labelElement.htmlFor = id;

        var optionsDropDown = document.createElement("select");
        optionsDropDown.classList.add("meerkat-report-menuItem-select");
        optionsDropDown.id = id;
        optionsDropDown.onchange = function () {
            refreshReport();
        };

        optionsDropDown.appendChild(createMenuItem("0", "All"));

        values.forEach(function (item) {
            var option = createMenuItem(valueKey(item), valueLabel(item));
            optionsDropDown.appendChild(option);
        });


        menuOption.appendChild(labelElement);
        menuOption.appendChild(optionsDropDown);

        return menuOption;
    }

    function constructMenu() {
        /// <param name="element" type="Element">Description</param>
        var menu = document.createElement("ul");
        menu.classList.add("meerkat-report-menu");

        var menuDataLoad = makate.build();

        menuDataLoad.run(function () {
            d3.json(report.uriBase + "/Meerkatdata.svc/Outcomes", function (err, data) {
                var outcomeMenuOption = createMenu("Outcomes", data.value, function (_) {
                    return _.OutcomeID;
                }, function (_) {
                    return _.Code;
                });

                menu.appendChild(outcomeMenuOption);

                menuDataLoad.done();
            });
        }).then(function () {
            d3.json(report.uriBase + "/Meerkatdata.svc/ReportingPeriods", function (err, data) {
                var menuOption = createMenu("Reporting Period", data.value, function (_) {
                    return _.ID;
                }, function (_) {
                    return _.ReportingPeriod1 + " " + _.YearName;
                });

                menu.appendChild(menuOption);

                menuDataLoad.done();
            });
        }).then(function () {
            d3.select("#loadingContent").remove();
            report.targetElement.appendChild(menu);
            refreshReport();
        });

    }

    function createTH(content) {
        var th = document.createElement("th");
        th.textContent = content;
        th.classList.add("meerkat-report-table-header-column");
        return th;
    }

    function createHTMLTable(headers, additionalHeaders) {
        /// <param name="headers" type="Array">The headers</param>
        /// <param name="additionalheaders" type="Number">Description</param>
        /// <returns type="Table" />
        var table = document.createElement("table");
        table.classList.add("meerkat-report-table");

        var headerRow = document.createElement("tr");
        headerRow.classList.add("meerkat-report-table-header-row");
        headerRow.classList.add("meerkat-report-table-row");
        headers.forEach(function (header) {
            headerRow.appendChild(createTH(header));
        });

        for (var counter = 0; counter < additionalHeaders; counter++) {
            headerRow.appendChild(createTH(""));
        }

        table.appendChild(headerRow);
        return table;
    }

    function rowToObject(row) {
        /// <param name="row" type="Array">A row that will become an object</param>
        /// <returns type="rowToObject" />
        return result = {
            OutcomeName: row[0],
            OutputName: row[1],
            Suboutputname: row[2],
            StatusTypeValue: row[3],
            StatusType: row[4],
            Percentage: row[5],
            YearName: row[6],
            ReportingPeriod: row[7],
            OutcomeID: row[8],
            OutputID: row[9],
            SubOutputID: row[10],
            YearNumber: row[11]
        };
    }

    function loadCSS(path) {
        var link = document.createElement("link");
        link.setAttribute("rel", "stylesheet");
        link.setAttribute("type", "text/css");
        link.setAttribute("href", path);
        document.getElementsByTagName("head")[0].appendChild(link);
    }

    function refreshReport() {

        var outcomesSelectedElement = d3.select("#reportParameter" + stripCharacters("Outcomes"))[0][0];
        var reportingPeriodSelectElement = d3.select("#reportParameter" + stripCharacters("Reporting Period"))[0][0];
        var selectedOutcome = outcomesSelectedElement.options(outcomesSelectedElement.selectedIndex).value;
        var selectedReportingPeriod = reportingPeriodSelectElement.options(reportingPeriodSelectElement.selectedIndex).value;

        ///<var name="reportData" type="Array" elementType="rowToObject"/>
        var reportData = [];
        var dataGrab = makate.build();

        dataGrab.run(function () {
            d3.json("/api/rsp?storedProc=rptStatusValuesOutput&parameters[0].Key=@OutcomeID&parameters[0].Value=" + selectedOutcome + "&parameters[1].Key=@ReportingPeriodId&parameters[1].Value=" + selectedReportingPeriod + "", function (err, data) {
                /// <param name="data" type="Array">Description</param>
                if (data !== undefined) {
                    data.forEach(function (row) {
                        reportData.push(rowToObject(row));
                    });
                }
                dataGrab.done();
            });
        }).then(function () {
            d3.select("#reportPlacement").remove();

            var reportPlacement = document.createElement("div");
            reportPlacement.id = "reportPlacement";

            if (reportData.length === 0) {
                reportPlacement.classList.add("meerkat-report-placement-error");
                reportPlacement.textContent = "No data was returned";
                report.targetElement.appendChild(reportPlacement);
                return;
            }

            reportPlacement.classList.add("meerkat-report-placement");
            report.targetElement.appendChild(reportPlacement);

            reportData = reportData.sort(function (a, b) {
                /// <param name="a" type="rowToObject">First</param>
                /// <param name="b" type="rowToObject">Second</param>
                // -1 = a before b
                // 0  = no sort
                // 1  = a after b

                if (a.OutcomeID > b.OutcomeID) {
                    return 1;
                }

                if (a.OutcomeID < b.OutcomeID) {
                    return -1;
                }
                // a.OutComeId == b.OutcomeID

                if (a.OutputID == null || a.OutputID > b.OutputID) {
                    return 1;
                }

                if (b.OutputID == null || a.OutputID < b.OutputID) {
                    return -1;
                }

                // outcome & outputs match
                if (a.SubOutputID == null || a.SubOutputID > b.SubOutputID) {
                    return 1;
                }

                if (b.SubOutputID == null || a.SubOutputID < b.SubOutputID) {
                    return -1;
                }

                // same outcome, output & suboutput

                if (a.YearNumber < b.YearName) {
                    return -1;
                }

                if (a.YearNumber > b.YearName) {
                    return 1;
                }

                // same outcome, output, suboutput, year

                if (a.ReportingPeriod < b.ReportingPeriod) {
                    return -1;
                }

                if (a.ReportingPeriod > b.ReportingPeriod) {
                    return 1;
                }

                return 0;
            });

            var reportingPeriods = d3.nest()
                                    .key(function (d) {
                                        /// <param name="d" type="rowToObject"/>

                                        return d.YearNumber;
                                    })
                                    .sortKeys(d3.ascending)
                                    .key(function (d) {
                                        /// <param name="d" type="rowToObject"/>

                                        return d.ReportingPeriod;
                                    })
                                    .sortKeys(d3.ascending)
                                    .entries(reportData);
            var tdCount = -1;
            reportingPeriods.forEach(function (d) {
                tdCount += d.values.length;
            });

            var reportTable = createHTMLTable(["Outcome Name", "Output Name", "Sub-Output Name", "Status"], tdCount);
            reportPlacement.appendChild(reportTable);

            var tdBuffer = 3; // for the first three columns
            var tdBufferDone = 1;

            var yearRow = d3.select(reportTable)
                            .selectAll(".meerkat-report-table-year-row")
                            .data(reportingPeriods);

            yearRow.enter()
                .append("tr")
                .attr("class", "meerkat-report-table-row meerkat-report-table-year-row")
                .html(function (d) {
                    var result = "";

                    for (var counter = 0; counter < tdBuffer; counter++) {
                        result += "<td class='meerkat-report-table-column meerkat-report-table-column-year'></td>";
                        tdBufferDone += 1;
                    }

                    result += "<td class='meerkat-report-table-column meerkat-report-table-column-year'>" + d.key + "</td>";
                    tdBuffer += 4;
                    tdBufferDone += 1;
                    return result;
                });

            if (tdBufferDone < tdBuffer) {
                var diff = tdBuffer - tdBufferDone;
                for (var counter = 0; counter < diff; counter++) {
                    yearRow
                        .append("td")
                        .attr("class", "meerkat-report-table-column meerkat-report-table-column-year");
                }
            }

            tdBuffer = 3;

            yearRow
                .enter()
                .append("tr")
                .attr("class", "meerkat-report-table-row meerkat-report-table-reportingPeriod-row")
                .html(function (d) {
                    var result = "";
                    for (var counter = 0; counter < tdBuffer; counter++) {
                        result += "<td class='meerkat-report-table-column meerkat-report-table-col-reportingPeriod'></td>";
                    }

                    return result;
                })
                .selectAll("meerkat-report-table-col-reportingPeriod")
                .data(function (d) {
                    return d.values;
                })
                .enter()
                .append("td")
                .attr("class", "meerkat-report-table-column meerkat-report-table-col-reportingPeriod")
                .text(function (d) {
                    return d.key
                });

            var groupedReportData = d3.nest()
                                        .key(function (d) {
                                            return d.OutcomeName;
                                        })
                                        .sortKeys(d3.ascending)
                                        .key(function (d) {
                                            return d.OutputName;
                                        })
                                        .sortKeys(d3.ascending)
                                        .key(function (d) {
                                            return d.Suboutputname;
                                        })
                                        .sortKeys(d3.ascending)
                                        .entries(reportData, d3.map);


            var dataRow = d3.select(reportTable)
                .selectAll(".meerkat-report-table-data-row-outcome")
                .data(groupedReportData);

            dataRow
                .enter()
                .append("tr")
                .attr("class", "meerkat-report-table-row meerkat-report-table-data-row meerkat-report-table-data-row-outcome")
                .html(function (d) {
                    var outcomeName = d.key || "";

                    var result = "<td class='meerkat-report-table-column meerkat-report-table-column-outcome'>" + outcomeName + "</td>" +
                       "<td class='meerkat-report-table-column meerkat-report-table-column-output'></td>" +
                       "<td class='meerkat-report-table-column meerkat-report-table-column-suboutput'></td>";

                    return result;
                })
                .append("tr")
                .attr("class", "meerkat-report-table-row meerkat-report-table-data-row meerkat-report-table-data-row-output");
            
            //dataRow
            //    .selectAll(".meerkat-report-table-data-row-output")
            //.data(function (d) {
            //    return d.values;
            //})
            //.enter()
            //.append("tr")
            //.attr("class", "meerkat-report-table-row meerkat-report-table-data-row meerkat-report-table-data-row-output")
            //.html(function (d) {
            //    var display = d.key || "";

            //    var result = "<td class='meerkat-report-table-column meerkat-report-table-column-outcome'></td>" +
            //       "<td class='meerkat-report-table-column meerkat-report-table-column-output'>" + display + "</td>" +
            //       "<td class='meerkat-report-table-column meerkat-report-table-column-suboutput'></td>";

            //    return result;
            //});

            //dataRow
            //    .enter()
            //    .append("tr")
            //    .selectAll(".meerkat-report-table-data-row-output")
            //    .data(function (d) {
            //        return d.values;
            //    })
            //    .enter()
            //    .append("tr")
            //    .attr("class", "meerkat-report-table-row meerkat-report-table-data-row meerkat-report-table-data-row-output")
            //    .html(function (d) {
            //        var result = "<td class='meerkat-report-table-column meerkat-report-table-column-outcome'></td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-output'>" + (d.key || "") + "</td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-suboutput'></td>";

            //        return result;
            //    });

            //dataRow.selectAll(".meerkat-report-table-data-row-suboutput")
            //    .data(function (d) {
            //        return d.values;
            //    })
            //    .enter()
            //    .append("tr")
            //    .attr("class", "meerkat-report-table-row meerkat-report-table-data-row meerkat-report-table-data-row-suboutput")
            //    .html(function (d) {
            //        var result = "<td class='meerkat-report-table-column meerkat-report-table-column-outcome'></td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-output'></td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-suboutput'>" + (d.key || "") + "</td>";

            //        return result;
            //    });


            ///<var name="last" type="rowToObject"/>
            //var last;

            //d3.select(reportTable).selectAll(".meerkat-report-table-data-row")
            //    .data(reportData)
            //    .enter()
            //    .append("tr")
            //    .attr("class", "meerkat-report-table-row meerkat-report-table-data-row")
            //    .html(function (d) {
            //        /// <param name="d" type="rowToObject"/>
            //        var outcomeName = d.OutcomeName;
            //        if (last !== undefined && last.OutcomeName === outcomeName) {
            //            outcomeName = "&nbsp;";
            //        }

            //        var outputName = (d.OutputName || "&nbsp;");
            //        if (last !== undefined && last.OutputName === outputName) {
            //            outputName = "&nbsp;";
            //        }

            //        var suboutputName = (d.Suboutputname || "&nbsp;");
            //        if (last !== undefined && last.Suboutputname === suboutputName) {
            //            suboutputName = "&nbsp;";
            //        }

            //        last = d;                  

            //        var result = "<td class='meerkat-report-table-column meerkat-report-table-column-outcome'>" + outcomeName + "</td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-output'>" + outputName + "</td>" +
            //               "<td class='meerkat-report-table-column meerkat-report-table-column-suboutput'>" + suboutputName + "</td>";



            //        result += "<td class='meerkat-report-table-column meerkat-report-table-column-status'>";

            //        if (d.StatusTypeValue < 0) {
            //            result += "<i class='icon-remove meerkat-report-negative-value'/>";
            //        }

            //        if (d.StatusTypeValue === 0) {
            //            result += "<i class='icon-exclamation-sign meerkat-report-neutral-value'/>";
            //        }

            //        if (d.StatusTypeValue > 0) {
            //            result += "<i class='icon-check meerkat-report-positive-value'/>";
            //        }

            //        result += "</td>";

            //        for (var counter = 0; counter < postTDBuffer; counter++) {
            //            result += "<td class='meerkat-report-table-column meerkat-report-table-column-status meerkat-report-table-column-status-empty'></td>";
            //        }

            //        return result;
            //    });
        });
    }

    function showLoading() {
        var content = document.createElement("div");
        content.id = "loadingContent";

        var image = document.createElement("img");
        image.src = "Content/Images/msls-loader-light.gif";
        image.alt = "loading...";
        content.appendChild(image);

        var title = document.createElement("p");
        title.textContent = "loading...";
        content.appendChild(title);

        report.targetElement.appendChild(content);
    }

    report.run = function (element) {
        /// <param name="element" type="Element">Description</param>
        report.targetElement = element;
        d3.select(element).html("");

        showLoading();
        loadCSS("Content/font-awesome/css/font-awesome.min.css");
        loadCSS("Scripts/Reports/statusreport.css");
        constructMenu();
    };

})(window.report = window.report || {});