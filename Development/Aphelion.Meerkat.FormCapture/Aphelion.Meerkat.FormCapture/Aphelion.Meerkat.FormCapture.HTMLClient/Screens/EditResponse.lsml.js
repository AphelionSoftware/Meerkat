/// <reference path="~/GeneratedArtifacts/viewModel.js" />

myapp.EditResponse.getTypeCode = function (screen, callback)
{
    if (!myapp.EditResponse.type) {
        screen.Response.getQuestion().then(
            function (Q) {
                Q.getQuestionType().then(
                    function (QT) {
                        myapp.EditResponse.type = QT.Code;
                        if (callback) {
                            callback();
                        }
                    })
            })
    } else {
        if (callback) {
            callback();
        }
    }
}
myapp.EditResponse.created = function (screen) {
    myapp.EditResponse.getTypeCode(screen);
    
};
myapp.EditResponse.Response1_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "TR" || myapp.EditResponse.type == "TXT") {
            $(element).show();
        }
    });

};
myapp.EditResponse.IntegerResponse_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "INT" ) {
            $(element).show();
        }
    });
};
myapp.EditResponse.DecimalResponse_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "DEC" ) {
            $(element).show();
        }
    });
};
myapp.EditResponse.TrueFalse_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "BOOL") {
            $(element).show();
        }
    });

};
myapp.EditResponse.PotentialResponse_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "MCQ" || myapp.EditResponse.type == "RB") {
            $(element).show();
        }
    });

};
myapp.EditResponse.DateResponse_postRender = function (element, contentItem) {
    $(element).hide();
    myapp.EditResponse.getTypeCode(screen, function () {
        if (myapp.EditResponse.type == "DATE") {
            $(element).show();
        }
    });
};