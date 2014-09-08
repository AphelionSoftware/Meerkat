(function (megaDropdown, undefined) {
    "use strict";
    /*global $: true */
    /*global document: true */
    /*global console: true */
    /*global location: true */
    /*global jQuery: true */
    /*global alert: true */
    /*global window: true */
    /*global globalStorage: true */
    /*jslint unparam: true */

    megaDropdown.config = {
        // common
        DataSource: "SharePoint",
        CachingEnabled: true,
        CacheName: "Mega Dropdown Cache",
        InlineLoggingEnabled: false,
        Logging: true,
        // SharePoint Settings
        SharePointRootUrl: "",
        SharePointCategoryListName: "",
        SharePointGroupName: "",
        SharePointLinkName: "",
        // SQL Settings
        SQLRootUrl: "",
        SQLCategoryTable: "",
        SQLGroupTable: "",
        SQLLinkTable: "",
        SQLJSONP: false,
        JSONOverride: "",
        version: "14"
    };

    megaDropdown.printConfig = function (replacementObject) {
        $(replacementObject).html(objectToString(this.config));
    };

    String.prototype.endsWith = function (suffix) {
        return this.toLocaleLowerCase().indexOf(suffix, megaDropdown.length - suffix.length) !== -1;
    };

    var dataTrigger = "megadropdownDataRecieved",
        storeDataTrigger = "storeDataTrigger",
        jqueryReplacementObject = null,
        additionalContent = "",
        profiles = [];

    function objectToString(o) {
        var parse = function (o2) {
            var a = [], t, p;
            for (p in o2) {
                if (o2.hasOwnProperty(p)) {
                    t = o2[p];
                    if (t && typeof t === "object") {
                        a[a.length] = "\"" + p + "\":{ " + parse(t).join(", ") + "}";
                    } else {
                        if (typeof t === "string") {
                            a[a.length] = ["\"" + p + "\": \"" + t.toString() + "\""];
                        } else {
                            a[a.length] = ["\"" + p + "\": " + t.toString()];
                        }
                    }
                }
            }
            return a;
        };

        return "{" + parse(o).join(", ") + "}";
    }

    function htmlEncode(value) {
        if (value !== null && value !== undefined && value.length > 0) {
            try {
                return $('<div/>').text(value).html();
            } catch (e) {
                return "";
            }
        }

        return "";
    }

    function log(message, level) {
        if (!megaDropdown.config.Logging) {
            return;
        }

        level = (level === undefined) ? "debug" : level;

        try {
            if (megaDropdown.config.InlineLoggingEnabled && level === "error") {
                additionalContent += message + "<br/>";
            }

            message = htmlEncode(message);

            if (message !== null && message !== undefined && message.length > 0) {
                switch (level) {
                    case "debug":
                        console.log(message);
                        break;
                    case "info":
                        console.info(message);
                        break;
                    case "error":
                        console.error(message);
                        break;
                    case "warn":
                        console.warn(message);
                        break;
                    case "profile":
                        if (typeof console.time !== undefined) {
                            var messageIndex = profiles.indexOf(message);
                            if (messageIndex === -1) {
                                console.time(message);
                                profiles.push(message);
                            } else {
                                console.timeEnd(message);
                                profiles.splice(messageIndex, 1);
                            }
                        }
                        break;
                    default:
                        console.error("Invalid level selected for following message - " + level);
                        console.error(message);
                        break;
                }
            }
        } catch (e) {
            if (console !== undefined && e !== undefined) {
                console.log("Logging has thrown an exception:" + e);
                if (e.Message !== undefined) {
                    console.log("  Exception Message:" + e.Message);
                }
            }
        }
    }

    function logException(source, e) {
        log(source + " - Press F2 for more info.");
        log("Start exception info for " + source);
        log(e.Message || "No message");
        log(e.Description || "No description");
        log(e.ErrorNumber || "No error number");
        log(e.Data || "No data");
        log(e.Number || "No number");
        log(e.Severity || "No sev");
        log(e.Source || "No source");
        log(e.SourceItem || "No source item");
        log(e.SourceMoniker || "No source moniker");
        log(e.Line || "No line");
        log(e.EndLine || "No end line");
        log(e.Column || "No column");
        log(e.StartColumn || "No start column");
        log(e.EndColumn || "No end column");
        log(e.HelpLink || "No help link");
        log(e.StackTrace || "No stacktrace");
        log(e.TargetSite || "No target site");
        log("End exception info " + source);

        if (e.InnerException !== undefined) {
            logException(source + " - Inner Exception", e.InnerException);
        }
    }

    function allRequirementsFound() {
        if (typeof jQuery === 'undefined') {
            alert("jQuery is required for MegaDropDown and cannot be found");
            return false;
        }

        if (!jQuery().hoverIntent) {
            alert("HoverIntent plugin for jQuery is required for MegaDropDown and cannot be found");
            return false;
        }

        if (!jQuery().superfish) {
            alert("Superfish plugin for jQuery is required for MegaDropDown and cannot be found");
            return false;
        }

        return true;
    }

    function logAjaxError(section, jqXHR, textStatus, errorThrown) {
        try {
            log("There has been an AJAX related error for " + section + ". Press F2 for further details if supported.");
            log("Start error for " + section);
            if (errorThrown) {
                log(errorThrown);
            } else {
                log("No error thrown info");
            }

            if (textStatus) {
                log(textStatus);
            } else {
                log("No text status info");
            }

            if (jqXHR) {
                log(jqXHR);
            } else {
                log("No jqXHR");
            }

            log(jqXHR.responseText || "No jqXHR response text");

            if (jqXHR.status) {
                log(jqXHR.status);
            } else {
                log("No jqXHR status");
            }

            if (jqXHR.statusText) {
                log(jqXHR.statusText);
            } else {
                log("No jqXHR status text");
            }

            if (errorThrown.message) {
                log(errorThrown.message);
            } else {
                log("No error message");
            }

            if (errorThrown.number) {
                log(errorThrown.number);
            } else {
                log("No error number");
            }

            if (errorThrown.name) {
                log(errorThrown.name);
            } else {
                log("No error name");
            }

            if (errorThrown.description) {
                log(errorThrown.description);
            } else {
                log("No error description");
            }

            log("End error for " + section);
        } catch (e) {
            logException("AJAX error logging", e);
        }
    }

    function accessTest(url) {
        log("Testing access to: " + url);

        if (!url.match(location.hostname)) {
            log("URL is outside of the domain, thus will be assumed to be accessible.");
            return true;
        }

        log("Access Test to " + url);
        if (!url.endsWith(".aspx")) {
            url += "/_vti_bin/listdata.svc";
            log("URL looks like site, so modified to: " + url);
        }

        var result = false;
        $.support.cors = true;
        $.ajax(url, {
            async: false,
            dataType: "text",
            global: false,
            success: function (data, textStatus, jqXHR) {
                log("Successfully got data. URL: " + url);
                if (data.indexOf("Error: Access Denied") > -1) {
                    log("Found magic access denied string in response, failing out");
                    result = false;
                } else {
                    result = true;
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                var logError = true;
                if (logError && jqXHR.status) {
                    logError = !(jqXHR.status === 404 ||
                                 jqXHR.status === 400);
                }

                if (logError && errorThrown.message) {
                    logError = (errorThrown.message !== "Access is denied."); // msie support if it can't access a server
                }

                if (logError && errorThrown.name) {
                    logError = (errorThrown.name !== "NS_ERROR_FAILURE" && // firefox support if it can't access a server
                                errorThrown.name !== "NETWORK_ERR"); //chrome support if it can't access a server
                }

                if (logError) {
                    logAjaxError("AccessTest", jqXHR, textStatus, errorThrown);
                }

                result = !logError;
            },
            statusCode: {
                400: function () {
                    log("URL is invalid or not a SharePoint root so we show the item (400). URL: " + url);
                    result = true;
                },
                404: function () {
                    log("URL is invalid or not a SharePoint root so we show the item (404). URL: " + url);
                    result = true;
                }
            },
            type: "GET"
        });

        log("Access Test to " + url);
        log("Result was " + result + " when testing access to: " + url);

        return result;
    }

    function getMockData() {
        return '{"menu00":{"Label":"Test Company", "Url":"",' +
            '"Children":{' +
            '"menu10":{"Label":"About Us", "Url":"http://www.google.com",' +
            '"Children":{' +
            '"menu20":{"Label":"History", "Url":"http://localhost"},' +
            '"menu21":{"Label":"Contacts", "Url":"http://www.google.com/chicken"}' +
            '}' +
            '},' +
            '"menu11":{"Label":"Jobs", "Url":"http://localhost, chicken"}' +
            '}' +
            '},"menu01":{"Label":"Products", "Url":"http://localhost"},' +
            '"menu02":{"Label":"Case Studies", "Url":"",' +
            '"Children":{' +
            '"menu30":{"Label":"Technology", "Url":"http://localhost",' +
            '"Children":{' +
            '"menu31":{"Label":"Satelite", "Url":"http://localhost"},' +
            '"menu21":{"Label":"Mobile", "Url":"http://localhost"}' +
            '}' +
            '},' +
            '"menu11":{"Label":"Customer Successes", "Url":"http://localhost"}' +
            '}' +
            '},' +
            '"menu04":{"Label":"Government Contracts", "Url":"",' +
            '"Children":{' +
            '"menu40":{"Label":"SARS", "Url":"http://localhost",' +
            '"Children":{' +
            '"menu41":{"Label":"Getting tax from people", "Url":"http://localhost"},' +
            '"menu41":{"Label":"Getting tax from businesses", "Url":"http://localhost"},' +
            '"menu42":{"Label":"Paying company tax", "Url":"http://localhost"},' +
            '"menu43":{"Label":"Paying VAT", "Url":"http://localhost"},' +
            '"menu44":{"Label":"Paying PAYE for your employees", "Url":"http://localhost"},' +
            '"menu45":{"Label":"Paying personal tax", "Url":"http://localhost"},' +
            '"menu46":{"Label":"Submitting tax manually with paper", "Url":"http://localhost"}' +
            '}' +
            '},' +
            '"menu41":{"Label":"SAPS", "Url":"http://localhost"}' +
            '}' +
            '}' +
            '}';
        //return '{"menu01":{"Label":"Cat 1","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" ,"Children":{"menu15":{"Label":"Closed Site","Url":"http://mgs-ssd/TestMegaDropdown/ClosedSubSite", "spanStyle":"", "aStyle":"", "liStyle":"" },"menu11":{"Label":"Grp 1.1","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" ,"Children":{"menu21":{"Label":"Closed Site","Url":"http://mgs-ssd/TestMegaDropdown/ClosedSubSite/Pages/Default.aspx", "spanStyle":"", "aStyle":"", "liStyle":"" },"menu12":{"Label":"Grp 1.2","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" },"menu14":{"Label":"Open Site","Url":"http://mgs-ssd/TESTMEGADROPDOWN/OPENSUBSITE/Pages/Default.aspx", "spanStyle":"", "aStyle":"", "liStyle":"" }}},"menu02":{"Label":"Cat 2","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" ,"Children":{"menu13":{"Label":"Grp 2.1","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" ,"Children":{"menu24":{"Label":"Grp 2.1.1","Url":"", "spanStyle":"", "aStyle":"", "liStyle":"" }}}}';
    }

    function dataReceived(finalJson) {
        log("Final JSON: " + finalJson);
        jqueryReplacementObject.trigger(storeDataTrigger, [finalJson]);
        var o;

        try {
            o = $.parseJSON(finalJson);
        } catch (e) {
            logException("The JSON generated is invalid!", e);
        }

        if (o !== null && o !== undefined) {
            jqueryReplacementObject.trigger(dataTrigger, [o]);
        }
    }

    function validString(object) {
        var result = "";
        if (object !== null && object !== undefined &&
                object.length !== null && object.length !== undefined &&
                object.length > 0) {
            result = object;
        }

        return result;
    }

    function createSQLJson(level, index, object) {
        var url = "",
            spanStyle = validString(object.dictionary.SpanStyle),
            aStyle = validString(object.dictionary.AStyle),
            liStyle = validString(object.dictionary.LIStyle);

        if (object.dictionary.Link !== null) {
            if (accessTest(object.dictionary.Link)) {
                url = object.dictionary.Link;
            }
        }

        return '"menu' + level + index + '":{"Label":"' + object.dictionary.Title + '","Url":"' + url + '", "spanStyle":"' + spanStyle + '", "aStyle":"' + aStyle + '", "liStyle":"' + liStyle + '" ';
    }

    function getSQLData(rootUrl, categoryTable, groupTable, linksTable) {
        var categoryUrl = rootUrl + "?tableName=" + categoryTable,
            groupUrl = rootUrl + "?tableName=" + groupTable,
            linksUrl = rootUrl + "?tableName=" + linksTable,
            timeStamp,
            categoryData = null,
            groupData = null,
            linksData = null,
            json = "{";

        if (megaDropdown.config.SQLJSONP) {
            categoryUrl += "&callback=?";
            groupUrl += "&callback=?";
            linksUrl += "&callback=?";
        } else {
            timeStamp = new Date().getTime();
            categoryUrl += "&TIMESTAMP=" + timeStamp;
            groupUrl += "&TIMESTAMP=" + timeStamp;
            linksUrl += "&TIMESTAMP=" + timeStamp;
        }

        log("Category URL for SQL: " + categoryUrl);
        log("Group URL for SQL: " + groupUrl);
        log("Links URL for SQL: " + linksUrl);

        if (megaDropdown.config.SQLJSONP) {
            log("SQL is set to JSONP support");

            $.ajaxSetup({
                async: false,
                dataType: "jsonp"
            });
        } else {
            log("SQL is set to JSON support");

            $.ajaxSetup({
                dataType: "json",
                async: false,
                error: function (jqXHR, textStatus, errorThrown) {
                    logAjaxError("SQLData", jqXHR, textStatus, errorThrown);
                }
            });
        }

        $.when($.getJSON(categoryUrl, function (category_results) {
            categoryData = category_results;
        }),
            $.getJSON(groupUrl, function (group_results) {
                groupData = group_results;
            }),
            $.getJSON(linksUrl, function (link_results) {
                linksData = link_results;
            })).then(function () {
                $.each(categoryData, function (categoryIndex, categoryValue) {
                    if (categoryIndex > 0) {
                        json += ",";
                    }

                    json += createSQLJson(0, categoryIndex, categoryValue);
                    var categoryId = categoryValue.dictionary.ID,
                        groupAdded = 0;

                    $.each(groupData, function (groupIndex, groupValue) {
                        if (groupValue.dictionary.Parent === categoryId) {
                            if (groupAdded === 0) {
                                json += ',"Children":{';
                            } else {
                                json += ',';
                            }

                            json += createSQLJson(1, groupIndex, groupValue);
                            var groupId = groupValue.dictionary.ID,
                                linksAdded = 0;

                            $.each(linksData, function (linksIndex, linksValue) {
                                if (linksValue.dictionary.Parent === groupId) {
                                    if (linksAdded === 0) {
                                        json += ',"Children":{';
                                    } else {
                                        json += ',';
                                    }

                                    json += createSQLJson(2, linksIndex, linksValue) + "}";
                                    linksAdded = linksAdded + 1;
                                }
                            });

                            if (linksAdded > 0) {
                                json += "}";
                            }

                            json += "}";
                            groupAdded = groupAdded + 1;
                        }
                    });

                    if (groupAdded > 0) {
                        json += "}";
                    }

                    json += "}";
                });

                json += "}";
                log("Final SQL JSON" + json);

                dataReceived(json);
            });
    }

    function getSharePointData(rootUrl, categoryName, groupName, linksName, tier, id) {
        log("Getting sharepoint data for tier" + (tier || "No tier") + " and ID " + (id || "No ID"));

        $.support.cors = true;
        $.ajaxSetup({
            dataType: "json",
            async: false,
            error: function (jqXHR, textStatus, errorThrown) {
                logAjaxError("SharePoint", jqXHR, textStatus, errorThrown);
            }
        });

        var url = "",
            unparsedJson = "";

        if (tier === 0) {
            url = rootUrl + categoryName + "?$orderby=Priority desc,Title";
        }

        if (tier === 1) {
            url = rootUrl + groupName + "?$orderby=Priority desc,Title&$filter=ParentId eq " + id;
        }

        if (tier === 2) {
            url = rootUrl + linksName + "?$orderby=Priority desc,Title&$filter=ParentId eq " + id;
        }

        log("SharePoint data source URL: " + url);
        if (url !== "") {
            $.getJSON(url, function (results) {
                if (results.d.results.length > 0) {
                    if (tier > 0) {
                        unparsedJson += ',"Children":{';
                    }
                    var addedCount = 0;
                    $.each(results.d.results, function (index, value) {
                        var targetUrl = "",
                            canAccess = true,
                            aStyle = "",
                            liStyle = "",
                            spanStyle = "";

                        if (value.Link !== null && value.Link !== undefined) {
                            targetUrl = value.Link.substring(value.Link.indexOf(',') + 2);
                            canAccess = accessTest(targetUrl);
                        }

                        if (canAccess) {
                            if (value.AStyle !== null && value.AStyle !== undefined) {
                                aStyle = value.AStyle;
                            }

                            if (value.LiStyle !== null && value.LiStyle !== undefined) {
                                liStyle = value.LiStyle;
                            }

                            if (value.SpanStyle !== null && value.SpanStyle !== undefined) {
                                spanStyle = value.SpanStyle;
                            }

                            if (addedCount > 0) {
                                unparsedJson += ",";
                            }

                            unparsedJson += '"menu' + tier + value.Id + '":{"Label":"' + value.Title + '","Url":"' + targetUrl + '", "spanStyle":"' + spanStyle + '", "aStyle":"' + aStyle + '", "liStyle":"' + liStyle + '" ';
                            if (tier < 2) {
                                unparsedJson += getSharePointData(rootUrl, categoryName, groupName, linksName, tier + 1, value.Id);
                            }

                            unparsedJson += '}';
                            addedCount = addedCount + 1;
                        } else {
                            log("Cannot access: " + targetUrl);
                        }
                    });

                    if (tier > 0) {
                        // for children
                        unparsedJson += "}";
                    }
                }
            });

            log("Unparsed JSON for " + tier + id + " : " + unparsedJson);
        }

        return unparsedJson;
    }

    function getData(rootUrl, categoryName, groupName, linksName) {
        var matchedDataSource = false,
            finalJson = "";

        if (megaDropdown.config.DataSource === "SQL") {
            // async modes
            matchedDataSource = true;
            log("Get SQL Data");
            getSQLData(megaDropdown.config.SQLRootUrl, megaDropdown.config.SQLCategoryTable, megaDropdown.config.SQLGroupTable, megaDropdown.config.SQLLinkTable);
            log("Get SQL Data");
        } else {
            // sync modes
            if (megaDropdown.config.DataSource === "SharePoint") {
                matchedDataSource = true;
                log("Get SharePoint Data");
                finalJson = "{" + getSharePointData(megaDropdown.config.SharePointRootUrl, megaDropdown.config.SharePointCategoryListName, megaDropdown.config.SharePointGroupName, megaDropdown.config.SharePointLinkName, 0, 0) + "}";
                log("Get SharePoint Data");
            }

            if (megaDropdown.config.DataSource === "Mock") {
                matchedDataSource = true;
                log("Get Mock Data");
                finalJson = getMockData();
                log("Get Mock Data");
            }

            if (megaDropdown.config.DataSource === "Direct") {
                matchedDataSource = true;
                log("Get Direct Data");
                finalJson = megaDropdown.config.JSONOverride;
                log("Get Direct Data");
            }

            if (!matchedDataSource) {
                log("The data source selected is incorrect: " + megaDropdown.config.DataSource);
            }

            dataReceived(finalJson);
        }
    }

    function buildMenuStructure(data) {
        var url = "",
            liStyle = "",
            aStyle = "",
            spanStyle = "",
            result = "";

        if (data.Url !== null && data.Url !== undefined && data.Url.length > 0) {
            url = data.Url;

            if (url.indexOf(", ", 0) > 0) {
                log("url cleaning required");
                url = url.substring(0, url.indexOf(", ", 0));
            }
        }

        if (data.liStyle !== null && data.liStyle !== undefined && data.liStyle.length > 0) {
            liStyle = " class='" + data.liStyle + "'";
        }

        if (data.aStyle !== null && data.aStyle !== undefined && data.aStyle.length > 0) {
            aStyle = " class='" + data.aStyle + "'";
        }

        if (data.spanStyle !== null && data.spanStyle !== undefined && data.spanStyle.length > 0) {
            spanStyle = " class='" + data.spanStyle + "'";
        }

        result = "<li " + liStyle + "><a " + aStyle;
        if (url.length > 0) {
            result += " href='" + url + "'";
        }

        result += ">";

        if (spanStyle.length > 0) {
            result += "<span class='" + spanStyle + "'>";
        }

        result += data.Label;

        if (spanStyle.length > 0) {
            result += "</span>";
        }

        result += "</a>";

        if (data.Children !== null && data.Children !== undefined) {
            // have child items
            result += "<ul>";
            $.each(data.Children, function (index, value) {
                result += buildMenuStructure(value);
            });

            result += "</ul>";
        }

        result += "</li>";

        log("Menu structure: " + result);

        return result;
    }

    function buildListStructure(replacementObjectId, data) {
        log("Going to replace " + replacementObjectId);
        log("Building menu HTML - 1");

        var newContent = "<ul class='sf-menu' id='" + replacementObjectId + "'>";

        if (data !== null && data !== undefined) {
            $.each(data, function (index, value) {
                newContent += buildMenuStructure(value);
            });
        }

        newContent += "</ul>" + additionalContent;

        log("Building menu HTML - 2");
        log("Replacement Content: " + newContent);
        $("#" + replacementObjectId).replaceWith(newContent);
    }

    function constructMenu(replacementObjectId) {
        log("kicking off superfish");
        $("#" + replacementObjectId).superfish();
    }

    megaDropdown.build = function (replacementObject) {
        log("MegaDropDown - Build " + megaDropdown.config.version);
        log("Total", "profile");
        log("Will replace object with id: " + replacementObject);
        log("Object found: " + $("#" + replacementObject).attr("id"));
        var browserId = "",
            domStorageData = null,
            mydomstorage = false;

        $.each($.browser, function (i, val) {
            browserId += i + " : " + val + "\n";
        });

        log("Browser: " + browserId);
        log("Host: " + location.hostname + ":" + location.port);


        if (allRequirementsFound()) {
            log("All requirements have been found");
            jqueryReplacementObject = $(document);

            jqueryReplacementObject.one(dataTrigger, function (ev, data) {
                log("Data = " + objectToString(data));
                buildListStructure(replacementObject, data);
                constructMenu(replacementObject);
                log("Total", "profile");
            });

            if (megaDropdown.config.InlineLoggingEnabled) {
                log("Inline logging enabled");
            }

            mydomstorage = window.localStorage || (window.globalStorage ? globalStorage[location.hostname] : null);
            if (mydomstorage) {
                log("Using local storage");

                if (!megaDropdown.config.CachingEnabled) {
                    log("Local storage has been cleared by request");
                    mydomstorage.clear();
                }

                if (mydomstorage.getItem(megaDropdown.config.CacheName) !== null) {
                    domStorageData = mydomstorage.getItem(megaDropdown.config.CacheName);
                    log("Cache store name: " + megaDropdown.config.CacheName);
                    log("Using cached values for menu: " + domStorageData);
                    dataReceived(domStorageData);
                } else {
                    log("Getting values for menu");
                    jqueryReplacementObject.one(storeDataTrigger, function (ev, data) {
                        mydomstorage.setItem(megaDropdown.config.CacheName, data);
                    });

                    getData();
                }
            } else {
                log("No local storage available");
                getData();
            }
        }
    };
}(window.megaDropdown = window.megaDropdown || {}));