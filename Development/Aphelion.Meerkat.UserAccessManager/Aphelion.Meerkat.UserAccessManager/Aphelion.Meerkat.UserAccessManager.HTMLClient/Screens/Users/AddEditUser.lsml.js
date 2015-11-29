/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.AddEditUser.created = function (screen) {
    msls.application.lightswitchTools.configureCaptureForm(screen);

    var Username = screen.findContentItem("UserName");
    var CodeField = screen.findContentItem("UserCode");
    var BusinessKeyField = screen.findContentItem("UserSourceKey");
    Username.dataBind("value", function () {
        if (Username.value !== undefined && Username.value.length > 0) {
            var currentLength = 0;
            if (BusinessKeyField.value !== undefined) {
                currentLength = BusinessKeyField.value.length;
            }
            if (currentLength === 0) {
                BusinessKeyField.value = Username.value;
            }
            currentLength = 0;
            if (CodeField.value !== undefined) {
                currentLength = CodeField.value.length;
            }
            if (currentLength === 0) {
                CodeField.value = Username.value;
            }
        }
    });
};