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

    function createMenuItem(label, values, valueKey, valueLabel) {
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

        values.forEach(function (item) {
            var option = document.createElement("option");
            option.classList.add("meerkat-report-menuItem-option");
            option.value = valueKey(item);
            option.text = valueLabel(item);
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
                var outcomeMenuOption = createMenuItem("Outcomes", data.value, function (_) {
                    return _.OutcomeID;
                }, function (_) {
                    return _.Code;
                });

                menu.appendChild(outcomeMenuOption);

                menuDataLoad.done();
            });
        }).then(function () {
            d3.json(report.uriBase + "/Meerkatdata.svc/ReportingPeriods", function (err, data) {
                var menuOption = createMenuItem("Reporting Period", data.value, function (_) {
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

    function createHTMLTable(headers) {
        /// <param name="headers" type="Array">The headers</param>
        /// <returns type="Table" />
        var table = document.createElement("table");
        table.classList.add("meerkat-report-table");

        var headerRow = document.createElement("tr");
        table.classList.add("meerkat-report-table-header-row");
        headers.forEach(function (header) {
            var th = document.createElement("th");
            th.textContent = header;
            th.classList.add("meerkat-report-table-header-column");
            headerRow.appendChild(th);
        });

        table.appendChild(headerRow);
        return table;
    }

    function rowToObject(row) {
        /// <param name="row" type="Array">Description</param>
        return result = {
            OutcomeName: row[0],
            OutputName: row[1],
            Suboutputname: row[2],
            StatusTypeValue: row[3],
            StatusType: row[4],
            Percentage: row[5],
            ReportingPeriod: row[6],
            YearName: row[7],
        };
    }

    function refreshReport() {

        var outcomesSelectedElement = d3.select("#reportParameter" + stripCharacters("Outcomes"))[0][0];
        var reportingPeriodSelectElement = d3.select("#reportParameter" + stripCharacters("Reporting Period"))[0][0];
        var selectedOutcome = 10;//outcomesSelectedElement.options(outcomesSelectedElement.selectedIndex).value;
        var selectedReportingPeriod = 93;//reportingPeriodSelectElement.options(reportingPeriodSelectElement.selectedIndex).value;

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

            var reportTable = createHTMLTable(["Outcome Name", "Output Name", "Sub-Output Name", "Status"]);
            reportPlacement.appendChild(reportTable);

            d3.select(reportTable)
                .selectAll(".meerkat-report-table-row")
                .data(reportData)
                .enter()
                .append("tr")
                .attr("class","meerkat-report-table-row")                
                .html(function (row) {                    
                    return "<td>" + row.OutcomeName + "</td>"
                        + "<td>" + row.OutputName + "</td>"
                        + "<td>" + row.Suboutputname + "</td>"
                        + "<td>" + row.StatusTypeValue + "</td>";
                });
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
        constructMenu();
    };

})(window.report = window.report || {});