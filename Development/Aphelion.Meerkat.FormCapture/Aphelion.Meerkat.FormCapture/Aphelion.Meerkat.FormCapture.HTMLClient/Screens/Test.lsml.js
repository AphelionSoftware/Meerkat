/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.Test.Test_render = function (element, contentItem) {
    // Write code here.
    var sel = '<select class="select2-mcq" multiple="multiple"  style="width:300px">\
       <option value="AL">Alabama</option>\
       <option value="WY">Wyoming</option>\
       <option value="FL">Florida</option>\
    <option value="FL">Florida</option>\
     </select>\
    ';

    $(element).html(sel);

    $('select2-mcq').select2();
};